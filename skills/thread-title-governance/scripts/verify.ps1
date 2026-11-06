#requires -Version 7.0
<#
.SYNOPSIS
Checks this Skill's distribution files and default title format examples.
.DESCRIPTION
Run without arguments for package checks and synthetic title cases, or pass
-Title to check one title's shape. This does not read AGENTS.md, apply project
overrides, determine lifecycle status, or access Codex thread tools.
#>
[CmdletBinding()]
param([ValidateNotNullOrEmpty()][string]$Title)

$ErrorActionPreference = 'Stop'

function Test-TitleFormat([string]$Candidate) {
    if ($Candidate -cnotmatch '\A「(?:进行中|已完成|已归档|已挂起|已废弃)」(?<item>[^/｜\r\n]+)(?:/评审复核)?｜(?<topic>[^｜\r\n]+)\z') {
        return $false
    }

    return $Matches.item -ceq $Matches.item.Trim() -and $Matches.topic -ceq $Matches.topic.Trim()
}

if ($PSBoundParameters.ContainsKey('Title')) {
    if (-not (Test-TitleFormat $Title)) {
        throw 'Title does not match the default format.'
    }
    Write-Output 'PASS: default title format'
    return
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$utf8 = [System.Text.UTF8Encoding]::new($false, $true)
foreach ($relativePath in @('SKILL.md', 'agents/openai.yaml', 'LICENSE')) {
    try {
        $content = $utf8.GetString([System.IO.File]::ReadAllBytes((Join-Path $skillRoot $relativePath)))
    }
    catch {
        throw "Cannot read distribution file as UTF-8: $relativePath"
    }
    if ([string]::IsNullOrWhiteSpace($content)) {
        throw "Empty distribution file: $relativePath"
    }
}

$validTitles = @(
    '「进行中」项目治理｜工作区规则整理',
    '「已完成」DEMO-12｜导出格式验证',
    '「已归档」技术调研｜表格导出方案对比',
    '「已挂起」DEMO-34/评审复核｜等待接口样例',
    '「已废弃」架构设计｜旧导出方案'
)
$invalidTitles = @(
    '项目治理｜缺少状态',
    '「idle」项目治理｜客户端空闲',
    '「已成稿」项目治理｜使用项目自定义状态',
    '「已完成」项目治理/技术调研｜组合通用类型',
    '「已完成」topic/example｜分支名进入标题',
    '「已完成」DEMO-12｜',
    '「已完成」DEMO-12｜主题｜额外分隔符'
)

foreach ($candidate in $validTitles) {
    if (-not (Test-TitleFormat $candidate)) {
        throw "Valid title rejected: $candidate"
    }
}
foreach ($candidate in $invalidTitles) {
    if (Test-TitleFormat $candidate) {
        throw "Invalid title accepted: $candidate"
    }
}

$count = $validTitles.Count + $invalidTitles.Count
Write-Output "PASS: distribution files and $count default title format cases"
