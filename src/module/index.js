// Generated by LiveScript 1.4.0
(function(){
  var _, heronModule;
  _ = require('lodash');
  heronModule = (function(){
    heronModule.displayName = 'heronModule';
    var addModule, prototype = heronModule.prototype, constructor = heronModule;
    heronModule._root = '';
    heronModule._before;
    heronModule._after;
    heronModule._module = {};
    function heronModule(_root){
      this._root = _root;
    }
    addModule = function(options){
      return this._module[option.path] = options;
    };
    /**
     * @params: options {
     *   path                  # route dir path
     *   action                # [function] action
     *   before                # [function] before filter
     *   after                 # [function] after filter
     * }
     */
    prototype.get = function(options, action){
      var path, option;
      if (_.isString(option)) {
        path = options;
        option = {};
        option.path = path;
        option.action = action;
        option.method = 'get';
      }
      return addModule(options);
    };
    prototype.post = function(options, action){
      var path, option;
      if (_.isString(option)) {
        path = options;
        option = {};
        option.path = path;
        option.action = action;
        option.method = 'post';
      }
      return addModule(options);
    };
    prototype.put = function(options, action){
      var path, option;
      if (_.isString(option)) {
        path = options;
        option = {};
        option.path = path;
        option.action = action;
        option.method = 'put';
      }
      return addModule(options);
    };
    prototype['delete'] = function(options, action){
      var path, option;
      if (_.isString(option)) {
        path = options;
        option = {};
        option.path = path;
        option.action = action;
        option.method = 'delete';
      }
      return addModule(options);
    };
    return heronModule;
  }());
  module.exports = (heronModule._modules = require(('./_modules'.load = require('./load'), './_modules')), heronModule);
}).call(this);
