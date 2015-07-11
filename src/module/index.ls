require!{
  lodash: _
}

class heron-module
  @_root = ''              # 根目录
  @_before
  @_after
  @_module = {}
  (@_root) ->
  add-module = (options) ->
    @_module.[option.path] = options

  /**
   * @params: options {
   *   path                  # route dir path
   *   action                # [function] action
   *   before                # [function] before filter
   *   after                 # [function] after filter
   * }
   */
  get: (options, action) ->
    if _.isString option
      path = options
      option = {}
      option.path = path
      option.action = action
      option.method = 'get'
    add-module options

  post: (options, action) ->
    if _.isString option
      path = options
      option = {}
      option.path = path
      option.action = action
      option.method = 'post'
    add-module options

  put: (options, action) ->
    if _.isString option
      path = options
      option = {}
      option.path = path
      option.action = action
      option.method = 'put'
    add-module options

  delete: (options, action) ->
    if _.isString option
      path = options
      option = {}
      option.path = path
      option.action = action
      option.method = 'delete'
    add-module options

module.exports = heron-module
  <<< _modules: require './_modules'
  <<< load: require './load'

