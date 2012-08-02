# Openfile.rb
# this script searches the current directory for a filename that matches its
# argument, and opens it. Useful with slickrun for making smarter magic words

file_part = ARGV[0]
file_name = Dir["#{file_part}*"][0] || ''

if !file_name.empty?
  #open the file
  system "AutoHotkey.exe #{file_name}"
end