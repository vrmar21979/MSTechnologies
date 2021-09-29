﻿#Requires -Modules @{ ModuleName="MicrosoftPowerBIMgmt"; ModuleVersion="1.2.1026" }

$VerbosePreference = "SilentlyContinue"
$ErrorActionPreference = "Stop"

$currentPath = (Split-Path $MyInvocation.MyCommand.Definition –Parent)

Import-Module "$currentPath\Modules\PBIDevOps" -Force

$projectPath = "$currentPath\SampleProject"
$configPath = "$currentPath\config.json"

Connect-PowerBIServiceAccount

# Deploy Workspaces

Publish-PBIWorkspaces -configPath $configPath

# Deploy Datasets

Publish-PBIDataSets -configPath $configPath -path "$projectPath\DataSets"

# Deploy Reports

Publish-PBIReports -configPath $configPath -path "$projectPath\Reports"

# Deploy PaginatedReports

Publish-PBIReports -configPath $configPath -path "$projectPath\PaginatedReports"