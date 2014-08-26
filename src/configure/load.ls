require! {
  fs
  path
  'lodash': _
}
/**
* @params: path     # path
*/
module.exports = (dir) ->
  root = process.cwd()

  if !dir
    dir = path.join root, 'configure'
    console.warn "warn: please set dir or load default -> dir: #{dir}"

  getConfigureFileSync = (dir) ->
    files = fs.readdirSync dir
    configure_files = _.filter files, (item) -> /.*(?=\.json)/i.test item
    configures = _.map configure_files, (item) ->
      item

  configures = getConfigureFileSync dir
  if !configures
    throw new Error("can not read configure directory: #{dir}")

  results = {}
  for item in configures
    configure = require path.join dir, item
    results <<< "#{item.replace /\..*/i, ''}": configure
  results