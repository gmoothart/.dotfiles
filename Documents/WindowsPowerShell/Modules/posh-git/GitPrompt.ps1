# Inspired by Mark Embling
# http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration

$global:GitPromptSettings = New-Object PSObject -Property @{
    BeforeText                = '['
    BeforeForegroundColor     = [ConsoleColor]::Yellow
    BeforeBackgroundColor     = $Host.UI.RawUI.BackgroundColor    
    DelimText                 = ' '
    DelimForegroundColor      = [ConsoleColor]::Yellow
    DelimBackgroundColor      = $Host.UI.RawUI.BackgroundColor

    
    AfterText                 = ']'
    AfterForegroundColor      = [ConsoleColor]::Yellow
    AfterBackgroundColor      = $Host.UI.RawUI.BackgroundColor
    
    Branch1ForegroundColor    = [ConsoleColor]::Yellow
    Branch1BackgroundColor    = $Host.UI.RawUI.BackgroundColor
    Branch2ForegroundColor    = [ConsoleColor]::Cyan
    Branch2BackgroundColor    = $Host.UI.RawUI.BackgroundColor
    
    BeforeIndexText           = ""
    BeforeIndexForegroundColor= [ConsoleColor]::Blue
    BeforeIndexBackgroundColor= $Host.UI.RawUI.BackgroundColor
    
    IndexForegroundColor      = [ConsoleColor]::Blue
    IndexBackgroundColor      = $Host.UI.RawUI.BackgroundColor
    
    WorkingForegroundColor    = [ConsoleColor]::Yellow
    WorkingBackgroundColor    = $Host.UI.RawUI.BackgroundColor
    
    UntrackedText             = '!'
    UntrackedForegroundColor  = [ConsoleColor]::Yellow
    UntrackedBackgroundColor  = $Host.UI.RawUI.BackgroundColor
    
    ShowStatusWhenZero        = $true
    
    AutoRefreshIndex          = $true

    EnablePromptStatus        = $true
}

function Write-GitStatus($status) {
    if ($status) {
        $s = $global:GitPromptSettings
        
        $currentBranch = $status.Branch
        
        Write-Host $s.BeforeText -NoNewline -BackgroundColor $s.BeforeBackgroundColor -ForegroundColor $s.BeforeForegroundColor

        # current commit
        Write-Host $status.Commit -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.WorkingForegroundColor

        # delim
        Write-Host $s.DelimText -NoNewline -BackgroundColor $s.DelimBackgroundColor -ForegroundColor $s.DelimForegroundColor



        if ($status.AheadBy -eq 0) {
            # We are not ahead of origin
            Write-Host $currentBranch -NoNewline -BackgroundColor $s.Branch1BackgroundColor -ForegroundColor $s.Branch1ForegroundColor
        } else {
            # We are ahead of origin
            Write-Host $currentBranch -NoNewline -BackgroundColor $s.Branch2BackgroundColor -ForegroundColor $s.Branch2ForegroundColor
        }
        
        if($status.HasWorking -or $status.HasIndex) {
            Write-Host "*" -NoNewline -BackgroundColor $s.WorkingBackgroundColor -ForegroundColor $s.WorkingForegroundColor
        }

        if ($status.HasUntracked) {
            Write-Host $s.UntrackedText -NoNewline -BackgroundColor $s.UntrackedBackgroundColor -ForegroundColor $s.UntrackedForegroundColor
        } 
        
        Write-Host $s.AfterText -NoNewline -BackgroundColor $s.AfterBackgroundColor -ForegroundColor $s.AfterForegroundColor
    }
}
