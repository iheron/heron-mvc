require! {
  path
  './_modules'
}
exports.route = (next) ->
  ms = []
  for module in _modules
    for m in module._module
      ms.push { path: (path.join module._root || '', m.path), method: m.method, action: m.action, before: module.before, after: module.after }
  next ms