
Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)


Import-Module Pscx
Import-Module posh-git


function prompt {

    $status_string = ""
    #$default_forecolor = (Get-Host).UI.RawUI.ForegroundColor 

    # 
    # mark administrator
    #
    $pathColor = "green"
    if ($pscx:isadmin -and (-not $psISE)) {
      $pathColor = "red"
    }

    Write-Host $(get-location) -nonewline -foregroundcolor $pathColor

    # Git Prompt
    if($Global:GitPromptSettings.EnablePromptStatus) {
        $Global:GitStatus = Get-GitStatus
        Write-GitStatus $GitStatus
    }

    # make sure the foreground color hasn't changed
    $Host.UI.RawUI.ForegroundColor = "Gray"

    #
    # print out prompt
    #
    Write-Host $status_string -nonewline -foregroundcolor Yellow
    return "`n>"
}


if(-not (Test-Path Function:\DefaultTabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include git expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # Execute git tab completion for all git-related commands
        'git (.*)' { GitTabExpansion $lastBlock }
        # Fall back on existing tab expansion
        default { DefaultTabExpansion $line $lastWord }
    }
}

Enable-GitColors

Pop-Location
