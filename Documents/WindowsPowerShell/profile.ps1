
Import-Module Pscx


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

        $status_string += "[" + $git_br + $dirty_char + "]"
    }

    #
    # print out prompt
    #
    Write-Host $(get-location) -nonewline -foregroundcolor $pathColor
    Write-Host $status_string -nonewline -foregroundcolor Yellow
    Write-Host (">") -nonewline 
    return " "
 }
