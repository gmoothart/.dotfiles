
Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)


Import-Module Pscx
Import-Module C:\dev\posh-git\posh-git


function prompt {

    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    #
    # mark administrator
    #
    $pathColor = "green"
    if ($pscx:isadmin -and (-not $psISE)) {
      $pathColor = "red"
    }

    Write-Host ($pwd) -nonewline -foregroundcolor $pathColor


    #Prompt formatting, among other things, can be customized using `$GitPromptSettings`, `$GitTabSettings` and `$TortoiseGitSettings`.
    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "`n> "
}


Enable-GitColors

Pop-Location
