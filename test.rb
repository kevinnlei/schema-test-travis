require 'open3'
stdin, stdout, stderr = Open3.popen3('./rebuild_cold')
error = stderr.read
if error.empty?
  p 'Success!'
  p stdout.read
  exit 0
else
  p "Error in Rebuild Script: #{error}"
  p stdout.read
  exit 1
end