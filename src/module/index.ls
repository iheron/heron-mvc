require!{
  lodash: _
}

class heron-module

  (@_root) ->
    @_module = []

  /**
   * @params: options {
   *   path                  # route dir path
   *   action                # [function] action
   *   before                # [function] before filter
   *   after                 # [function] after filter
   * }
   */
  head: (options, action) ~>
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      options.method = 'head'
    @_module.push options
    @

  options: (options, action) ~>
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      options.method = 'options'
    @_module.push options
    @

  patch: (options, action) ~>
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      options.method = 'patch'
    @_module.push options
    @

  get: (options, action) ~>
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      options.method = 'get'
    @_module.push options
    @

  post: (options, action) ->
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      options.method = 'post'
    @_module.push options
    @

  put: (options, action) ->
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      options.method = 'put'
    @_module.[options.path] = options
    @

  delete: (options, action) ->
    if _.isString options
      path = options
      options = {}
      options.path = path
      options.action = action
      optiosn.method = 'delete'

    @_module.[options.path] = options
    @
module.exports = heron-module

