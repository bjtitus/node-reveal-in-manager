{spawn} = require 'child_process'


module.exports = (path, callback) ->

  console.log escape(path)

  switch process.platform
    when 'darwin'
      child = spawn "open", ['-R', path]
    when 'win32'
      child = spawn "Explorer", ['/select,' + path]
    else
      child = spawn "xdg-open", [path]

  stderr = ''
  child.stderr.on 'data', (data) -> stderr += data
  if callback
    child.on 'close', (code) ->
      if code is 0
        callback null
      else
        callback stderr

escape = (string) ->
  return '"' + string.replace(/"/g, '\\\"') + '"'
