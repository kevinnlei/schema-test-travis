require 'open3'

# Simple test script which does a cold rebuild of the db, apply
# scripts, and reads from stderr. Allows for explicit return
# of exit code.

stdin, stdout, stderr = Open3.popen3('./rebuild_cold')
error = stderr.read
if error.empty?
  p 'Success!'
  p stdout.read
  exit 0
else
  p "Error in applying schema change: #{error}"
  p stdout.read
  exit 1
end