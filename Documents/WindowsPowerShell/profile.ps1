
Import-Module Pscx


function prompt {

    Write-Host("")
    $status_string = ""
    $forecolor = (Get-Host).UI.RawUI.ForegroundColor

    # 
    # mark administrator
    #
    if ($pscx:isadmin -and (-not $psISE)) {
      $status_string += "ADMIN "
    }

    #
    # Add git prompt
    # http://stackoverflow.com/questions/1287718/how-can-i-display-my-current-git-branch-name-in-my-powershell-prompt/1287895#1287895
    #
    $symbolicref = git symbolic-ref HEAD
    if($symbolicref -ne $NULL) {
        $status_string += "GIT [" + $symbolicref.substring($symbolicref.LastIndexOf("/") +1) + "] "

        # change prompt color if changes
        $differences = (git diff-index --name-status HEAD)
        if ($differences) {
          $forecolor = "yellow"
        }
    }
    else {
        $status_string += "PS "
    }

    #
    # print out prompt
    #
    Write-Host ($status_string + $(get-location) + "`n>") -nonewline -foregroundcolor $forecolor
    return " "
 }
