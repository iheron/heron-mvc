// Generated by LiveScript 1.4.0
(function(){
  var fs, path, _, _modules;
  fs = require('fs');
  path = require('path');
  _ = require('lodash');
  _modules = require('./_modules');
  module.exports = function(dir){
    var files, moduleFiles, i$, len$, m, heronModule, results$ = [];
    files = fs.readdirSync(dir);
    moduleFiles = _.union(_.map(files, function(m){
      return m.replace(/\..*/i, '');
    }));
    for (i$ = 0, len$ = moduleFiles.length; i$ < len$; ++i$) {
      m = moduleFiles[i$];
      heronModule = require(path.join(dir, m));
      results$.push(_modules.push(heronModule));
    }
    return results$;
  };
}).call(this);