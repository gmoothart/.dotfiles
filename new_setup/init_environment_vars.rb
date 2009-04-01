=begin
Set things up. If you store all your parameters in batch.yaml, you will not
even have to edit this file
=end

require 'yaml'
require 'optparse'
require 'erb'
require 'pp'
require 'fileutils'

##### Settings #####

# Add these to the system path
paths = ["C:\\Program Files\\Windows Resource Kits\\Tools", 
         "c:\\gabe\\settings\\SciTE", 
         "c:\\utils\\SysinternalsSuite",
         "C:\\Program Files\\7-Zip", 
         "C:\\utils\\reflector",
         "C:\\utils\\IronPython", 
         #"C:\\WINDOWS\\Microsoft.NET\\Framework\\v1.1.4322",
         #"C:\\WINDOWS\\Microsoft.NET\\Framework\\v2.0.50727",
         "C:\\WINDOWS\\Microsoft.NET\\Framework\\v3.5",
         #only keep the most recent sdk dir
         "C:\\Program Files\\Microsoft Visual Studio 8\\SDK\\v2.0\\Bin",
         "C:\\utils\\MPlayer",
         "C:\\gabe\\cygwin\\bin",
         "C:\\utils\\ctags",
         "C:\\Program Files\\Vim\\vim72"
         ]
         
# new environment variables
new_vars = { 
             #Don't need right now, and it confuses msbuild in vim
             #:MSBuildEmitSolution => "1", 
             :SVN_EDITOR => "C:\\gabe\\settings\\SciTE\\SciTE.exe",
             :PROMPT => "$p$_$+$g",
             #for unixy-stuff on windows
             :HOME => "C:\\gabe\\settings\\home"
           }


# miscellaneous stand-alone commands
cmds = ["C:\\utils\\reflector\\reflector.exe /register",
		"vs_hacks.reg",
		"stop_restart_prompt.reg",
        #These two register hamachi as a service
        #"WinXP_Hamachi_service_config.reg",
        #"HamachiAsSvc.bat"
       ]

##### erb batch file script #####
batch_str = <<-EOF
REM Add to the system path
pathman /as <%= paths.map{|p| '"' + p + '"'}.join(";") %>

REM Set other environment variables.
<% new_vars.each do |key, val| %>
setx <%=key%> <%=val%>
<% end %>

<% cmds.each do |cmd| %>
<%=cmd%>
<% end %>
pause
EOF

##### put it all together #####
batch_file = ERB.new( batch_str ).result

#generate a temporary batch file, and execute it
fn = File.join(ENV['TMP'], "true.bat")
File.open(fn, "w") do |aFile|
  aFile.write(batch_file)
end

#execute the batch file
exec fn
