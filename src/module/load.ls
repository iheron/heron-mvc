require! {
  fs
  path
  lodash: _
  './_modules'
}
module.exports = (dir) ->
  files = fs.readdirSync dir
  module-files = _.union _.map files, (m) -> m.replace /\..*/i, ''

  for m in module-files
    heron-module = require path.join dir, m
    _modules.push heron-module