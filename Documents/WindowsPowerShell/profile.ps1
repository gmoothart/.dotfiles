
function get-isadmin {
  $windowsIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $windowsPrincipal = new-object 'System.Security.Principal.WindowsPrincipal' $windowsIdentity

  return $windowsPrincipal.IsInRole("Administrators")


}


#
# Show admin console as tark red
#
if ((get-isadmin) -and (-not $psISE)) {
    $Host.UI.RawUI.BackgroundColor = "DarkRed"
    clear
}



# Add git prompt!
#http://stackoverflow.com/questions/1287718/how-can-i-display-my-current-git-branch-name-in-my-powershell-prompt/1287895#1287895