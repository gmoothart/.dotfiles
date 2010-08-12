
Import-Module Pscx


function prompt {

    Write-Host("")
    $status_string = ""
    $default_forecolor = (Get-Host).UI.RawUI.ForegroundColor 
    $forecolor = $default_forecolor

    # 
    # mark administrator
    #
    if ($pscx:isadmin -and (-not $psISE)) {
      $forecolor = "red"
    }

    #
    # Add git prompt
    # http://stackoverflow.com/questions/1287718/how-can-i-display-my-current-git-branch-name-in-my-powershell-prompt/1287895#1287895
    #
    $symbolicref = git symbolic-ref HEAD
    if($symbolicref -ne $NULL) {
        $git_br = $symbolicref.substring($symbolicref.LastIndexOf("/") + 1)

        $differences = (git diff-index --name-status HEAD)

        $dirty_char = ""
        if ($differences) {
          $dirty_char = "*"
        }

        $status_string += "GIT [" + $git_br + $dirty_char + "] "
    }
    else {
        $status_string += "PS "
    }

    #
    # print out prompt
    #
    Write-Host ($status_string + $(get-location)) -nonewline -foregroundcolor $forecolor
    Write-Host ("`n>") -nonewline 
    return " "
 }
