# stop all AutoHotKey processes

require 'sys/proctable'
require 'time'

proc_name = "AutoHotKey.exe"

Sys::ProcTable.ps.each { |ps|
  if ps.name.downcase == proc_name.downcase
    Process.kill('KILL', ps.pid)
  end
}