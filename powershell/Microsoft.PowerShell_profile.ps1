# Import module from previous step
Import-Module Get-ChildItemColor
cd $HOME

# You can use "cd $repos.<name>" to quickly navigate
$repos = @{
    github = 'C:\Users\thomas.ortiz\Documents\Github'
    presentation = 'D:\code\Products\FENext\WebFront\DEV\FinancialEdge\Project\Presentation'
}

function Prompt {
    $Time = Get-Date -Format "hh:mm tt"
    $Directory = (Get-Location).Path.Replace($HOME, "~")

    Write-Host ""
    Write-Host "[$Time] " -ForegroundColor Yellow -NoNewline
    Write-Host "$($pwd.path)" -ForeGroundColor Cyan
    #Write-Host "$Directory " -ForeGroundColor Cyan
    return ""
}

Set-Alias ls Get-ChildItemColorFormatWide -option AllScope -Force
Set-Alias dir Get-ChildItemColor -option AllScope -Force
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function RunNpmListGlobal() {
    npm list -g --depth=0
}

function RunNpmList() {
    npm list --depth=0
}

Set-Alias ng RunNpmListGlobal
Set-Alias nl RunNpmList
