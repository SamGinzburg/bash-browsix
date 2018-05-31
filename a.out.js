// The Module object: Our interface to the outside world. We import
// and export values on it, and do the work to get that through
// closure compiler if necessary. There are various ways Module can be used:
// 1. Not defined. We create it here
// 2. A function parameter, function(Module) { ..generated code.. }
// 3. pre-run appended it, var Module = {}; ..generated code..
// 4. External script tag defines var Module.
// We need to do an eval in order to handle the closure compiler
// case, where this code here is minified but Module was defined
// elsewhere (e.g. case 4 above). We also need to check if Module
// already exists (e.g. case 3 above).
// Note that if you want to run closure, and also to use Module
// after the generated code, you will need to define   var Module = {};
// before the code. Then that object will be used in the code, and you
// can continue to use Module afterwards as well.
var Module;
if (!Module) Module = (typeof Module !== 'undefined' ? Module : null) || {};

// Sometimes an existing Module object exists with properties
// meant to overwrite the default module functionality. Here
// we collect those properties and reapply _after_ we configure
// the current environment's defaults to avoid having to be so
// defensive during initialization.
var moduleOverrides = {};
for (var key in Module) {
  if (Module.hasOwnProperty(key)) {
    moduleOverrides[key] = Module[key];
  }
}

// The environment setup code below is customized to use Module.
// *** Environment setup code ***
var ENVIRONMENT_IS_WEB = false;
var ENVIRONMENT_IS_WORKER = false;
var ENVIRONMENT_IS_NODE = false;
var ENVIRONMENT_IS_SHELL = false;
var ENVIRONMENT_IS_BROWSIX = false;

// Three configurations we can be running in:
// 1) We could be the application main() thread running in the main JS UI thread. (ENVIRONMENT_IS_WORKER == false and ENVIRONMENT_IS_PTHREAD == false)
// 2) We could be the application main() thread proxied to worker. (with Emscripten -s PROXY_TO_WORKER=1) (ENVIRONMENT_IS_WORKER == true, ENVIRONMENT_IS_PTHREAD == false)
// 3) We could be an application pthread running in a worker. (ENVIRONMENT_IS_WORKER == true and ENVIRONMENT_IS_PTHREAD == true)

if (Module['ENVIRONMENT']) {
  if (Module['ENVIRONMENT'] === 'WEB') {
    ENVIRONMENT_IS_WEB = true;
  } else if (Module['ENVIRONMENT'] === 'WORKER') {
    ENVIRONMENT_IS_WORKER = true;
  } else if (Module['ENVIRONMENT'] === 'NODE') {
    ENVIRONMENT_IS_NODE = true;
  } else if (Module['ENVIRONMENT'] === 'SHELL') {
    ENVIRONMENT_IS_SHELL = true;
  } else {
    throw new Error('The provided Module[\'ENVIRONMENT\'] value is not valid. It must be one of: WEB|WORKER|NODE|SHELL.');
  }
} else {
  ENVIRONMENT_IS_WEB = typeof window === 'object';
  ENVIRONMENT_IS_WORKER = typeof importScripts === 'function';
  ENVIRONMENT_IS_NODE = typeof process === 'object' && typeof require === 'function' && !ENVIRONMENT_IS_WEB && !ENVIRONMENT_IS_WORKER;
  ENVIRONMENT_IS_SHELL = !ENVIRONMENT_IS_WEB && !ENVIRONMENT_IS_NODE && !ENVIRONMENT_IS_WORKER;
  ENVIRONMENT_IS_BROWSIX = ENVIRONMENT_IS_WORKER;
  ENVIRONMENT_IS_WORKER = false;
}


if (ENVIRONMENT_IS_NODE) {
  // Expose functionality in the same simple way that the shells work
  // Note that we pollute the global namespace here, otherwise we break in node
  if (!Module['print']) Module['print'] = console.log;
  if (!Module['printErr']) Module['printErr'] = console.warn;

  var nodeFS;
  var nodePath;

  Module['read'] = function shell_read(filename, binary) {
    if (!nodeFS) nodeFS = require('fs');
    if (!nodePath) nodePath = require('path');
    filename = nodePath['normalize'](filename);
    var ret = nodeFS['readFileSync'](filename);
    return binary ? ret : ret.toString();
  };

  Module['readBinary'] = function readBinary(filename) {
    var ret = Module['read'](filename, true);
    if (!ret.buffer) {
      ret = new Uint8Array(ret);
    }
    assert(ret.buffer);
    return ret;
  };

  Module['load'] = function load(f) {
    globalEval(read(f));
  };

  if (!Module['thisProgram']) {
    if (process['argv'].length > 1) {
      Module['thisProgram'] = process['argv'][1].replace(/\\/g, '/');
    } else {
      Module['thisProgram'] = 'unknown-program';
    }
  }

  Module['arguments'] = process['argv'].slice(2);

  if (typeof module !== 'undefined') {
    module['exports'] = Module;
  }

  process['on']('uncaughtException', function(ex) {
    // suppress ExitStatus exceptions from showing an error
    if (!(ex instanceof ExitStatus)) {
      throw ex;
    }
  });

  Module['inspect'] = function () { return '[Emscripten Module object]'; };
}
else if (ENVIRONMENT_IS_SHELL) {
  if (!Module['print']) Module['print'] = print;
  if (typeof printErr != 'undefined') Module['printErr'] = printErr; // not present in v8 or older sm

  if (typeof read != 'undefined') {
    Module['read'] = read;
  } else {
    Module['read'] = function shell_read() { throw 'no read() available' };
  }

  Module['readBinary'] = function readBinary(f) {
    if (typeof readbuffer === 'function') {
      return new Uint8Array(readbuffer(f));
    }
    var data = read(f, 'binary');
    assert(typeof data === 'object');
    return data;
  };

  if (typeof scriptArgs != 'undefined') {
    Module['arguments'] = scriptArgs;
  } else if (typeof arguments != 'undefined') {
    Module['arguments'] = arguments;
  }

  if (typeof quit === 'function') {
    Module['quit'] = function(status, toThrow) {
      quit(status);
    }
  }

}
else if (ENVIRONMENT_IS_WEB || ENVIRONMENT_IS_WORKER || ENVIRONMENT_IS_BROWSIX) {
  Module['read'] = function shell_read(url) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, false);
    xhr.send(null);
    return xhr.responseText;
  };

  if (ENVIRONMENT_IS_WORKER) {
    Module['readBinary'] = function readBinary(url) {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', url, false);
      xhr.responseType = 'arraybuffer';
      xhr.send(null);
      return new Uint8Array(xhr.response);
    };
  }

  Module['readAsync'] = function readAsync(url, onload, onerror) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'arraybuffer';
    xhr.onload = function xhr_onload() {
      if (xhr.status == 200 || (xhr.status == 0 && xhr.response)) { // file URLs can return 0
        onload(xhr.response);
      } else {
        onerror();
      }
    };
    xhr.onerror = onerror;
    xhr.send(null);
  };

  if (typeof arguments != 'undefined') {
    Module['arguments'] = arguments;
  }

  if (typeof console !== 'undefined') {
    if (!Module['print']) Module['print'] = function shell_print(x) {
      console.log(x);
    };
    if (!Module['printErr']) Module['printErr'] = function shell_printErr(x) {
      if (ENVIRONMENT_IS_BROWSIX)
        debugger;
      console.warn(x);
    };
  } else {
    // Probably a worker, and without console.log. We can do very little here...
    var TRY_USE_DUMP = false;
    if (!Module['print']) Module['print'] = (TRY_USE_DUMP && (typeof(dump) !== "undefined") ? (function(x) {
      dump(x);
    }) : (function(x) {
      // self.postMessage(x); // enable this if you want stdout to be sent as messages
    }));
  }

  if (ENVIRONMENT_IS_WORKER) {
    Module['load'] = importScripts;
  }

  if (typeof Module['setWindowTitle'] === 'undefined') {
    Module['setWindowTitle'] = function(title) { document.title = title };
  }
}
else {
  // Unreachable because SHELL is dependant on the others
  throw 'Unknown runtime environment. Where are we?';
}

function globalEval(x) {
  eval.call(null, x);
}
if (!Module['load'] && Module['read']) {
  Module['load'] = function load(f) {
    globalEval(Module['read'](f));
  };
}
if (!Module['print']) {
  Module['print'] = function(){};
}
if (!Module['printErr']) {
  Module['printErr'] = Module['print'];
}
if (!Module['arguments']) {
  Module['arguments'] = [];
}
if (!Module['thisProgram']) {
  Module['thisProgram'] = './this.program';
}
if (!Module['quit']) {
  Module['quit'] = function(status, toThrow) {
    throw toThrow;
  }
}

// *** Environment setup code ***

// Closure helpers
Module.print = Module['print'];
Module.printErr = Module['printErr'];

// Callbacks
Module['preRun'] = [];
Module['postRun'] = [];

// Merge back in the overrides
for (var key in moduleOverrides) {
  if (moduleOverrides.hasOwnProperty(key)) {
    Module[key] = moduleOverrides[key];
  }
}
// Free the object hierarchy contained in the overrides, this lets the GC
// reclaim data used e.g. in memoryInitializerRequest, which is a large typed array.
moduleOverrides = undefined;



// {{PREAMBLE_ADDITIONS}}

// === Preamble library stuff ===

// Documentation for the public APIs defined in this file must be updated in:
//    site/source/docs/api_reference/preamble.js.rst
// A prebuilt local version of the documentation is available at:
//    site/build/text/docs/api_reference/preamble.js.txt
// You can also build docs locally as HTML or other formats in site/
// An online HTML version (which may be of a different version of Emscripten)
//    is up at http://kripken.github.io/emscripten-site/docs/api_reference/preamble.js.html

//========================================
// Runtime code shared with compiler
//========================================

var Runtime = {
  setTempRet0: function (value) {
    tempRet0 = value;
    return value;
  },
  getTempRet0: function () {
    return tempRet0;
  },
  stackSave: function () {
    return STACKTOP;
  },
  stackRestore: function (stackTop) {
    STACKTOP = stackTop;
  },
  getNativeTypeSize: function (type) {
    switch (type) {
      case 'i1': case 'i8': return 1;
      case 'i16': return 2;
      case 'i32': return 4;
      case 'i64': return 8;
      case 'float': return 4;
      case 'double': return 8;
      default: {
        if (type[type.length-1] === '*') {
          return Runtime.QUANTUM_SIZE; // A pointer
        } else if (type[0] === 'i') {
          var bits = parseInt(type.substr(1));
          assert(bits % 8 === 0);
          return bits/8;
        } else {
          return 0;
        }
      }
    }
  },
  getNativeFieldSize: function (type) {
    return Math.max(Runtime.getNativeTypeSize(type), Runtime.QUANTUM_SIZE);
  },
  STACK_ALIGN: 16,
  prepVararg: function (ptr, type) {
    if (type === 'double' || type === 'i64') {
      // move so the load is aligned
      if (ptr & 7) {
        assert((ptr & 7) === 4);
        ptr += 4;
      }
    } else {
      assert((ptr & 3) === 0);
    }
    return ptr;
  },
  getAlignSize: function (type, size, vararg) {
    // we align i64s and doubles on 64-bit boundaries, unlike x86
    if (!vararg && (type == 'i64' || type == 'double')) return 8;
    if (!type) return Math.min(size, 8); // align structures internally to 64 bits
    return Math.min(size || (type ? Runtime.getNativeFieldSize(type) : 0), Runtime.QUANTUM_SIZE);
  },
  dynCall: function (sig, ptr, args) {
    if (args && args.length) {
      assert(args.length == sig.length-1);
      assert(('dynCall_' + sig) in Module, 'bad function pointer type - no table for sig \'' + sig + '\'');
      return Module['dynCall_' + sig].apply(null, [ptr].concat(args));
    } else {
      assert(sig.length == 1);
      assert(('dynCall_' + sig) in Module, 'bad function pointer type - no table for sig \'' + sig + '\'');
      return Module['dynCall_' + sig].call(null, ptr);
    }
  },
  functionPointers: [],
  addFunction: function (func) {
    for (var i = 0; i < Runtime.functionPointers.length; i++) {
      if (!Runtime.functionPointers[i]) {
        Runtime.functionPointers[i] = func;
        return 2*(1 + i);
      }
    }
    throw 'Finished up all reserved function pointers. Use a higher value for RESERVED_FUNCTION_POINTERS.';
  },
  removeFunction: function (index) {
    Runtime.functionPointers[(index-2)/2] = null;
  },
  warnOnce: function (text) {
    if (!Runtime.warnOnce.shown) Runtime.warnOnce.shown = {};
    if (!Runtime.warnOnce.shown[text]) {
      Runtime.warnOnce.shown[text] = 1;
      Module.printErr(text);
    }
  },
  funcWrappers: {},
  getFuncWrapper: function (func, sig) {
    if (!func) return; // on null pointer, return undefined
    assert(sig);
    if (!Runtime.funcWrappers[sig]) {
      Runtime.funcWrappers[sig] = {};
    }
    var sigCache = Runtime.funcWrappers[sig];
    if (!sigCache[func]) {
      // optimize away arguments usage in common cases
      if (sig.length === 1) {
        sigCache[func] = function dynCall_wrapper() {
          return Runtime.dynCall(sig, func);
        };
      } else if (sig.length === 2) {
        sigCache[func] = function dynCall_wrapper(arg) {
          return Runtime.dynCall(sig, func, [arg]);
        };
      } else {
        // general case
        sigCache[func] = function dynCall_wrapper() {
          return Runtime.dynCall(sig, func, Array.prototype.slice.call(arguments));
        };
      }
    }
    return sigCache[func];
  },
  getCompilerSetting: function (name) {
    throw 'You must build with -s RETAIN_COMPILER_SETTINGS=1 for Runtime.getCompilerSetting or emscripten_get_compiler_setting to work';
  },
  stackAlloc: function (size) { var ret = STACKTOP;STACKTOP = (STACKTOP + size)|0;STACKTOP = (((STACKTOP)+15)&-16);(assert((((STACKTOP|0) < (STACK_MAX|0))|0))|0); return ret; },
  staticAlloc: function (size) { var ret = STATICTOP;STATICTOP = (STATICTOP + (assert(!staticSealed),size))|0;STATICTOP = (((STATICTOP)+15)&-16); return ret; },
  dynamicAlloc: function (size) { assert(DYNAMICTOP_PTR);var ret = HEAP32[DYNAMICTOP_PTR>>2];var end = (((ret + size + 15)|0) & -16);HEAP32[DYNAMICTOP_PTR>>2] = end;if (end >= TOTAL_MEMORY) {var success = enlargeMemory();if (!success) {HEAP32[DYNAMICTOP_PTR>>2] = ret;return 0;}}return ret;},
  alignMemory: function (size,quantum) { var ret = size = Math.ceil((size)/(quantum ? quantum : 16))*(quantum ? quantum : 16); return ret; },
  makeBigInt: function (low,high,unsigned) { var ret = (unsigned ? ((+((low>>>0)))+((+((high>>>0)))*4294967296.0)) : ((+((low>>>0)))+((+((high|0)))*4294967296.0))); return ret; },
  GLOBAL_BASE: 8,
  QUANTUM_SIZE: 4,
  __dummy__: 0
}



Module["Runtime"] = Runtime;

var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var OnceEmitter = (function () {
    function OnceEmitter() {
        this.listeners = {};
    }
    OnceEmitter.prototype.once = function (event, cb) {
        var cbs = this.listeners[event];
        if (!cbs)
            cbs = [cb];
        else
            cbs.push(cb);
        this.listeners[event] = cbs;
    };
    OnceEmitter.prototype.emit = function (event) {
        var args = [];
        for (var _i = 1; _i < arguments.length; _i++) {
            args[_i - 1] = arguments[_i];
        }
        var cbs = this.listeners[event];
        this.listeners[event] = [];
        if (!cbs)
            return;
        for (var i = 0; i < cbs.length; i++) {
            cbs[i].apply(null, args);
        }
    };
    return OnceEmitter;
})();
var Process = (function (_super) {
    __extends(Process, _super);
    function Process(argv, environ) {
        _super.call(this);
        this.argv = argv;
        this.env = environ;
        this.syscall = null;
        this.isReady = false;
    }
    Process.prototype.exit = function (code) {
        //Module['noExitRuntime'] = false;
        if (code === void 0) { code = 0; }
        BROWSIX.browsix.syscall.exit(code);
    };
    return Process;
})(OnceEmitter);

if (ENVIRONMENT_IS_BROWSIX)
  Runtime['process'] = Runtime.process = new Process(null, null);



//========================================
// Runtime essentials
//========================================

var ABORT = 0; // whether we are quitting the application. no code should run after this. set in exit() and abort()
var EXITSTATUS = 0;

/** @type {function(*, string=)} */
function assert(condition, text) {
  if (!condition) {
    abort('Assertion failed: ' + text);
  }
}

var globalScope = this;

// Returns the C function with a specified identifier (for C++, you need to do manual name mangling)
function getCFunc(ident) {
  var func = Module['_' + ident]; // closure exported function
  if (!func) {
    try { func = eval('_' + ident); } catch(e) {}
  }
  assert(func, 'Cannot call unknown function ' + ident + ' (perhaps LLVM optimizations or closure removed it?)');
  return func;
}

var cwrap, ccall;
(function(){
  var JSfuncs = {
    // Helpers for cwrap -- it can't refer to Runtime directly because it might
    // be renamed by closure, instead it calls JSfuncs['stackSave'].body to find
    // out what the minified function name is.
    'stackSave': function() {
      Runtime.stackSave()
    },
    'stackRestore': function() {
      Runtime.stackRestore()
    },
    // type conversion from js to c
    'arrayToC' : function(arr) {
      var ret = Runtime.stackAlloc(arr.length);
      writeArrayToMemory(arr, ret);
      return ret;
    },
    'stringToC' : function(str) {
      var ret = 0;
      if (str !== null && str !== undefined && str !== 0) { // null string
        // at most 4 bytes per UTF-8 code point, +1 for the trailing '\0'
        var len = (str.length << 2) + 1;
        ret = Runtime.stackAlloc(len);
        stringToUTF8(str, ret, len);
      }
      return ret;
    }
  };
  // For fast lookup of conversion functions
  var toC = {'string' : JSfuncs['stringToC'], 'array' : JSfuncs['arrayToC']};

  // C calling interface.
  ccall = function ccallFunc(ident, returnType, argTypes, args, opts) {
    var func = getCFunc(ident);
    var cArgs = [];
    var stack = 0;
    assert(returnType !== 'array', 'Return type should not be "array".');
    if (args) {
      for (var i = 0; i < args.length; i++) {
        var converter = toC[argTypes[i]];
        if (converter) {
          if (stack === 0) stack = Runtime.stackSave();
          cArgs[i] = converter(args[i]);
        } else {
          cArgs[i] = args[i];
        }
      }
    }
    var ret = func.apply(null, cArgs);
    if ((!opts || !opts.async) && typeof EmterpreterAsync === 'object') {
      assert(!EmterpreterAsync.state, 'cannot start async op with normal JS calling ccall');
    }
    if (opts && opts.async) assert(!returnType, 'async ccalls cannot return values');
    if (returnType === 'string') ret = Pointer_stringify(ret);
    if (stack !== 0) {
      if (opts && opts.async) {
        EmterpreterAsync.asyncFinalizers.push(function() {
          Runtime.stackRestore(stack);
        });
        return;
      }
      Runtime.stackRestore(stack);
    }
    return ret;
  }

  var sourceRegex = /^function\s*[a-zA-Z$_0-9]*\s*\(([^)]*)\)\s*{\s*([^*]*?)[\s;]*(?:return\s*(.*?)[;\s]*)?}$/;
  function parseJSFunc(jsfunc) {
    // Match the body and the return value of a javascript function source
    var parsed = jsfunc.toString().match(sourceRegex).slice(1);
    return {arguments : parsed[0], body : parsed[1], returnValue: parsed[2]}
  }

  // sources of useful functions. we create this lazily as it can trigger a source decompression on this entire file
  var JSsource = null;
  function ensureJSsource() {
    if (!JSsource) {
      JSsource = {};
      for (var fun in JSfuncs) {
        if (JSfuncs.hasOwnProperty(fun)) {
          // Elements of toCsource are arrays of three items:
          // the code, and the return value
          JSsource[fun] = parseJSFunc(JSfuncs[fun]);
        }
      }
    }
  }

  cwrap = function cwrap(ident, returnType, argTypes) {
    argTypes = argTypes || [];
    var cfunc = getCFunc(ident);
    // When the function takes numbers and returns a number, we can just return
    // the original function
    var numericArgs = argTypes.every(function(type){ return type === 'number'});
    var numericRet = (returnType !== 'string');
    if ( numericRet && numericArgs) {
      return cfunc;
    }
    // Creation of the arguments list (["$1","$2",...,"$nargs"])
    var argNames = argTypes.map(function(x,i){return '$'+i});
    var funcstr = "(function(" + argNames.join(',') + ") {";
    var nargs = argTypes.length;
    if (!numericArgs) {
      // Generate the code needed to convert the arguments from javascript
      // values to pointers
      ensureJSsource();
      funcstr += 'var stack = ' + JSsource['stackSave'].body + ';';
      for (var i = 0; i < nargs; i++) {
        var arg = argNames[i], type = argTypes[i];
        if (type === 'number') continue;
        var convertCode = JSsource[type + 'ToC']; // [code, return]
        funcstr += 'var ' + convertCode.arguments + ' = ' + arg + ';';
        funcstr += convertCode.body + ';';
        funcstr += arg + '=(' + convertCode.returnValue + ');';
      }
    }

    // When the code is compressed, the name of cfunc is not literally 'cfunc' anymore
    var cfuncname = parseJSFunc(function(){return cfunc}).returnValue;
    // Call the function
    funcstr += 'var ret = ' + cfuncname + '(' + argNames.join(',') + ');';
    if (!numericRet) { // Return type can only by 'string' or 'number'
      // Convert the result to a string
      var strgfy = parseJSFunc(function(){return Pointer_stringify}).returnValue;
      funcstr += 'ret = ' + strgfy + '(ret);';
    }
    funcstr += "if (typeof EmterpreterAsync === 'object') { assert(!EmterpreterAsync.state, 'cannot start async op with normal JS calling cwrap') }";
    if (!numericArgs) {
      // If we had a stack, restore it
      ensureJSsource();
      funcstr += JSsource['stackRestore'].body.replace('()', '(stack)') + ';';
    }
    funcstr += 'return ret})';
    return eval(funcstr);
  };
})();
Module["ccall"] = ccall;
Module["cwrap"] = cwrap;

/** @type {function(number, number, string, boolean=)} */
function setValue(ptr, value, type, noSafe) {
  type = type || 'i8';
  if (type.charAt(type.length-1) === '*') type = 'i32'; // pointers are 32-bit
    switch(type) {
      case 'i1': HEAP8[((ptr)>>0)]=value; break;
      case 'i8': HEAP8[((ptr)>>0)]=value; break;
      case 'i16': HEAP16[((ptr)>>1)]=value; break;
      case 'i32': HEAP32[((ptr)>>2)]=value; break;
      case 'i64': (tempI64 = [value>>>0,(tempDouble=value,(+(Math_abs(tempDouble))) >= 1.0 ? (tempDouble > 0.0 ? ((Math_min((+(Math_floor((tempDouble)/4294967296.0))), 4294967295.0))|0)>>>0 : (~~((+(Math_ceil((tempDouble - +(((~~(tempDouble)))>>>0))/4294967296.0)))))>>>0) : 0)],HEAP32[((ptr)>>2)]=tempI64[0],HEAP32[(((ptr)+(4))>>2)]=tempI64[1]); break;
      case 'float': HEAPF32[((ptr)>>2)]=value; break;
      case 'double': HEAPF64[((ptr)>>3)]=value; break;
      default: abort('invalid type for setValue: ' + type);
    }
}
Module["setValue"] = setValue;

/** @type {function(number, string, boolean=)} */
function getValue(ptr, type, noSafe) {
  type = type || 'i8';
  if (type.charAt(type.length-1) === '*') type = 'i32'; // pointers are 32-bit
    switch(type) {
      case 'i1': return HEAP8[((ptr)>>0)];
      case 'i8': return HEAP8[((ptr)>>0)];
      case 'i16': return HEAP16[((ptr)>>1)];
      case 'i32': return HEAP32[((ptr)>>2)];
      case 'i64': return HEAP32[((ptr)>>2)];
      case 'float': return HEAPF32[((ptr)>>2)];
      case 'double': return HEAPF64[((ptr)>>3)];
      default: abort('invalid type for setValue: ' + type);
    }
  return null;
}
Module["getValue"] = getValue;

var ALLOC_NORMAL = 0; // Tries to use _malloc()
var ALLOC_STACK = 1; // Lives for the duration of the current function call
var ALLOC_STATIC = 2; // Cannot be freed
var ALLOC_DYNAMIC = 3; // Cannot be freed except through sbrk
var ALLOC_NONE = 4; // Do not allocate
Module["ALLOC_NORMAL"] = ALLOC_NORMAL;
Module["ALLOC_STACK"] = ALLOC_STACK;
Module["ALLOC_STATIC"] = ALLOC_STATIC;
Module["ALLOC_DYNAMIC"] = ALLOC_DYNAMIC;
Module["ALLOC_NONE"] = ALLOC_NONE;

// allocate(): This is for internal use. You can use it yourself as well, but the interface
//             is a little tricky (see docs right below). The reason is that it is optimized
//             for multiple syntaxes to save space in generated code. So you should
//             normally not use allocate(), and instead allocate memory using _malloc(),
//             initialize it with setValue(), and so forth.
// @slab: An array of data, or a number. If a number, then the size of the block to allocate,
//        in *bytes* (note that this is sometimes confusing: the next parameter does not
//        affect this!)
// @types: Either an array of types, one for each byte (or 0 if no type at that position),
//         or a single type which is used for the entire block. This only matters if there
//         is initial data - if @slab is a number, then this does not matter at all and is
//         ignored.
// @allocator: How to allocate memory, see ALLOC_*
/** @type {function((TypedArray|Array<number>|number), string, number, number=)} */
function allocate(slab, types, allocator, ptr) {
  var zeroinit, size;
  if (typeof slab === 'number') {
    zeroinit = true;
    size = slab;
  } else {
    zeroinit = false;
    size = slab.length;
  }

  var singleType = typeof types === 'string' ? types : null;

  var ret;
  if (allocator == ALLOC_NONE) {
    ret = ptr;
  } else {
    ret = [typeof _malloc === 'function' ? _malloc : Runtime.staticAlloc, Runtime.stackAlloc, Runtime.staticAlloc, Runtime.dynamicAlloc][allocator === undefined ? ALLOC_STATIC : allocator](Math.max(size, singleType ? 1 : types.length));
  }

  if (zeroinit) {
    var ptr = ret, stop;
    assert((ret & 3) == 0);
    stop = ret + (size & ~3);
    for (; ptr < stop; ptr += 4) {
      HEAP32[((ptr)>>2)]=0;
    }
    stop = ret + size;
    while (ptr < stop) {
      HEAP8[((ptr++)>>0)]=0;
    }
    return ret;
  }

  if (singleType === 'i8') {
    if (slab.subarray || slab.slice) {
      HEAPU8.set(/** @type {!Uint8Array} */ (slab), ret);
    } else {
      HEAPU8.set(new Uint8Array(slab), ret);
    }
    return ret;
  }

  var i = 0, type, typeSize, previousType;
  while (i < size) {
    var curr = slab[i];

    if (typeof curr === 'function') {
      curr = Runtime.getFunctionIndex(curr);
    }

    type = singleType || types[i];
    if (type === 0) {
      i++;
      continue;
    }
    assert(type, 'Must know what type to store in allocate!');

    if (type == 'i64') type = 'i32'; // special case: we have one i32 here, and one i32 later

    setValue(ret+i, curr, type);

    // no need to look up size unless type changes, so cache it
    if (previousType !== type) {
      typeSize = Runtime.getNativeTypeSize(type);
      previousType = type;
    }
    i += typeSize;
  }

  return ret;
}
Module["allocate"] = allocate;

// Allocate memory during any stage of startup - static memory early on, dynamic memory later, malloc when ready
function getMemory(size) {
  if (!staticSealed) return Runtime.staticAlloc(size);
  if (!runtimeInitialized) return Runtime.dynamicAlloc(size);
  return _malloc(size);
}
Module["getMemory"] = getMemory;

/** @type {function(number, number=)} */
function Pointer_stringify(ptr, length) {
  if (length === 0 || !ptr) return '';
  // TODO: use TextDecoder
  // Find the length, and check for UTF while doing so
  var hasUtf = 0;
  var t;
  var i = 0;
  while (1) {
    assert(ptr + i < TOTAL_MEMORY);
    t = HEAPU8[(((ptr)+(i))>>0)];
    hasUtf |= t;
    if (t == 0 && !length) break;
    i++;
    if (length && i == length) break;
  }
  if (!length) length = i;

  var ret = '';

  if (hasUtf < 128) {
    var MAX_CHUNK = 1024; // split up into chunks, because .apply on a huge string can overflow the stack
    var curr;
    while (length > 0) {
      curr = String.fromCharCode.apply(String, HEAPU8.subarray(ptr, ptr + Math.min(length, MAX_CHUNK)));
      ret = ret ? ret + curr : curr;
      ptr += MAX_CHUNK;
      length -= MAX_CHUNK;
    }
    return ret;
  }
  return Module['UTF8ToString'](ptr);
}
Module["Pointer_stringify"] = Pointer_stringify;

// Given a pointer 'ptr' to a null-terminated ASCII-encoded string in the emscripten HEAP, returns
// a copy of that string as a Javascript String object.

function AsciiToString(ptr) {
  var str = '';
  while (1) {
    var ch = HEAP8[((ptr++)>>0)];
    if (!ch) return str;
    str += String.fromCharCode(ch);
  }
}
Module["AsciiToString"] = AsciiToString;

// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in ASCII form. The copy will require at most str.length+1 bytes of space in the HEAP.

function stringToAscii(str, outPtr) {
  return writeAsciiToMemory(str, outPtr, false);
}
Module["stringToAscii"] = stringToAscii;

// Given a pointer 'ptr' to a null-terminated UTF8-encoded string in the given array that contains uint8 values, returns
// a copy of that string as a Javascript String object.

var UTF8Decoder = typeof TextDecoder !== 'undefined' ? new TextDecoder('utf8') : undefined;
function UTF8ArrayToString(u8Array, idx) {
  var endPtr = idx;
  // TextDecoder needs to know the byte length in advance, it doesn't stop on null terminator by itself.
  // Also, use the length info to avoid running tiny strings through TextDecoder, since .subarray() allocates garbage.
  while (u8Array[endPtr]) ++endPtr;

  if (endPtr - idx > 16 && u8Array.subarray && UTF8Decoder) {
    return UTF8Decoder.decode(u8Array.subarray(idx, endPtr));
  } else {
    var u0, u1, u2, u3, u4, u5;

    var str = '';
    while (1) {
      // For UTF8 byte structure, see http://en.wikipedia.org/wiki/UTF-8#Description and https://www.ietf.org/rfc/rfc2279.txt and https://tools.ietf.org/html/rfc3629
      u0 = u8Array[idx++];
      if (!u0) return str;
      if (!(u0 & 0x80)) { str += String.fromCharCode(u0); continue; }
      u1 = u8Array[idx++] & 63;
      if ((u0 & 0xE0) == 0xC0) { str += String.fromCharCode(((u0 & 31) << 6) | u1); continue; }
      u2 = u8Array[idx++] & 63;
      if ((u0 & 0xF0) == 0xE0) {
        u0 = ((u0 & 15) << 12) | (u1 << 6) | u2;
      } else {
        u3 = u8Array[idx++] & 63;
        if ((u0 & 0xF8) == 0xF0) {
          u0 = ((u0 & 7) << 18) | (u1 << 12) | (u2 << 6) | u3;
        } else {
          u4 = u8Array[idx++] & 63;
          if ((u0 & 0xFC) == 0xF8) {
            u0 = ((u0 & 3) << 24) | (u1 << 18) | (u2 << 12) | (u3 << 6) | u4;
          } else {
            u5 = u8Array[idx++] & 63;
            u0 = ((u0 & 1) << 30) | (u1 << 24) | (u2 << 18) | (u3 << 12) | (u4 << 6) | u5;
          }
        }
      }
      if (u0 < 0x10000) {
        str += String.fromCharCode(u0);
      } else {
        var ch = u0 - 0x10000;
        str += String.fromCharCode(0xD800 | (ch >> 10), 0xDC00 | (ch & 0x3FF));
      }
    }
  }
}
Module["UTF8ArrayToString"] = UTF8ArrayToString;

// Given a pointer 'ptr' to a null-terminated UTF8-encoded string in the emscripten HEAP, returns
// a copy of that string as a Javascript String object.

function UTF8ToString(ptr) {
  return UTF8ArrayToString(HEAPU8,ptr);
}
Module["UTF8ToString"] = UTF8ToString;

// Copies the given Javascript String object 'str' to the given byte array at address 'outIdx',
// encoded in UTF8 form and null-terminated. The copy will require at most str.length*4+1 bytes of space in the HEAP.
// Use the function lengthBytesUTF8 to compute the exact number of bytes (excluding null terminator) that this function will write.
// Parameters:
//   str: the Javascript string to copy.
//   outU8Array: the array to copy to. Each index in this array is assumed to be one 8-byte element.
//   outIdx: The starting offset in the array to begin the copying.
//   maxBytesToWrite: The maximum number of bytes this function can write to the array. This count should include the null
//                    terminator, i.e. if maxBytesToWrite=1, only the null terminator will be written and nothing else.
//                    maxBytesToWrite=0 does not write any bytes to the output, not even the null terminator.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF8Array(str, outU8Array, outIdx, maxBytesToWrite) {
  if (!(maxBytesToWrite > 0)) // Parameter maxBytesToWrite is not optional. Negative values, 0, null, undefined and false each don't write out any bytes.
    return 0;

  var startIdx = outIdx;
  var endIdx = outIdx + maxBytesToWrite - 1; // -1 for string null terminator.
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! So decode UTF16->UTF32->UTF8.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    // For UTF8 byte structure, see http://en.wikipedia.org/wiki/UTF-8#Description and https://www.ietf.org/rfc/rfc2279.txt and https://tools.ietf.org/html/rfc3629
    var u = str.charCodeAt(i); // possibly a lead surrogate
    if (u >= 0xD800 && u <= 0xDFFF) u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
    if (u <= 0x7F) {
      if (outIdx >= endIdx) break;
      outU8Array[outIdx++] = u;
    } else if (u <= 0x7FF) {
      if (outIdx + 1 >= endIdx) break;
      outU8Array[outIdx++] = 0xC0 | (u >> 6);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    } else if (u <= 0xFFFF) {
      if (outIdx + 2 >= endIdx) break;
      outU8Array[outIdx++] = 0xE0 | (u >> 12);
      outU8Array[outIdx++] = 0x80 | ((u >> 6) & 63);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    } else if (u <= 0x1FFFFF) {
      if (outIdx + 3 >= endIdx) break;
      outU8Array[outIdx++] = 0xF0 | (u >> 18);
      outU8Array[outIdx++] = 0x80 | ((u >> 12) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 6) & 63);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    } else if (u <= 0x3FFFFFF) {
      if (outIdx + 4 >= endIdx) break;
      outU8Array[outIdx++] = 0xF8 | (u >> 24);
      outU8Array[outIdx++] = 0x80 | ((u >> 18) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 12) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 6) & 63);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    } else {
      if (outIdx + 5 >= endIdx) break;
      outU8Array[outIdx++] = 0xFC | (u >> 30);
      outU8Array[outIdx++] = 0x80 | ((u >> 24) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 18) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 12) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 6) & 63);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    }
  }
  // Null-terminate the pointer to the buffer.
  outU8Array[outIdx] = 0;
  return outIdx - startIdx;
}
Module["stringToUTF8Array"] = stringToUTF8Array;

// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in UTF8 form. The copy will require at most str.length*4+1 bytes of space in the HEAP.
// Use the function lengthBytesUTF8 to compute the exact number of bytes (excluding null terminator) that this function will write.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF8(str, outPtr, maxBytesToWrite) {
  assert(typeof maxBytesToWrite == 'number', 'stringToUTF8(str, outPtr, maxBytesToWrite) is missing the third parameter that specifies the length of the output buffer!');
  return stringToUTF8Array(str, HEAPU8,outPtr, maxBytesToWrite);
}
Module["stringToUTF8"] = stringToUTF8;

// Returns the number of bytes the given Javascript string takes if encoded as a UTF8 byte array, EXCLUDING the null terminator byte.

function lengthBytesUTF8(str) {
  var len = 0;
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! So decode UTF16->UTF32->UTF8.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    var u = str.charCodeAt(i); // possibly a lead surrogate
    if (u >= 0xD800 && u <= 0xDFFF) u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
    if (u <= 0x7F) {
      ++len;
    } else if (u <= 0x7FF) {
      len += 2;
    } else if (u <= 0xFFFF) {
      len += 3;
    } else if (u <= 0x1FFFFF) {
      len += 4;
    } else if (u <= 0x3FFFFFF) {
      len += 5;
    } else {
      len += 6;
    }
  }
  return len;
}
Module["lengthBytesUTF8"] = lengthBytesUTF8;

// Given a pointer 'ptr' to a null-terminated UTF16LE-encoded string in the emscripten HEAP, returns
// a copy of that string as a Javascript String object.

var UTF16Decoder = typeof TextDecoder !== 'undefined' ? new TextDecoder('utf-16le') : undefined;
function UTF16ToString(ptr) {
  assert(ptr % 2 == 0, 'Pointer passed to UTF16ToString must be aligned to two bytes!');
  var endPtr = ptr;
  // TextDecoder needs to know the byte length in advance, it doesn't stop on null terminator by itself.
  // Also, use the length info to avoid running tiny strings through TextDecoder, since .subarray() allocates garbage.
  var idx = endPtr >> 1;
  while (HEAP16[idx]) ++idx;
  endPtr = idx << 1;

  if (endPtr - ptr > 32 && UTF16Decoder) {
    return UTF16Decoder.decode(HEAPU8.subarray(ptr, endPtr));
  } else {
    var i = 0;

    var str = '';
    while (1) {
      var codeUnit = HEAP16[(((ptr)+(i*2))>>1)];
      if (codeUnit == 0) return str;
      ++i;
      // fromCharCode constructs a character from a UTF-16 code unit, so we can pass the UTF16 string right through.
      str += String.fromCharCode(codeUnit);
    }
  }
}


// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in UTF16 form. The copy will require at most str.length*4+2 bytes of space in the HEAP.
// Use the function lengthBytesUTF16() to compute the exact number of bytes (excluding null terminator) that this function will write.
// Parameters:
//   str: the Javascript string to copy.
//   outPtr: Byte address in Emscripten HEAP where to write the string to.
//   maxBytesToWrite: The maximum number of bytes this function can write to the array. This count should include the null
//                    terminator, i.e. if maxBytesToWrite=2, only the null terminator will be written and nothing else.
//                    maxBytesToWrite<2 does not write any bytes to the output, not even the null terminator.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF16(str, outPtr, maxBytesToWrite) {
  assert(outPtr % 2 == 0, 'Pointer passed to stringToUTF16 must be aligned to two bytes!');
  assert(typeof maxBytesToWrite == 'number', 'stringToUTF16(str, outPtr, maxBytesToWrite) is missing the third parameter that specifies the length of the output buffer!');
  // Backwards compatibility: if max bytes is not specified, assume unsafe unbounded write is allowed.
  if (maxBytesToWrite === undefined) {
    maxBytesToWrite = 0x7FFFFFFF;
  }
  if (maxBytesToWrite < 2) return 0;
  maxBytesToWrite -= 2; // Null terminator.
  var startPtr = outPtr;
  var numCharsToWrite = (maxBytesToWrite < str.length*2) ? (maxBytesToWrite / 2) : str.length;
  for (var i = 0; i < numCharsToWrite; ++i) {
    // charCodeAt returns a UTF-16 encoded code unit, so it can be directly written to the HEAP.
    var codeUnit = str.charCodeAt(i); // possibly a lead surrogate
    HEAP16[((outPtr)>>1)]=codeUnit;
    outPtr += 2;
  }
  // Null-terminate the pointer to the HEAP.
  HEAP16[((outPtr)>>1)]=0;
  return outPtr - startPtr;
}


// Returns the number of bytes the given Javascript string takes if encoded as a UTF16 byte array, EXCLUDING the null terminator byte.

function lengthBytesUTF16(str) {
  return str.length*2;
}


function UTF32ToString(ptr) {
  assert(ptr % 4 == 0, 'Pointer passed to UTF32ToString must be aligned to four bytes!');
  var i = 0;

  var str = '';
  while (1) {
    var utf32 = HEAP32[(((ptr)+(i*4))>>2)];
    if (utf32 == 0)
      return str;
    ++i;
    // Gotcha: fromCharCode constructs a character from a UTF-16 encoded code (pair), not from a Unicode code point! So encode the code point to UTF-16 for constructing.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    if (utf32 >= 0x10000) {
      var ch = utf32 - 0x10000;
      str += String.fromCharCode(0xD800 | (ch >> 10), 0xDC00 | (ch & 0x3FF));
    } else {
      str += String.fromCharCode(utf32);
    }
  }
}


// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in UTF32 form. The copy will require at most str.length*4+4 bytes of space in the HEAP.
// Use the function lengthBytesUTF32() to compute the exact number of bytes (excluding null terminator) that this function will write.
// Parameters:
//   str: the Javascript string to copy.
//   outPtr: Byte address in Emscripten HEAP where to write the string to.
//   maxBytesToWrite: The maximum number of bytes this function can write to the array. This count should include the null
//                    terminator, i.e. if maxBytesToWrite=4, only the null terminator will be written and nothing else.
//                    maxBytesToWrite<4 does not write any bytes to the output, not even the null terminator.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF32(str, outPtr, maxBytesToWrite) {
  assert(outPtr % 4 == 0, 'Pointer passed to stringToUTF32 must be aligned to four bytes!');
  assert(typeof maxBytesToWrite == 'number', 'stringToUTF32(str, outPtr, maxBytesToWrite) is missing the third parameter that specifies the length of the output buffer!');
  // Backwards compatibility: if max bytes is not specified, assume unsafe unbounded write is allowed.
  if (maxBytesToWrite === undefined) {
    maxBytesToWrite = 0x7FFFFFFF;
  }
  if (maxBytesToWrite < 4) return 0;
  var startPtr = outPtr;
  var endPtr = startPtr + maxBytesToWrite - 4;
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! We must decode the string to UTF-32 to the heap.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    var codeUnit = str.charCodeAt(i); // possibly a lead surrogate
    if (codeUnit >= 0xD800 && codeUnit <= 0xDFFF) {
      var trailSurrogate = str.charCodeAt(++i);
      codeUnit = 0x10000 + ((codeUnit & 0x3FF) << 10) | (trailSurrogate & 0x3FF);
    }
    HEAP32[((outPtr)>>2)]=codeUnit;
    outPtr += 4;
    if (outPtr + 4 > endPtr) break;
  }
  // Null-terminate the pointer to the HEAP.
  HEAP32[((outPtr)>>2)]=0;
  return outPtr - startPtr;
}


// Returns the number of bytes the given Javascript string takes if encoded as a UTF16 byte array, EXCLUDING the null terminator byte.

function lengthBytesUTF32(str) {
  var len = 0;
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! We must decode the string to UTF-32 to the heap.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    var codeUnit = str.charCodeAt(i);
    if (codeUnit >= 0xD800 && codeUnit <= 0xDFFF) ++i; // possibly a lead surrogate, so skip over the tail surrogate.
    len += 4;
  }

  return len;
}


function demangle(func) {
  var __cxa_demangle_func = Module['___cxa_demangle'] || Module['__cxa_demangle'];
  if (__cxa_demangle_func) {
    try {
      var s =
        func.substr(1);
      var len = lengthBytesUTF8(s)+1;
      var buf = _malloc(len);
      stringToUTF8(s, buf, len);
      var status = _malloc(4);
      var ret = __cxa_demangle_func(buf, 0, 0, status);
      if (getValue(status, 'i32') === 0 && ret) {
        return Pointer_stringify(ret);
      }
      // otherwise, libcxxabi failed
    } catch(e) {
      // ignore problems here
    } finally {
      if (buf) _free(buf);
      if (status) _free(status);
      if (ret) _free(ret);
    }
    // failure when using libcxxabi, don't demangle
    return func;
  }
  Runtime.warnOnce('warning: build with  -s DEMANGLE_SUPPORT=1  to link in libcxxabi demangling');
  return func;
}

function demangleAll(text) {
  var regex =
    /__Z[\w\d_]+/g;
  return text.replace(regex,
    function(x) {
      var y = demangle(x);
      return x === y ? x : (x + ' [' + y + ']');
    });
}

function jsStackTrace() {
  var err = new Error();
  if (!err.stack) {
    // IE10+ special cases: It does have callstack info, but it is only populated if an Error object is thrown,
    // so try that as a special-case.
    try {
      throw new Error(0);
    } catch(e) {
      err = e;
    }
    if (!err.stack) {
      return '(no stack trace available)';
    }
  }
  return err.stack.toString();
}

function stackTrace() {
  var js = jsStackTrace();
  if (Module['extraStackTrace']) js += '\n' + Module['extraStackTrace']();
  return demangleAll(js);
}
Module["stackTrace"] = stackTrace;

// Memory management

var PAGE_SIZE = 16384;
var WASM_PAGE_SIZE = 65536;
var ASMJS_PAGE_SIZE = 16777216;
var MIN_TOTAL_MEMORY = 16777216;

function alignUp(x, multiple) {
  if (x % multiple > 0) {
    x += multiple - (x % multiple);
  }
  return x;
}

var HEAP,
/** @type {ArrayBuffer} */
  buffer,
/** @type {Int8Array} */
  HEAP8,
/** @type {Uint8Array} */
  HEAPU8,
/** @type {Int16Array} */
  HEAP16,
/** @type {Uint16Array} */
  HEAPU16,
/** @type {Int32Array} */
  HEAP32,
/** @type {Uint32Array} */
  HEAPU32,
/** @type {Float32Array} */
  HEAPF32,
/** @type {Float64Array} */
  HEAPF64;

function updateGlobalBuffer(buf) {
  Module['buffer'] = buffer = buf;
}

function updateGlobalBufferViews() {
  Module['HEAP8'] = HEAP8 = new Int8Array(buffer);
  Module['HEAP16'] = HEAP16 = new Int16Array(buffer);
  Module['HEAP32'] = HEAP32 = new Int32Array(buffer);
  Module['HEAPU8'] = HEAPU8 = new Uint8Array(buffer);
  Module['HEAPU16'] = HEAPU16 = new Uint16Array(buffer);
  Module['HEAPU32'] = HEAPU32 = new Uint32Array(buffer);
  Module['HEAPF32'] = HEAPF32 = new Float32Array(buffer);
  Module['HEAPF64'] = HEAPF64 = new Float64Array(buffer);
  // needed when run under emterpreter.
  if (typeof asm !== 'undefined' && asm.update_heap)
    asm.update_heap();
}

var STATIC_BASE, STATICTOP, staticSealed; // static area
var STACK_BASE, STACKTOP, STACK_MAX; // stack area
var DYNAMIC_BASE, DYNAMICTOP_PTR; // dynamic area handled by sbrk

  STATIC_BASE = STATICTOP = STACK_BASE = STACKTOP = STACK_MAX = DYNAMIC_BASE = DYNAMICTOP_PTR = 0;
  staticSealed = false;


// Initializes the stack cookie. Called at the startup of main and at the startup of each thread in pthreads mode.
function writeStackCookie() {
  assert((STACK_MAX & 3) == 0);
  HEAPU32[(STACK_MAX >> 2)-1] = 0x02135467;
  HEAPU32[(STACK_MAX >> 2)-2] = 0x89BACDFE;
}

function checkStackCookie() {
  if (HEAPU32[(STACK_MAX >> 2)-1] != 0x02135467 || HEAPU32[(STACK_MAX >> 2)-2] != 0x89BACDFE) {
    abort('Stack overflow! Stack cookie has been overwritten, expected hex dwords 0x89BACDFE and 0x02135467, but received 0x' + HEAPU32[(STACK_MAX >> 2)-2].toString(16) + ' ' + HEAPU32[(STACK_MAX >> 2)-1].toString(16));
  }
  // Also test the global address 0 for integrity. This check is not compatible with SAFE_SPLIT_MEMORY though, since that mode already tests all address 0 accesses on its own.
  if (HEAP32[0] !== 0x63736d65 /* 'emsc' */) throw 'Runtime error: The application has corrupted its heap memory area (address zero)!';
}

function abortStackOverflow(allocSize) {
  abort('Stack overflow! Attempted to allocate ' + allocSize + ' bytes on the stack, but stack has only ' + (STACK_MAX - Module['asm'].stackSave() + allocSize) + ' bytes available!');
}

function abortOnCannotGrowMemory() {
  abort('Cannot enlarge memory arrays. Either (1) compile with  -s TOTAL_MEMORY=X  with X higher than the current value ' + TOTAL_MEMORY + ', (2) compile with  -s ALLOW_MEMORY_GROWTH=1  which allows increasing the size at runtime but prevents some optimizations, (3) set Module.TOTAL_MEMORY to a higher value before the program runs, or (4) if you want malloc to return NULL (0) instead of this abort, compile with  -s ABORTING_MALLOC=0 ');
}


function enlargeMemory() {
  abortOnCannotGrowMemory();
}


var TOTAL_STACK = Module['TOTAL_STACK'] || 5242880;
var TOTAL_MEMORY = Module['TOTAL_MEMORY'] || 16777216;
if (TOTAL_MEMORY < TOTAL_STACK) Module.printErr('TOTAL_MEMORY should be larger than TOTAL_STACK, was ' + TOTAL_MEMORY + '! (TOTAL_STACK=' + TOTAL_STACK + ')');

// Initialize the runtime's memory
// check for full engine support (use string 'subarray' to avoid closure compiler confusion)
assert(typeof Int32Array !== 'undefined' && typeof Float64Array !== 'undefined' && Int32Array.prototype.subarray !== undefined && Int32Array.prototype.set !== undefined,
       'JS engine does not provide full typed array support');



// Use a provided buffer, if there is one, or else allocate a new one
if (Module['buffer']) {
  buffer = Module['buffer'];
  assert(buffer.byteLength === TOTAL_MEMORY, 'provided buffer should be ' + TOTAL_MEMORY + ' bytes, but it is ' + buffer.byteLength);
} else {
  // Use a WebAssembly memory where available
  {
    buffer = new ArrayBuffer(TOTAL_MEMORY);
  }
  assert(buffer.byteLength === TOTAL_MEMORY);
}
updateGlobalBufferViews();


function getTotalMemory() {
  return TOTAL_MEMORY;
}

// Endianness check (note: assumes compiler arch was little-endian)
  HEAP32[0] = 0x63736d65; /* 'emsc' */
HEAP16[1] = 0x6373;
if (HEAPU8[2] !== 0x73 || HEAPU8[3] !== 0x63) throw 'Runtime error: expected the system to be little-endian!';

Module['HEAP'] = HEAP;
Module['buffer'] = buffer;
Module['HEAP8'] = HEAP8;
Module['HEAP16'] = HEAP16;
Module['HEAP32'] = HEAP32;
Module['HEAPU8'] = HEAPU8;
Module['HEAPU16'] = HEAPU16;
Module['HEAPU32'] = HEAPU32;
Module['HEAPF32'] = HEAPF32;
Module['HEAPF64'] = HEAPF64;

function callRuntimeCallbacks(callbacks) {
  while(callbacks.length > 0) {
    var callback = callbacks.shift();
    if (typeof callback == 'function') {
      callback();
      continue;
    }
    var func = callback.func;
    if (typeof func === 'number') {
      if (callback.arg === undefined) {
        Module['dynCall_v'](func);
      } else {
        Module['dynCall_vi'](func, callback.arg);
      }
    } else {
      func(callback.arg === undefined ? null : callback.arg);
    }
  }
}

var __ATPRERUN__  = []; // functions called before the runtime is initialized
var __ATINIT__    = []; // functions called during startup
var __ATMAIN__    = []; // functions called when main() is to be run
var __ATEXIT__    = []; // functions called during shutdown
var __ATPOSTRUN__ = []; // functions called after the runtime has exited

var runtimeInitialized = false;
var runtimeExited = false;


function preRun() {
  // compatibility - merge in anything from Module['preRun'] at this time
  if (Module['preRun']) {
    if (typeof Module['preRun'] == 'function') Module['preRun'] = [Module['preRun']];
    while (Module['preRun'].length) {
      addOnPreRun(Module['preRun'].shift());
    }
  }
  callRuntimeCallbacks(__ATPRERUN__);
}

function ensureInitRuntime() {
  checkStackCookie();
  if (runtimeInitialized) return;
  runtimeInitialized = true;
  callRuntimeCallbacks(__ATINIT__);
}

function preMain() {
  checkStackCookie();
  callRuntimeCallbacks(__ATMAIN__);
}

function exitRuntime() {
  checkStackCookie();
  callRuntimeCallbacks(__ATEXIT__);
  runtimeExited = true;
}

function postRun() {
  checkStackCookie();
  // compatibility - merge in anything from Module['postRun'] at this time
  if (Module['postRun']) {
    if (typeof Module['postRun'] == 'function') Module['postRun'] = [Module['postRun']];
    while (Module['postRun'].length) {
      addOnPostRun(Module['postRun'].shift());
    }
  }
  callRuntimeCallbacks(__ATPOSTRUN__);
}

function addOnPreRun(cb) {
  __ATPRERUN__.unshift(cb);
}
Module["addOnPreRun"] = addOnPreRun;

function addOnInit(cb) {
  __ATINIT__.unshift(cb);
}
Module["addOnInit"] = addOnInit;

function addOnPreMain(cb) {
  __ATMAIN__.unshift(cb);
}
Module["addOnPreMain"] = addOnPreMain;

function addOnExit(cb) {
  __ATEXIT__.unshift(cb);
}
Module["addOnExit"] = addOnExit;

function addOnPostRun(cb) {
  __ATPOSTRUN__.unshift(cb);
}
Module["addOnPostRun"] = addOnPostRun;

// Tools

/** @type {function(string, boolean=, number=)} */
function intArrayFromString(stringy, dontAddNull, length) {
  var len = length > 0 ? length : lengthBytesUTF8(stringy)+1;
  var u8array = new Array(len);
  var numBytesWritten = stringToUTF8Array(stringy, u8array, 0, u8array.length);
  if (dontAddNull) u8array.length = numBytesWritten;
  return u8array;
}
Module["intArrayFromString"] = intArrayFromString;

function intArrayToString(array) {
  var ret = [];
  for (var i = 0; i < array.length; i++) {
    var chr = array[i];
    if (chr > 0xFF) {
      assert(false, 'Character code ' + chr + ' (' + String.fromCharCode(chr) + ')  at offset ' + i + ' not in 0x00-0xFF.');
      chr &= 0xFF;
    }
    ret.push(String.fromCharCode(chr));
  }
  return ret.join('');
}
Module["intArrayToString"] = intArrayToString;

// Deprecated: This function should not be called because it is unsafe and does not provide
// a maximum length limit of how many bytes it is allowed to write. Prefer calling the
// function stringToUTF8Array() instead, which takes in a maximum length that can be used
// to be secure from out of bounds writes.
/** @deprecated */
function writeStringToMemory(string, buffer, dontAddNull) {
  Runtime.warnOnce('writeStringToMemory is deprecated and should not be called! Use stringToUTF8() instead!');

  var /** @type {number} */ lastChar, /** @type {number} */ end;
  if (dontAddNull) {
    // stringToUTF8Array always appends null. If we don't want to do that, remember the
    // character that existed at the location where the null will be placed, and restore
    // that after the write (below).
    end = buffer + lengthBytesUTF8(string);
    lastChar = HEAP8[end];
  }
  stringToUTF8(string, buffer, Infinity);
  if (dontAddNull) HEAP8[end] = lastChar; // Restore the value under the null character.
}
Module["writeStringToMemory"] = writeStringToMemory;

function writeArrayToMemory(array, buffer) {
  assert(array.length >= 0, 'writeArrayToMemory array must have a length (should be an array or typed array)')
  HEAP8.set(array, buffer);
}
Module["writeArrayToMemory"] = writeArrayToMemory;

function writeAsciiToMemory(str, buffer, dontAddNull) {
  for (var i = 0; i < str.length; ++i) {
    assert(str.charCodeAt(i) === str.charCodeAt(i)&0xff);
    HEAP8[((buffer++)>>0)]=str.charCodeAt(i);
  }
  // Null-terminate the pointer to the HEAP.
  if (!dontAddNull) HEAP8[((buffer)>>0)]=0;
}
Module["writeAsciiToMemory"] = writeAsciiToMemory;

function unSign(value, bits, ignore) {
  if (value >= 0) {
    return value;
  }
  return bits <= 32 ? 2*Math.abs(1 << (bits-1)) + value // Need some trickery, since if bits == 32, we are right at the limit of the bits JS uses in bitshifts
                    : Math.pow(2, bits)         + value;
}
function reSign(value, bits, ignore) {
  if (value <= 0) {
    return value;
  }
  var half = bits <= 32 ? Math.abs(1 << (bits-1)) // abs is needed if bits == 32
                        : Math.pow(2, bits-1);
  if (value >= half && (bits <= 32 || value > half)) { // for huge values, we can hit the precision limit and always get true here. so don't do that
                                                       // but, in general there is no perfect solution here. With 64-bit ints, we get rounding and errors
                                                       // TODO: In i64 mode 1, resign the two parts separately and safely
    value = -2*half + value; // Cannot bitshift half, as it may be at the limit of the bits JS uses in bitshifts
  }
  return value;
}

// check for imul support, and also for correctness ( https://bugs.webkit.org/show_bug.cgi?id=126345 )
if (!Math['imul'] || Math['imul'](0xffffffff, 5) !== -5) Math['imul'] = function imul(a, b) {
  var ah  = a >>> 16;
  var al = a & 0xffff;
  var bh  = b >>> 16;
  var bl = b & 0xffff;
  return (al*bl + ((ah*bl + al*bh) << 16))|0;
};
Math.imul = Math['imul'];


if (!Math['clz32']) Math['clz32'] = function(x) {
  x = x >>> 0;
  for (var i = 0; i < 32; i++) {
    if (x & (1 << (31 - i))) return i;
  }
  return 32;
};
Math.clz32 = Math['clz32']

if (!Math['trunc']) Math['trunc'] = function(x) {
  return x < 0 ? Math.ceil(x) : Math.floor(x);
};
Math.trunc = Math['trunc'];

var Math_abs = Math.abs;
var Math_cos = Math.cos;
var Math_sin = Math.sin;
var Math_tan = Math.tan;
var Math_acos = Math.acos;
var Math_asin = Math.asin;
var Math_atan = Math.atan;
var Math_atan2 = Math.atan2;
var Math_exp = Math.exp;
var Math_log = Math.log;
var Math_sqrt = Math.sqrt;
var Math_ceil = Math.ceil;
var Math_floor = Math.floor;
var Math_pow = Math.pow;
var Math_imul = Math.imul;
var Math_fround = Math.fround;
var Math_round = Math.round;
var Math_min = Math.min;
var Math_clz32 = Math.clz32;
var Math_trunc = Math.trunc;

// A counter of dependencies for calling run(). If we need to
// do asynchronous work before running, increment this and
// decrement it. Incrementing must happen in a place like
// PRE_RUN_ADDITIONS (used by emcc to add file preloading).
// Note that you can add dependencies in preRun, even though
// it happens right before run - run will be postponed until
// the dependencies are met.
var runDependencies = 0;
var runDependencyWatcher = null;
var dependenciesFulfilled = null; // overridden to take different actions when all run dependencies are fulfilled
var runDependencyTracking = {};

function getUniqueRunDependency(id) {
  var orig = id;
  while (1) {
    if (!runDependencyTracking[id]) return id;
    id = orig + Math.random();
  }
  return id;
}

function addRunDependency(id) {
  runDependencies++;
  if (Module['monitorRunDependencies']) {
    Module['monitorRunDependencies'](runDependencies);
  }
  if (id) {
    assert(!runDependencyTracking[id]);
    runDependencyTracking[id] = 1;
    if (runDependencyWatcher === null && typeof setInterval !== 'undefined') {
      // Check for missing dependencies every few seconds
      runDependencyWatcher = setInterval(function() {
        if (ABORT) {
          clearInterval(runDependencyWatcher);
          runDependencyWatcher = null;
          return;
        }
        var shown = false;
        for (var dep in runDependencyTracking) {
          if (!shown) {
            shown = true;
            Module.printErr('still waiting on run dependencies:');
          }
          Module.printErr('dependency: ' + dep);
        }
        if (shown) {
          Module.printErr('(end of list)');
        }
      }, 10000);
    }
  } else {
    Module.printErr('warning: run dependency added without ID');
  }
}
Module["addRunDependency"] = addRunDependency;

function removeRunDependency(id) {
  runDependencies--;
  if (Module['monitorRunDependencies']) {
    Module['monitorRunDependencies'](runDependencies);
  }
  if (id) {
    assert(runDependencyTracking[id]);
    delete runDependencyTracking[id];
  } else {
    Module.printErr('warning: run dependency removed without ID');
  }
  if (runDependencies == 0) {
    if (runDependencyWatcher !== null) {
      clearInterval(runDependencyWatcher);
      runDependencyWatcher = null;
    }
    if (dependenciesFulfilled) {
      var callback = dependenciesFulfilled;
      dependenciesFulfilled = null;
      callback(); // can add another dependenciesFulfilled
    }
  }
}
Module["removeRunDependency"] = removeRunDependency;

Module["preloadedImages"] = {}; // maps url to image data
Module["preloadedAudios"] = {}; // maps url to audio data



var memoryInitializer = null;



var /* show errors on likely calls to FS when it was not included */ FS = {
  error: function() {
    abort('Filesystem support (FS) was not included. The problem is that you are using files from JS, but files were not used from C/C++, so filesystem support was not auto-included. You can force-include filesystem support with  -s FORCE_FILESYSTEM=1');
  },
  init: function() { FS.error() },
  createDataFile: function() { FS.error() },
  createPreloadedFile: function() { FS.error() },
  createLazyFile: function() { FS.error() },
  open: function() { FS.error() },
  mkdev: function() { FS.error() },
  registerDevice: function() { FS.error() },
  analyzePath: function() { FS.error() },
  loadFilesFromDB: function() { FS.error() },

  ErrnoError: function ErrnoError() { FS.error() },
};
Module['FS_createDataFile'] = FS.createDataFile;
Module['FS_createPreloadedFile'] = FS.createPreloadedFile;



// === Body ===

var ASM_CONSTS = [];




STATIC_BASE = Runtime.GLOBAL_BASE;

STATICTOP = STATIC_BASE + 9056;
/* global initializers */  __ATINIT__.push({ func: function() { ___emscripten_pthread_data_constructor() } });


/* memory initializer */ allocate([5,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,3,0,0,0,192,3,0,0,156,31,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,255,255,255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0], "i8", ALLOC_NONE, Runtime.GLOBAL_BASE);





/* no memory initializer */
var tempDoublePtr = STATICTOP; STATICTOP += 16;

assert(tempDoublePtr % 8 == 0);

function copyTempFloat(ptr) { // functions, because inlining this code increases code size too much

  HEAP8[tempDoublePtr] = HEAP8[ptr];

  HEAP8[tempDoublePtr+1] = HEAP8[ptr+1];

  HEAP8[tempDoublePtr+2] = HEAP8[ptr+2];

  HEAP8[tempDoublePtr+3] = HEAP8[ptr+3];

}

function copyTempDouble(ptr) {

  HEAP8[tempDoublePtr] = HEAP8[ptr];

  HEAP8[tempDoublePtr+1] = HEAP8[ptr+1];

  HEAP8[tempDoublePtr+2] = HEAP8[ptr+2];

  HEAP8[tempDoublePtr+3] = HEAP8[ptr+3];

  HEAP8[tempDoublePtr+4] = HEAP8[ptr+4];

  HEAP8[tempDoublePtr+5] = HEAP8[ptr+5];

  HEAP8[tempDoublePtr+6] = HEAP8[ptr+6];

  HEAP8[tempDoublePtr+7] = HEAP8[ptr+7];

}

// {{PRE_LIBRARY}}


  
  function ___setErrNo(value) {
      if (Module['___errno_location']) HEAP32[((Module['___errno_location']())>>2)]=value;
      else Module.printErr('failed to set errno from JS');
      return value;
    } 

   

  function ___lock() {}

  
  function _emscripten_memcpy_big(dest, src, num) {
      HEAPU8.set(HEAPU8.subarray(src, src+num), dest);
      return dest;
    } 

  
  
  
  
  
  
  var _environ=STATICTOP; STATICTOP += 16;;var ___environ=_environ;function ___buildEnvironment(env) {
      // WARNING: Arbitrary limit!
      var MAX_ENV_VALUES = 64;
      var TOTAL_ENV_SIZE = 1024;
  
      // Statically allocate memory for the environment.
      var poolPtr;
      var envPtr;
      if (!___buildEnvironment.called) {
        ___buildEnvironment.called = true;
        // Set default values. Use string keys for Closure Compiler compatibility.
        if (!ENVIRONMENT_IS_BROWSIX) {
          ENV['USER'] = ENV['LOGNAME'] = 'web_user';
          ENV['PATH'] = '/';
          ENV['PWD'] = '/';
          ENV['HOME'] = '/home/web_user';
          ENV['LANG'] = 'C';
          ENV['_'] = Module['thisProgram'];
        }
        // Allocate memory.
        poolPtr = allocate(TOTAL_ENV_SIZE, 'i8', ALLOC_NORMAL);
        envPtr = allocate(MAX_ENV_VALUES * 4,
                          'i8*', ALLOC_NORMAL);
        HEAP32[((envPtr)>>2)]=poolPtr;
        HEAP32[((_environ)>>2)]=envPtr;
      } else {
        envPtr = HEAP32[((_environ)>>2)];
        poolPtr = HEAP32[((envPtr)>>2)];
      }
  
      // Collect key=value lines.
      var strings = [];
      var totalSize = 0;
      for (var key in env) {
        if (typeof env[key] === 'string') {
          var line = key + '=' + env[key];
          strings.push(line);
          totalSize += line.length;
        }
      }
      if (totalSize > TOTAL_ENV_SIZE) {
        throw new Error('Environment size exceeded TOTAL_ENV_SIZE!');
      }
  
      // Make new.
      var ptrSize = 4;
      for (var i = 0; i < strings.length; i++) {
        var line = strings[i];
        writeAsciiToMemory(line, poolPtr);
        HEAP32[(((envPtr)+(i * ptrSize))>>2)]=poolPtr;
        poolPtr += line.length + 1;
      }
      HEAP32[(((envPtr)+(strings.length * ptrSize))>>2)]=0;
    }var ENV={};var BROWSIX={browsix:{async:true,waitOff:-1,syncMsg:{trap:0,args:[0,0,0,0,0,0]},SHM_SIZE:16777216,shm:null,shmU8:null,shm32:null,SHM_OFF:128,SHM_BUF_SIZE:16777088,getShm:function (len) {
          if (len > BROWSIX.browsix.SHM_BUF_SIZE)
            len = BROWSIX.browsix.SHM_BUF_SIZE;
  
          let off = BROWSIX.browsix.SHM_OFF;
          return new Uint8Array(BROWSIX.browsix.shm, off, len);
        },getShmAt:function (off, len) {
          if (off + len > BROWSIX.browsix.SHM_BUF_SIZE)
            len = BROWSIX.browsix.SHM_BUF_SIZE - off;
  
          return new Uint8Array(BROWSIX.browsix.shm, off, len);
        },putShmString:function (off, ptr) {
          let shmU8 = BROWSIX.browsix.shmU8;
          let i = 0;
          for (i = 0; i < BROWSIX.browsix.SHM_BUF_SIZE; i++) {
            shmU8[off + i] = HEAPU8[ptr + i];
            if (HEAPU8[ptr+i] === 0)
              break;
          }
          return off + i + 1;
        },copyFromUser:function (shmBuf, ptr) {
          // shmBuf.set(HEAPU8.subarray(ptr, ptr+shmBuf.length));
          for (let i = 0; i < shmBuf.length; i++)
            shmBuf[i] = HEAPU8[ptr + i];
        },copyToUser:function (ptr, shmBuf, len) {
          if (len === undefined)
            len = shmBuf.length;
          // let buf = HEAPU8.subarray(ptr, ptr+len);
          // buf.set(shmBuf.subarray(0, len));
          for (let i = 0; i < len; i++)
            HEAPU8[ptr + i] = shmBuf[i];
        },SyscallResponseFrom:function (ev) {
          var requiredOnData = ['id', 'name', 'args'];
          if (!ev.data)
            return;
          for (var i = 0; i < requiredOnData.length; i++) {
            if (!ev.data.hasOwnProperty(requiredOnData[i]))
              return;
          }
          var args = ev.data.args; //.map(convertApiErrors);
          return {id: ev.data.id, name: ev.data.name, args: args};
        },syscall:{msgIdSeq:1,outstanding:{},signalHandlers:{init:[function init1(data) {
          // 0: args
          // 1: environ
          // 2: debug flag
          // 3: pid (if fork)
          // 4: heap (if fork)
          // 5: fork args (if fork)
  
          var args = data.args[0];
          var environ = data.args[1];
          // args[4] is a copy of the heap - replace anything we just
          // alloc'd with it.
          if (data.args[4]) {
            var pid = data.args[3];
            var heap = data.args[4];
            var forkArgs = data.args[5];
  
            Runtime.process.parentBuffer = heap;
            Runtime.process.pid = pid;
            Runtime.process.forkArgs = forkArgs;
  
            updateGlobalBuffer(Runtime.process.parentBuffer);
            updateGlobalBufferViews();
  
            assert(HEAP32.buffer === Runtime.process.parentBuffer);
  
            if (typeof asmModule !== 'undefined')
              asm = asmModule(Module.asmGlobalArg, Module.asmLibraryArg, buffer);
            else
              asm = asm(Module.asmGlobalArg, Module.asmLibraryArg, buffer);
            initReceiving();
            initRuntimeFuncs();
  
            asm.stackRestore(forkArgs.stackSave);
            asm.emtStackRestore(forkArgs.emtStackTop);
          }
  
          args = [args[0]].concat(args);
  
          Runtime.process.argv = args;
          Runtime.process.env = environ;
  
          if (typeof SharedArrayBuffer !== 'function') {
            var done = function() {
              BROWSIX.browsix.syscall.exit(-1);
            };
            var msg = 'ERROR: requires SharedArrayBuffer support, exiting\n';
            var buf = new Uint8Array(msg.length);
            for (var i = 0; i < msg.length; i++)
              buf[i] = msg.charCodeAt(i);
  
            BROWSIX.browsix.syscall.syscallAsync(done, 'pwrite', [2, buf, -1]);
            console.log('Embrowsix: shared array buffers required');
            return;
          }
  
          if (typeof gc === 'function') gc();
  
          init2();
          function init2(attempt) {
            if (!attempt)
              attempt = 0;
  
            if (typeof gc === 'function') gc();
  
            var oldHEAP8 = HEAP8;
            try {
              BROWSIX.browsix.shm = new SharedArrayBuffer(BROWSIX.browsix.SHM_SIZE);
              BROWSIX.browsix.shmU8 = new Uint8Array(BROWSIX.browsix.shm);
              BROWSIX.browsix.shm32 = new Int32Array(BROWSIX.browsix.shm);
            } catch (e) {
              if (attempt >= 16)
                throw e;
  
              console.log('couldnt allocate SharedArrayBuffer(' + REAL_TOTAL_MEMORY + '), retrying');
  
              var delay = 200*attempt;
              if (delay > 2000)
                delay = 2000;
  
              if (typeof gc === 'function') gc();
              setTimeout(init2, delay, attempt+1);
              if (typeof gc === 'function') gc();
  
              return;
            }
  
            var PER_BLOCKING = 0x80; // personality constant to tell the kernel we want blocking syscall responses
  
            // it seems malloc overflows into our static allocation, so
            // just reserve that, throw it away, and never use it.  The
            // first number is in bytes, no matter what the 'i*' specifier
            // is :\
            var waitOff = 0;
            BROWSIX.browsix.waitOff = waitOff;
  
            // the original spec called for buffer to be in the transfer
            // list, but the current spec (and dev versions of Chrome)
            // don't support that.  Try it the old way, and if it
            // doesn't work try it the new way.
            BROWSIX.browsix.syscall.syscallAsync(personalityChanged, 'personality',
                                                 [PER_BLOCKING, BROWSIX.browsix.shm, waitOff], []);
            function personalityChanged(err) {
              if (err) {
                console.log('personality: ' + err);
                return;
              }
              BROWSIX.browsix.async = false;
              if (Runtime.process && Runtime.process.env && Runtime.process.env['BROWSIX_PERF']) {
                var binary = Runtime.process.env['BROWSIX_PERF'];
                console.log('PERF: start ' + binary);
                var stopXhr = new XMLHttpRequest();
                stopXhr.open('GET', 'http://localhost:9000/start?binary=' + binary, false);
                stopXhr.send();
              }
              Runtime.process.isReady = true;
              if (typeof asm !== 'object')
                asm = asmModule(Module.asmGlobalArg, Module.asmLibraryArg, buffer);
              initReceiving();
              initRuntimeFuncs();
              Runtime.process.emit('ready');
            }
          }
        }]},syscallAsync:function (cb, name, args, transferrables) {
            var msgId = this.nextMsgId();
            this.outstanding[msgId] = cb;
            self.postMessage({
              id: msgId,
              name: name,
              args: args,
            }, transferrables);
          },sync:function (trap, a1, a2, a3, a4, a5, a6) {
            var waitOff = BROWSIX.browsix.waitOff;
            var syncMsg = BROWSIX.browsix.syncMsg;
            syncMsg.trap = trap|0;
            syncMsg.args[0] = a1|0;
            syncMsg.args[1] = a2|0;
            syncMsg.args[2] = a3|0;
            syncMsg.args[3] = a4|0;
            syncMsg.args[4] = a5|0;
            syncMsg.args[5] = a6|0;
  
            Atomics.store(BROWSIX.browsix.shm32, waitOff >> 2, 0);
            self.postMessage(syncMsg);
            var paranoid = Atomics.load(BROWSIX.browsix.shm32, waitOff >> 2)|0;
            if (paranoid !== 1 && paranoid !== 0) {
              Module.printErr('WARN: someone wrote over our futex alloc(' + waitOff + '): ' + paranoid);
              debugger;
  		  }
  		  let value = "timed-out";
            while (value === "timed-out") {
              value = Atomics.wait(BROWSIX.browsix.shm32, waitOff >> 2, 0, 100);
            }
            Atomics.store(BROWSIX.browsix.shm32, waitOff >> 2, 0);
            return Atomics.load(BROWSIX.browsix.shm32, (waitOff >> 2) + 1);
          },usleep:function (useconds) {
            // int usleep(useconds_t useconds);
            // http://pubs.opengroup.org/onlinepubs/000095399/functions/usleep.html
            var msec = useconds / 1000;
            var target = performance.now() + msec;
            var waitOff = BROWSIX.browsix.waitOff;
  
            var paranoid = Atomics.load(BROWSIX.browsix.shm32, (waitOff >> 2)+8);
            if (paranoid !== 0) {
              Module.printErr('WARN: someone wrote over our futex alloc(' + waitOff + '): ' + paranoid);
            }
  
            Atomics.store(BROWSIX.browsix.shm32, (waitOff >> 2)+8, 0);
  
            var msecsToSleep;
            while (performance.now() < target) {
              msecsToSleep = target - performance.now();
              if (msecsToSleep > 0) {
                Atomics.wait(BROWSIX.browsix.shm32, (waitOff >> 2)+8, 0, msecsToSleep);
              }
            }
            return 0;
          },exit:function (code) {
            if (Runtime.process && Runtime.process.env && Runtime.process.env['BROWSIX_PERF']) {
              var binary = Runtime.process.env['BROWSIX_PERF'];
              console.log('PERF: stop ' + binary);
              var stopXhr = new XMLHttpRequest();
              stopXhr.open('GET', 'http://localhost:9000/stop?binary=' + binary, false);
              stopXhr.send();
            }
            // FIXME: this will only work in sync mode.
            Module['_fflush'](0);
            if (BROWSIX.browsix.async) {
              this.syscallAsync(null, 'exit', [code]);
            } else {
              this.sync(252 /* SYS_exit_group */, code);
            }
            close();
          },addEventListener:function (type, handler) {
            if (!handler)
              return;
            if (this.signalHandlers[type])
              this.signalHandlers[type].push(handler);
            else
              this.signalHandlers[type] = [handler];
          },resultHandler:function (ev) {
            var response = BROWSIX.browsix.SyscallResponseFrom(ev);
            if (!response) {
              console.log('bad usyscall message, dropping');
              console.log(ev);
              return;
            }
            if (response.name) {
              var handlers = this.signalHandlers[response.name];
              if (handlers) {
                for (var i = 0; i < handlers.length; i++)
                  handlers[i](response);
              }
              else {
                console.log('unhandled signal ' + response.name);
              }
              return;
            }
            this.complete(response.id, response.args);
          },complete:function (id, args) {
            var cb = this.outstanding[id];
            delete this.outstanding[id];
            if (cb) {
              cb.apply(undefined, args);
            }
            else {
              console.log('unknown callback for msg ' + id + ' - ' + args);
            }
          },nextMsgId:function () {
            return ++this.msgIdSeq;
          }},__syscall1:function (which, varargs) { // exit
          SYSCALLS.varargs = varargs;
          var status = SYSCALLS.get();
          Module['exit'](status);
          return 0;
        },__syscall2:function (which, varargs) { // fork
          SYSCALLS.varargs = varargs;
          abort('TODO: fork not currently supported in sync Browsix');
        },__syscall3:function (which, varargs) { // read
          SYSCALLS.varargs = varargs;
          let SYS_READ = 3;
          let fd = SYSCALLS.get(), ptr = SYSCALLS.get(), len = SYSCALLS.get();
          let ret = 0;
  
          while (len > 0) {
            let shmBuf = BROWSIX.browsix.getShm(len);
  
            let count = BROWSIX.browsix.syscall.sync(SYS_READ, fd, BROWSIX.browsix.SHM_OFF, shmBuf.length);
            if (count < 0)
                return ret === 0 ? count : ret;
  
            BROWSIX.browsix.copyToUser(ptr, shmBuf, count);
            ret += count;
  
            ptr += shmBuf.length;
            len -= shmBuf.length;
          }
          return ret;
        },__syscall4:function (which, varargs) { // write
          SYSCALLS.varargs = varargs;
          let SYS_WRITE = 4;
          let fd = SYSCALLS.get(), ptr = SYSCALLS.get(), len = SYSCALLS.get();
          let ret = 0;
  
          // it is possible for the buffer being written to be larger
          // than our shared memory segment.  In the common case this
          // while loop executes once, but for large source buffers
          // will iterate several times.
          while (len > 0) {
            let shmBuf = BROWSIX.browsix.getShm(len);
  
            BROWSIX.browsix.copyFromUser(shmBuf, ptr);
  
            var written = BROWSIX.browsix.syscall.sync(SYS_WRITE, fd, BROWSIX.browsix.SHM_OFF, shmBuf.length);
            if (written < 0)
              return ret === 0 ? written : ret;
            ret += written;
  
            ptr += shmBuf.length;
            len -= shmBuf.length;
          }
  
          return ret;
        },__syscall5:function (which, varargs) { // open
          SYSCALLS.varargs = varargs;
          let SYS_OPEN = 5;
          let path = SYSCALLS.get(), flags = SYSCALLS.get(), mode = SYSCALLS.get();
          BROWSIX.browsix.putShmString(BROWSIX.browsix.SHM_OFF, path);
          return BROWSIX.browsix.syscall.sync(SYS_OPEN, BROWSIX.browsix.SHM_OFF, flags, mode);
        },__syscall6:function (which, varargs) { // close
          SYSCALLS.varargs = varargs;
          let SYS_CLOSE = 6;
          let fd = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_CLOSE, fd);
        },__syscall9:function (which, varargs) { // link
          SYSCALLS.varargs = varargs;
          console.log('TODO: link');
          let oldpath = SYSCALLS.get(), newpath = SYSCALLS.get();
          return -ERRNO_CODES.EMLINK; // no hardlinks for us
        },__syscall10:function (which, varargs) { // unlink
          SYSCALLS.varargs = varargs;
          let SYS_UNLINK = 10;
          let path = SYSCALLS.get();
          BROWSIX.browsix.putShmString(BROWSIX.browsix.SHM_OFF, path);
          return BROWSIX.browsix.syscall.sync(SYS_UNLINK, BROWSIX.browsix.SHM_OFF);
        },__syscall11:function (which, varargs) { // execve
          SYSCALLS.varargs = varargs;
          let SYS_EXECVE = 11;
          let filename = SYSCALLS.get(), argv = SYSCALLS.get(), envp = SYSCALLS.get();
          console.log('TODO: execve');
          // need to think about copying argv + envp into shm
          return BROWSIX.browsix.syscall.sync(SYS_EXECVE, filename, argv, envp);
        },__syscall12:function (which, varargs) { // chdir
          SYSCALLS.varargs = varargs;
          let SYS_CHDIR = 12;
          let path = SYSCALLS.get();
          BROWSIX.browsix.putShmString(BROWSIX.browsix.SHM_OFF, path);
          return BROWSIX.browsix.syscall.sync(SYS_CHDIR, BROWSIX.browsix.SHM_OFF);
        },__syscall20:function (which, varargs) { // getpid
          SYSCALLS.varargs = varargs;
          let SYS_GETPID = 20;
          return BROWSIX.browsix.syscall.sync(SYS_GETPID);
        },__syscall33:function (which, varargs) { // access
          SYSCALLS.varargs = varargs;
          var SYS_ACCESS = 33;
          var path = SYSCALLS.get(), amode = SYSCALLS.get();
          BROWSIX.browsix.putShmString(BROWSIX.browsix.SHM_OFF, path);
          return BROWSIX.browsix.syscall.sync(SYS_ACCESS, BROWSIX.browsix.SHM_OFF, amode);
        },__syscall37:function (which, varargs) { // kill
          SYSCALLS.varargs = varargs;
          let SYS_KILL = 37;
          let pid = SYSCALLS.get(), sig = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_KILL, pid, sig);
        },__syscall38:function (which, varargs) { // rename
          SYSCALLS.varargs = varargs;
          let SYS_RENAME = 38;
          let old_path = SYSCALLS.get(), new_path = SYSCALLS.get();
          let old_path_off = BROWSIX.browsix.SHM_OFF;
          let new_path_off = BROWSIX.browsix.putShmString(old_path_off, old_path);
          BROWSIX.browsix.putShmString(new_path_off, new_path);
          return BROWSIX.browsix.syscall.sync(SYS_RENAME, old_path_off, new_path_off);
        },__syscall39:function (which, varargs) { // mkdir
          SYSCALLS.varargs = varargs;
          let SYS_MKDIR = 39;
          let path = SYSCALLS.get(), mode = SYSCALLS.get();
          let path_off = BROWSIX.browsix.SHM_OFF;
          BROWSIX.browsix.putShmString(path_off, path);
          return BROWSIX.browsix.syscall.sync(SYS_MKDIR, path_off, mode);
        },__syscall40:function (which, varargs) { // rmdir
          SYSCALLS.varargs = varargs;
          let SYS_RMDIR = 40;
          let path = SYSCALLS.get();
          let path_off = BROWSIX.browsix.SHM_OFF;
          BROWSIX.browsix.putShmString(path_off, path);
          return BROWSIX.browsix.syscall.sync(SYS_RMDIR, path_off);
        },__syscall41:function (which, varargs) { // dup
          SYSCALLS.varargs = varargs;
          let SYS_DUP = 41;
          let fd1 = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_DUP, fd1);
        },__syscall42:function (which, varargs) { // pipe
          SYSCALLS.varargs = varargs;
          let SYS_PIPE2 = 41;
          let pipefd = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_PIPE2, pipefd, 0);
        },__syscall54:function (which, varargs) { // ioctl
          SYSCALLS.varargs = varargs;
          let SYS_IOCTL = 54;
          let fd = SYSCALLS.get(), op = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_IOCTL, fd, op);
        },__syscall63:function (which, varargs) { // dup2
          SYSCALLS.varargs = varargs;
          let SYS_DUP3 = 330;
          let fd1 = SYSCALLS.get(), fd2 = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_DUP3, fd1, fd2, 0);
        },__syscall64:function (which, varargs) { // getppid
          SYSCALLS.varargs = varargs;
          let SYS_GETPPID = 64;
          return BROWSIX.browsix.syscall.sync(SYS_GETPPID);
        },__syscall83:function (which, varargs) { // symlink
          SYSCALLS.varargs = varargs;
          console.log('TODO: symlink');
          abort('unsupported syscall symlink');
          return 0;
        },__syscall85:function (which, varargs) { // readlink
          SYSCALLS.varargs = varargs;
          console.log('TODO: readlink');
          abort('unsupported syscall readlink');
          return 0;
        },__syscall91:function (which, varargs) { // munmap
          SYSCALLS.varargs = varargs;
          console.log('TODO: munmap');
          abort('unsupported syscall munmap');
        },__syscall94:function (which, varargs) { // fchmod
          SYSCALLS.varargs = varargs;
          console.log('TODO: fchmod');
          //abort('unsupported syscall fchmod');
          return 0;
        },__syscall96:function (which, varargs) { // getpriority
          SYSCALLS.varargs = varargs;
          return 0;
        },__syscall97:function (which, varargs) { // setpriority
          SYSCALLS.varargs = varargs;
          return -ERRNO_CODES.EPERM;
        },__syscall102:function (which, varargs) { // socketcall
          SYSCALLS.varargs = varargs;
          let call = SYSCALLS.get(), args = SYSCALLS.get(), err = 0;
          let SYS_SOCKET_FLAG = 1, SYS_SOCKET = 359;
          let SYS_BIND_FLAG = 2, SYS_BIND = 361;
          let SYS_CONNECT_FLAG = 3, SYS_CONNECT = 362;
          let SYS_LISTEN_FLAG = 4, SYS_LISTEN = 363;
          let SYS_ACCEPT_FLAG = 5, SYS_ACCEPT = 364;
          let SYS_GETSOCKNAME_FLAG = 6, SYS_GETSOCKNAME = 1001;
          let SYS_GETPEERNAME_FLAG = 7, SYS_GETPEERNAME = 52;
  		let SYS_SETSOCKOPT_FLAG = 14, SYS_SOCKOPT = 1000;
  		let SYS_RECVFROM_FLAG = 12, SYS_RECVFROM = 1002;	
          let SYS_SENDMSG_FLAG = 16;
          let SYS_ACCEPT4_FLAG = 364;
  
          console.log(call);
          console.log(args);
  
          debugger;
  
          switch (call) {
            case SYS_SOCKET_FLAG:
              let a0 = HEAPU32[args/4];
              let a1 = HEAPU32[(args/4)+1];
              let a2 = HEAPU32[(args/4)+2];
              err = BROWSIX.browsix.syscall.sync(SYS_SOCKET, a0, a1, a2);
              break;
            case SYS_BIND_FLAG:
              let bind_sockfd = HEAPU32[args/4];
              let bind_bufferPtr = HEAPU32[(args/4)+1];
              let bind_bufferLen = HEAPU32[(args/4)+2];
              let shm_bind_bufferPtr = BROWSIX.browsix.getShmAt(bind_bufferPtr, bind_bufferLen);
              BROWSIX.browsix.copyFromUser(shm_bind_bufferPtr, bind_bufferPtr);
              err = BROWSIX.browsix.syscall.sync(SYS_BIND, bind_sockfd, bind_bufferPtr, bind_bufferLen);
              break;
            case SYS_CONNECT_FLAG:
              let connect_sockfd = HEAPU32[args/4];
              let connect_bufferPtr = HEAPU32[(args/4)+1];
              let connect_bufferLen = HEAPU32[(args/4)+2];
              let shm_connect_bufferPtr = BROWSIX.browsix.getShmAt(connect_bufferPtr, connect_bufferLen);
              BROWSIX.browsix.copyFromUser(shm_connect_bufferPtr, connect_bufferPtr);
              err = BROWSIX.browsix.syscall.sync(SYS_CONNECT, connect_sockfd, connect_bufferPtr, connect_bufferLen);
              break;
            case SYS_LISTEN_FLAG:
              let listen_fd = HEAPU32[args/4];
              let listen_backlog = HEAPU32[(args/4)+1];
              err = BROWSIX.browsix.syscall.sync(SYS_LISTEN, listen_fd, listen_backlog);
              break;
            case SYS_ACCEPT_FLAG:
              let accept_fd = HEAPU32[args/4];
              let accept_addr_ptr = HEAPU32[(args/4)+1];
              let accept_addrlen = HEAPU32[(args/4)+2];
              let shm_accept_bufferPtr = BROWSIX.browsix.getShmAt(accept_addr_ptr, HEAPU32[accept_addrlen >> 2]);
              BROWSIX.browsix.copyFromUser(shm_accept_bufferPtr, accept_addr_ptr);
              err = BROWSIX.browsix.syscall.sync(SYS_ACCEPT, accept_fd, accept_addr_ptr, HEAPU32[accept_addrlen >> 2], 0);
              BROWSIX.browsix.copyToUser(accept_addr_ptr, shm_accept_bufferPtr, shm_accept_bufferPtr.length);
              break;
            case SYS_GETSOCKNAME_FLAG:
              let getsockname_fd = HEAPU32[args/4];
              let getsockname_addr_ptr = HEAPU32[(args/4)+1];
              let getsockname_addrlen = HEAPU32[(args/4)+2];
              let shm_getsockname_bufferPtr = BROWSIX.browsix.getShmAt(getsockname_addr_ptr, getsockname_addrlen);
              BROWSIX.browsix.copyFromUser(shm_getsockname_bufferPtr, getsockname_addr_ptr);
              err = BROWSIX.browsix.syscall.sync(SYS_GETSOCKNAME, getsockname_fd, shm_getsockname_bufferPtr);
              BROWSIX.browsix.copyToUser(getsockname_addr_ptr, shm_getsockname_bufferPtr, shm_getsockname_bufferPtr.length);
              break;
            case SYS_GETPEERNAME_FLAG:
              //err = BROWSIX.browsix.syscall.sync(SYS_GETPEERNAME, 0, 0, 0);
              break;
            case SYS_SETSOCKOPT_FLAG:
              let sockfd = HEAPU32[args/4];
              let level = HEAPU32[(args/4)+1];
              let optname = HEAPU32[(args/4)+2];
              let optval_ptr = HEAPU32[(args/4)+3];
              let optlen = HEAPU32[(args/4)+4];
              let shm_setsockopt_bufferPtr = BROWSIX.browsix.getShmAt(optval_ptr, optlen);
              BROWSIX.browsix.copyFromUser(shm_setsockopt_bufferPtr, optval_ptr);
              err = BROWSIX.browsix.syscall.sync(SYS_SOCKOPT, sockfd, level, optname, shm_setsockopt_bufferPtr);
              break;   
            case SYS_SENDMSG_FLAG:
              break;      
            case SYS_ACCEPT4_FLAG:
              let accept4_fd = HEAPU32[args/4];
              let accept4_addr_ptr = HEAPU32[(args/4)+1];
              let accept4_addrlen = HEAPU32[(args/4)+2];
              let accept4_flags = HEAPU32[(args/4)+3];
              let shm_accept4_bufferPtr = BROWSIX.browsix.getShmAt(accept4_addr_ptr, accept4_addrlen);
              BROWSIX.browsix.copyFromUser(shm_accept4_bufferPtr, accept4_addr_ptr);
              err = BROWSIX.browsix.syscall.sync(SYS_ACCEPT, accept4_fd, shm_accept4_bufferPtr, accept4_flags);
              break;
            case SYS_RECVFROM_FLAG:
              let recvfrom_fd = HEAPU32[args/4];
              let read_buf_ptr = HEAPU32[(args/4)+1];
              let read_buf_len = HEAPU32[(args/4)+2];
              let recvfrom_flags = HEAPU32[(args/4)+3];
              let recvfrom_sockaddr_ptr = HEAPU32[(args/4)+4];
              let recvfrom_sockaddr_len_ptr = HEAPU32[(args/4)+5];
              let sockaddr_len = HEAPU32[recvfrom_sockaddr_len_ptr >> 2];
              let read_buffer_shm = BROWSIX.browsix.getShmAt(read_buf_ptr, read_buf_len);
              let sockaddr_shm = BROWSIX.browsix.getShmAt(recvfrom_sockaddr_ptr, sockaddr_len);
              BROWSIX.browsix.copyFromUser(read_buffer_shm, read_buf_ptr);
              err = BROWSIX.browsix.syscall.sync(SYS_RECVFROM, recvfrom_fd, read_buf_ptr, read_buf_len,
                                                 recvfrom_flags, recvfrom_sockaddr_ptr, sockaddr_len);
              BROWSIX.browsix.copyToUser(read_buf_ptr, read_buffer_shm, read_buffer_shm.length);
              BROWSIX.browsix.copyToUser(recvfrom_sockaddr_ptr, sockaddr_shm, sockaddr_shm.length);
              break;
            default:
              err = -1;
          }
          return err;
        },__syscall140:function (which, varargs) { // llseek
          SYSCALLS.varargs = varargs;
          let SYS_LLSEEK = 140;
          let fd = SYSCALLS.get(), offhi = SYSCALLS.get(), offlo = SYSCALLS.get(), result = SYSCALLS.get(), whence = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_LLSEEK, fd, offhi, offlo, result, whence);
        },__syscall142:function (which, varargs) { // newselect
          SYSCALLS.varargs = varargs;
          let SYS_SELECT = 142;
          let nfds = SYSCALLS.get(), fd_set_ptr_read = SYSCALLS.get(), fd_set_ptr_write = SYSCALLS.get(), fd_set_ptr_except = SYSCALLS.get(), timeout_ptr = SYSCALLS.get();
          
          //let shm_poll_bufferPtr = BROWSIX.browsix.getShmAt(pollfd_ptr, numfds);
          //BROWSIX.browsix.copyFromUser(shm_poll_bufferPtr, pollfd_ptr);
          console.log("newselect called: TODO: implement this");
          return BROWSIX.browsix.syscall.sync(SYS_SELECT, nfds, fd_set_ptr_read, fd_set_ptr_write, fd_set_ptr_except, timeout_ptr);
        },__syscall145:function (which, varargs) { // readv
          SYSCALLS.varargs = varargs;
          let SYS_READ = 3;
          let fd = SYSCALLS.get(), iov = SYSCALLS.get(), iovcnt = SYSCALLS.get();
          let ret = 0;
          for (var i = 0; i < iovcnt; i++) {
            var ptr = HEAP32[(((iov)+(i*8))>>2)];
            var len = HEAP32[(((iov)+(i*8 + 4))>>2)];
            if (len === 0)
              continue;
            // it is possible for the buffer being written to be larger
            // than our shared memory segment.  In the common case this
            // while loop executes once, but for large source buffers
            // will iterate several times.
            while (len > 0) {
              let shmBuf = BROWSIX.browsix.getShm(len);
  
              let count = BROWSIX.browsix.syscall.sync(SYS_READ, fd, BROWSIX.browsix.SHM_OFF, shmBuf.length);
              if (count < 0)
                return ret === 0 ? count : ret;
  
              BROWSIX.browsix.copyToUser(ptr, shmBuf, count);
              ret += count;
  
              ptr += shmBuf.length;
              len -= shmBuf.length;
            }
          }
          return ret;
        },__syscall146:function (which, varargs) { // writev
          SYSCALLS.varargs = varargs;
          let SYS_WRITE = 4;
          let fd = SYSCALLS.get(), iov = SYSCALLS.get(), iovcnt = SYSCALLS.get();
          let ret = 0;
          for (let i = 0; i < iovcnt; i++) {
            let ptr = HEAP32[(((iov)+(i*8))>>2)];
            let len = HEAP32[(((iov)+(i*8 + 4))>>2)];
            if (len === 0)
              continue;
            // it is possible for the buffer being written to be larger
            // than our shared memory segment.  In the common case this
            // while loop executes once, but for large source buffers
            // will iterate several times.
            while (len > 0) {
              let shmBuf = BROWSIX.browsix.getShm(len);
              shmBuf.set(new Uint8Array(buffer, ptr, shmBuf.length));
  
              var written = BROWSIX.browsix.syscall.sync(SYS_WRITE, fd, BROWSIX.browsix.SHM_OFF, shmBuf.length);
              if (written < 0)
                return ret === 0 ? written : ret;
              ret += written;
  
              ptr += shmBuf.length;
              len -= shmBuf.length;
            }
          }
          return ret;
        },__syscall168:function (which, varargs) { // poll
  		debugger;
          SYSCALLS.varargs = varargs;
          let SYS_POLL = 168;
          let pollfd_ptr = SYSCALLS.get(), numfds = SYSCALLS.get(), timeout = SYSCALLS.get();
          let shm_poll_bufferPtr = BROWSIX.browsix.getShmAt(pollfd_ptr, numfds * 64);
          BROWSIX.browsix.copyFromUser(shm_poll_bufferPtr, pollfd_ptr);
          let ret = BROWSIX.browsix.syscall.sync(SYS_POLL, pollfd_ptr, numfds, timeout);
          BROWSIX.browsix.copyToUser(pollfd_ptr, shm_poll_bufferPtr, shm_poll_bufferPtr.length);
          return ret;
        },__syscall174:function (which, varargs) { // rt_sigaction
          SYSCALLS.varargs = varargs;
          let SYS_SIGACTION = 174;
          let signum = SYSCALLS.get(), act = SYSCALLS.get(), oldact = SYSCALLS.get();
  
          // if act->sa_handler == SIG_DFL or SIG_IGN, pass along to
          // kernel.  otherwise, register the pointer here somewhere.
          // and figure out how to invoke it?
  
          return BROWSIX.browsix.syscall.sync(SYS_SIGACTION, signum, act, oldact);
        },__syscall175:function (which, varargs) { // rt_sigprocmask
          SYSCALLS.varargs = varargs;
          let SYS_SIGPROCMASK = 174;
          let how = SYSCALLS.get(), set = SYSCALLS.get(), oldset = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_SIGPROCMASK, how, set, oldset);
        },__syscall180:function (which, varargs) { // pread64
          SYSCALLS.varargs = varargs;
          let SYS_PREAD64 = 180;
          let fd = SYSCALLS.get(), bufp = SYSCALLS.get(), count = SYSCALLS.get(), offset = SYSCALLS.get();
          let shm_pread_bufferPtr = BROWSIX.browsix.getShmAt(bufp, count);
          BROWSIX.browsix.copyFromUser(shm_pread_bufferPtr, bufp);
          let readcount = BROWSIX.browsix.syscall.sync(SYS_PREAD64, fd, bufp, count, offset);
          BROWSIX.browsix.copyToUser(bufp, shm_pread_bufferPtr, shm_pread_bufferPtr.length);
          return readcount;
        },__syscall181:function (which, varargs) { // pwrite64
          debugger;
          SYSCALLS.varargs = varargs;
          let SYS_PWRITE64 = 181;
          let fd = SYSCALLS.get(), bufp = SYSCALLS.get(), count = SYSCALLS.get(), pos = SYSCALLS.get();
          let shm_pwrite_bufferPtr = BROWSIX.browsix.getShmAt(bufp, count);
          BROWSIX.browsix.copyFromUser(shm_pwrite_bufferPtr, bufp);
          return BROWSIX.browsix.syscall.sync(SYS_PWRITE64, fd, bufp, count, pos);
        },__syscall183:function (which, varargs) { // getcwd
          SYSCALLS.varargs = varargs;
          let SYS_GETCWD = 183;
          let ptr = SYSCALLS.get(), len = SYSCALLS.get();
          let shmBuf = BROWSIX.browsix.getShm(len);
          let count = BROWSIX.browsix.syscall.sync(SYS_GETCWD, BROWSIX.browsix.SHM_OFF, shmBuf.length);
          if (count < 0)
            return count;
          BROWSIX.browsix.copyToUser(ptr, shmBuf, count);
          return count;
  	  },__syscall191:function (which, varargs) { // getrlimit
  		SYSCALLS.varargs = varargs;
  		let SYS_GETRLIMIT = 191;
  		let resource = SYSCALLS.get(), rlim_ptr = SYSCALLS.get();
  		let rlim_buf_ptr = BROWSIX.browsix.getShmAt(rlim_ptr, 128);
  		BROWSIX.browsix.copyFromUser(rlim_buf_ptr, 128);
  		let ret = BROWSIX.browsix.syscall.sync(SYS_GETRLIMIT, resource, rlim_ptr);
  		BROWSIX.browsix.copyToUser(rlim_ptr, rlim_buf_ptr, rlim_buf_ptr.length);
  		return ret;
        },__syscall195:function (which, varargs) { // SYS_stat64
          SYSCALLS.varargs = varargs;
          let SYS_STAT = 195;
          let path = SYSCALLS.get(), ptr = SYSCALLS.get();
          let path_off = BROWSIX.browsix.SHM_OFF;
          let buf_off = BROWSIX.browsix.putShmString(path_off, path);
          let shmBuf = BROWSIX.browsix.getShmAt(buf_off, 76);
          let ret = BROWSIX.browsix.syscall.sync(SYS_STAT, path_off, buf_off);
          if (ret === 0)
            BROWSIX.browsix.copyToUser(ptr, shmBuf, shmBuf.length);
          return ret;
        },__syscall196:function (which, varargs) { // SYS_lstat64
          SYSCALLS.varargs = varargs;
          let SYS_LSTAT = 196;
          let path = SYSCALLS.get(), ptr = SYSCALLS.get();
          let path_off = BROWSIX.browsix.SHM_OFF;
          let buf_off = BROWSIX.browsix.putShmString(path_off, path);
          let shmBuf = BROWSIX.browsix.getShmAt(buf_off, 76);
          let ret = BROWSIX.browsix.syscall.sync(SYS_LSTAT, path_off, buf_off);
          if (ret === 0)
            BROWSIX.browsix.copyToUser(ptr, shmBuf, shmBuf.length);
          return ret;
        },__syscall197:function (which, varargs) { // SYS_fstat64
          SYSCALLS.varargs = varargs;
          let SYS_FSTAT = 197;
          let path = SYSCALLS.get(), ptr = SYSCALLS.get();
          let path_off = BROWSIX.browsix.SHM_OFF;
          let buf_off = BROWSIX.browsix.putShmString(path_off, path);
          let shmBuf = BROWSIX.browsix.getShmAt(buf_off, 76);
          let ret = BROWSIX.browsix.syscall.sync(SYS_FSTAT, path, buf_off);
          if (ret === 0)
            BROWSIX.browsix.copyToUser(ptr, shmBuf, shmBuf.length);
          return ret;
        },__syscall212:function (which, varargs) { // SYS_chown
          SYSCALLS.varargs = varargs;
          let SYS_CHOWN = 212;
          let pathname_ptr = SYSCALLS.get(), owner = SYSCALLS.get(), group = SYSCALLS.get();
          // TODO: implement chown in browsix + setup shared memory for the pathname_ptr
          let ret = BROWSIX.browsix.syscall.sync(SYS_CHOWN, pathname_ptr, owner, group);
          return 0;
        },__syscall220:function (which, varargs) { // SYS_getdents64
          SYSCALLS.varargs = varargs;
          let SYS_GETDENTS64 = 220;
          let fd = SYSCALLS.get(), dirp = SYSCALLS.get(), count = SYSCALLS.get();
          // let shmBuf = BROWSIX.browsix.getShm(268 * count);
          let shmBuf = BROWSIX.browsix.getShm(count);
          let ret = BROWSIX.browsix.syscall.sync(SYS_GETDENTS64, fd, BROWSIX.browsix.SHM_OFF, shmBuf.length);
          if (ret >= 0)
            BROWSIX.browsix.copyToUser(dirp, shmBuf, shmBuf.length);
          return ret;
        },__syscall221:function (which, varargs) { // fcntl64
          SYSCALLS.varargs = varargs;
          let SYS_FCNTL64 = 221;
          let fd = SYSCALLS.get(), cmd = SYSCALLS.get();
          let arg = 0;
  
          // only some of the commands have multiple arguments.
          switch (cmd) {
          case 0:
          case 2:
          case 4:
          case 12:
          case 12:
            arg = SYSCALLS.get();
          }
  
          return BROWSIX.browsix.syscall.sync(SYS_FCNTL64, fd, cmd, arg);
        },__syscall330:function (which, varargs) { // dup3
          SYSCALLS.varargs = varargs;
          let SYS_DUP3 = 330;
          let fd1 = SYSCALLS.get(), fd2 = SYSCALLS.get(), flags = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_DUP3, fd1, fd2, flags);
        },__syscall331:function (which, varargs) { // pipe2
          SYSCALLS.varargs = varargs;
          let SYS_PIPE2 = 41;
          let pipefd = SYSCALLS.get(), flags = SYSCALLS.get();
          return BROWSIX.browsix.syscall.sync(SYS_PIPE2, pipefd, flags);
  	  },__syscall340:function (which, varargs) { // prlimit64
  		// we will ignore the "set part now"
  		console.log("TODO: finish implementing prlimit64");
  		SYSCALLS.varargs = varargs;
  		let SYS_GETRLIMIT = 191;
  		var pid = SYSCALLS.get(), resource = SYSCALLS.get(), new_limit = SYSCALLS.get(), old_limit = SYSCALLS.get();
  		debugger;
  		if (old_limit) {
  			let rlim_buf_ptr = BROWSIX.browsix.getShmAt(old_limit, 128);
  			//BROWSIX.browsix.copyFromUser(old_limit, 128);
  			let ret = BROWSIX.browsix.syscall.sync(SYS_GETRLIMIT, resource, old_limit);
  			BROWSIX.browsix.copyToUser(old_limit, rlim_buf_ptr, rlim_buf_ptr.length);
  			return ret;
  		}
  		return 0;
  	  }}};var SYSCALLS={varargs:0,get:function (varargs) {
        SYSCALLS.varargs += 4;
        var ret = HEAP32[(((SYSCALLS.varargs)-(4))>>2)];
        return ret;
      },getStr:function () {
        var ret = Pointer_stringify(SYSCALLS.get());
        return ret;
      },get64:function () {
        var low = SYSCALLS.get(), high = SYSCALLS.get();
        if (low >= 0) assert(high === 0);
        else assert(high === -1);
        return low;
      },getZero:function () {
        assert(SYSCALLS.get() === 0);
      }};function ___syscall140(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // llseek
      var stream = SYSCALLS.getStreamFromFD(), offset_high = SYSCALLS.get(), offset_low = SYSCALLS.get(), result = SYSCALLS.get(), whence = SYSCALLS.get();
      // NOTE: offset_high is unused - Emscripten's off_t is 32-bit
      var offset = offset_low;
      FS.llseek(stream, offset, whence);
      HEAP32[((result)>>2)]=stream.position;
      if (stream.getdents && offset === 0 && whence === 0) stream.getdents = null; // reset readdir state
      return 0;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall146(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // writev
      // hack to support printf in NO_FILESYSTEM
      var stream = SYSCALLS.get(), iov = SYSCALLS.get(), iovcnt = SYSCALLS.get();
      var ret = 0;
      if (!___syscall146.buffer) {
        ___syscall146.buffers = [null, [], []]; // 1 => stdout, 2 => stderr
        ___syscall146.printChar = function(stream, curr) {
          var buffer = ___syscall146.buffers[stream];
          assert(buffer);
          if (curr === 0 || curr === 10) {
            (stream === 1 ? Module['print'] : Module['printErr'])(UTF8ArrayToString(buffer, 0));
            buffer.length = 0;
          } else {
            buffer.push(curr);
          }
        };
      }
      for (var i = 0; i < iovcnt; i++) {
        var ptr = HEAP32[(((iov)+(i*8))>>2)];
        var len = HEAP32[(((iov)+(i*8 + 4))>>2)];
        for (var j = 0; j < len; j++) {
          ___syscall146.printChar(stream, HEAPU8[ptr+j]);
        }
        ret += len;
      }
      return ret;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall54(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // ioctl
      return 0;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___unlock() {}

  function ___syscall6(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // close
      var stream = SYSCALLS.getStreamFromFD();
      FS.close(stream);
      return 0;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }
if (!ENVIRONMENT_IS_BROWSIX) ___buildEnvironment(ENV);;
/* flush anything remaining in the buffer during shutdown */ __ATEXIT__.push(function() { var fflush = Module["_fflush"]; if (fflush) fflush(0); var printChar = ___syscall146.printChar; if (!printChar) return; var buffers = ___syscall146.buffers; if (buffers[1].length) printChar(1, 10); if (buffers[2].length) printChar(2, 10); });;
DYNAMICTOP_PTR = allocate(1, "i32", ALLOC_STATIC);

STACK_BASE = STACKTOP = Runtime.alignMemory(STATICTOP);

STACK_MAX = STACK_BASE + TOTAL_STACK;

DYNAMIC_BASE = Runtime.alignMemory(STACK_MAX);

HEAP32[DYNAMICTOP_PTR>>2] = DYNAMIC_BASE;

staticSealed = true; // seal the static portion of memory

assert(DYNAMIC_BASE < TOTAL_MEMORY, "TOTAL_MEMORY not big enough for stack");


function nullFunc_ii(x) { Module["printErr"]("Invalid function pointer called with signature 'ii'. Perhaps this is an invalid value (e.g. caused by calling a virtual method on a NULL pointer)? Or calling a function with an incorrect type, which will fail? (it is worth building your source files with -Werror (warnings are errors), as warnings can indicate undefined behavior which can cause this)");  Module["printErr"]("Build with ASSERTIONS=2 for more info.");abort(x) }

function nullFunc_iiii(x) { Module["printErr"]("Invalid function pointer called with signature 'iiii'. Perhaps this is an invalid value (e.g. caused by calling a virtual method on a NULL pointer)? Or calling a function with an incorrect type, which will fail? (it is worth building your source files with -Werror (warnings are errors), as warnings can indicate undefined behavior which can cause this)");  Module["printErr"]("Build with ASSERTIONS=2 for more info.");abort(x) }

function invoke_ii(index,a1) {
  try {
    return Module["dynCall_ii"](index,a1);
  } catch(e) {
    if (typeof e !== 'number' && e !== 'longjmp') throw e;
    Module["setThrew"](1, 0);
  }
}

function invoke_iiii(index,a1,a2,a3) {
  try {
    return Module["dynCall_iiii"](index,a1,a2,a3);
  } catch(e) {
    if (typeof e !== 'number' && e !== 'longjmp') throw e;
    Module["setThrew"](1, 0);
  }
}

Module.asmGlobalArg = { "Math": Math, "Int8Array": Int8Array, "Int16Array": Int16Array, "Int32Array": Int32Array, "Uint8Array": Uint8Array, "Uint16Array": Uint16Array, "Uint32Array": Uint32Array, "Float32Array": Float32Array, "Float64Array": Float64Array, "NaN": NaN, "Infinity": Infinity };

Module.asmLibraryArg = { "abort": abort, "assert": assert, "enlargeMemory": enlargeMemory, "getTotalMemory": getTotalMemory, "abortOnCannotGrowMemory": abortOnCannotGrowMemory, "abortStackOverflow": abortStackOverflow, "nullFunc_ii": nullFunc_ii, "nullFunc_iiii": nullFunc_iiii, "invoke_ii": invoke_ii, "invoke_iiii": invoke_iiii, "___buildEnvironment": ___buildEnvironment, "___lock": ___lock, "___syscall6": ___syscall6, "___setErrNo": ___setErrNo, "___syscall140": ___syscall140, "_emscripten_memcpy_big": _emscripten_memcpy_big, "___syscall54": ___syscall54, "___unlock": ___unlock, "___syscall146": ___syscall146, "DYNAMICTOP_PTR": DYNAMICTOP_PTR, "tempDoublePtr": tempDoublePtr, "ABORT": ABORT, "STACKTOP": STACKTOP, "STACK_MAX": STACK_MAX };

if (ENVIRONMENT_IS_BROWSIX) {
  for (var x in BROWSIX.browsix) {
    var m = /^__syscall(\d+)$/.exec(x);
    if (!m)
      continue;
    if (typeof (this['_' + x]) === 'function') {
      this['_' + x] = BROWSIX.browsix[x];
      Module.asmLibraryArg['_' + x] = BROWSIX.browsix[x];
    }
  }
}

var asm = undefined;
// EMSCRIPTEN_START_ASM
var asmModule = (function(global, env, buffer) {
'almost asm';


  var HEAP8 = new global.Int8Array(buffer);
  var HEAP16 = new global.Int16Array(buffer);
  var HEAP32 = new global.Int32Array(buffer);
  var HEAPU8 = new global.Uint8Array(buffer);
  var HEAPU16 = new global.Uint16Array(buffer);
  var HEAPU32 = new global.Uint32Array(buffer);
  var HEAPF32 = new global.Float32Array(buffer);
  var HEAPF64 = new global.Float64Array(buffer);

  var DYNAMICTOP_PTR=env.DYNAMICTOP_PTR|0;
  var tempDoublePtr=env.tempDoublePtr|0;
  var ABORT=env.ABORT|0;
  var STACKTOP=env.STACKTOP|0;
  var STACK_MAX=env.STACK_MAX|0;

  var __THREW__ = 0;
  var threwValue = 0;
  var setjmpId = 0;
  var undef = 0;
  var nan = global.NaN, inf = global.Infinity;
  var tempInt = 0, tempBigInt = 0, tempBigIntS = 0, tempValue = 0, tempDouble = 0.0;
  var tempRet0 = 0;

  var Math_floor=global.Math.floor;
  var Math_abs=global.Math.abs;
  var Math_sqrt=global.Math.sqrt;
  var Math_pow=global.Math.pow;
  var Math_cos=global.Math.cos;
  var Math_sin=global.Math.sin;
  var Math_tan=global.Math.tan;
  var Math_acos=global.Math.acos;
  var Math_asin=global.Math.asin;
  var Math_atan=global.Math.atan;
  var Math_atan2=global.Math.atan2;
  var Math_exp=global.Math.exp;
  var Math_log=global.Math.log;
  var Math_ceil=global.Math.ceil;
  var Math_imul=global.Math.imul;
  var Math_min=global.Math.min;
  var Math_max=global.Math.max;
  var Math_clz32=global.Math.clz32;
  var abort=env.abort;
  var assert=env.assert;
  var enlargeMemory=env.enlargeMemory;
  var getTotalMemory=env.getTotalMemory;
  var abortOnCannotGrowMemory=env.abortOnCannotGrowMemory;
  var abortStackOverflow=env.abortStackOverflow;
  var nullFunc_ii=env.nullFunc_ii;
  var nullFunc_iiii=env.nullFunc_iiii;
  var invoke_ii=env.invoke_ii;
  var invoke_iiii=env.invoke_iiii;
  var ___buildEnvironment=env.___buildEnvironment;
  var ___lock=env.___lock;
  var ___syscall6=env.___syscall6;
  var ___setErrNo=env.___setErrNo;
  var ___syscall140=env.___syscall140;
  var _emscripten_memcpy_big=env._emscripten_memcpy_big;
  var ___syscall54=env.___syscall54;
  var ___unlock=env.___unlock;
  var ___syscall146=env.___syscall146;
  var tempFloat = 0.0;

// EMSCRIPTEN_START_FUNCS

function stackAlloc(size) {
  size = size|0;
  var ret = 0;
  ret = STACKTOP;
  STACKTOP = (STACKTOP + size)|0;
  STACKTOP = (STACKTOP + 15)&-16;
  if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(size|0);

  return ret|0;
}
function stackSave() {
  return STACKTOP|0;
}
function stackRestore(top) {
  top = top|0;
  STACKTOP = top;
}
function establishStackSpace(stackBase, stackMax) {
  stackBase = stackBase|0;
  stackMax = stackMax|0;
  STACKTOP = stackBase;
  STACK_MAX = stackMax;
}

function setThrew(threw, value) {
  threw = threw|0;
  value = value|0;
  if ((__THREW__|0) == 0) {
    __THREW__ = threw;
    threwValue = value;
  }
}

function setTempRet0(value) {
  value = value|0;
  tempRet0 = value;
}
function getTempRet0() {
  return tempRet0|0;
}

function _main() {
 var $retval = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $retval = 0;
 STACKTOP = sp;return 0;
}
function _malloc($bytes) {
 $bytes = $bytes|0;
 var $$pre = 0, $$pre$i = 0, $$pre$i$i = 0, $$pre$i133 = 0, $$pre$i186 = 0, $$pre$i27$i = 0, $$pre$phi$i$iZ2D = 0, $$pre$phi$i187Z2D = 0, $$pre$phi$i28$iZ2D = 0, $$pre$phi$iZ2D = 0, $$pre$phiZ2D = 0, $$sink$i = 0, $$sink$i$i = 0, $$sink$i166 = 0, $$sink2$i = 0, $$sink2$i183 = 0, $$sink4$i = 0, $$v$0$i = 0, $0 = 0, $1 = 0;
 var $10 = 0, $100 = 0, $101 = 0, $102 = 0, $103 = 0, $104 = 0, $105 = 0, $106 = 0, $107 = 0, $108 = 0, $109 = 0, $11 = 0, $110 = 0, $111 = 0, $112 = 0, $113 = 0, $114 = 0, $115 = 0, $116 = 0, $117 = 0;
 var $118 = 0, $119 = 0, $12 = 0, $120 = 0, $121 = 0, $122 = 0, $123 = 0, $124 = 0, $125 = 0, $126 = 0, $127 = 0, $128 = 0, $129 = 0, $13 = 0, $130 = 0, $131 = 0, $132 = 0, $133 = 0, $134 = 0, $135 = 0;
 var $136 = 0, $137 = 0, $138 = 0, $139 = 0, $14 = 0, $140 = 0, $141 = 0, $142 = 0, $143 = 0, $144 = 0, $145 = 0, $146 = 0, $147 = 0, $148 = 0, $149 = 0, $15 = 0, $150 = 0, $151 = 0, $152 = 0, $153 = 0;
 var $154 = 0, $155 = 0, $156 = 0, $157 = 0, $158 = 0, $159 = 0, $16 = 0, $160 = 0, $161 = 0, $162 = 0, $163 = 0, $164 = 0, $165 = 0, $166 = 0, $167 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0;
 var $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0, $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0;
 var $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0, $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0, $50 = 0, $51 = 0, $52 = 0, $53 = 0, $54 = 0, $55 = 0, $56 = 0, $57 = 0;
 var $58 = 0, $59 = 0, $6 = 0, $60 = 0, $61 = 0, $62 = 0, $63 = 0, $64 = 0, $65 = 0, $66 = 0, $67 = 0, $68 = 0, $69 = 0, $7 = 0, $70 = 0, $71 = 0, $72 = 0, $73 = 0, $74 = 0, $75 = 0;
 var $76 = 0, $77 = 0, $78 = 0, $79 = 0, $8 = 0, $80 = 0, $81 = 0, $82 = 0, $83 = 0, $84 = 0, $85 = 0, $86 = 0, $87 = 0, $88 = 0, $89 = 0, $9 = 0, $90 = 0, $91 = 0, $92 = 0, $93 = 0;
 var $94 = 0, $95 = 0, $96 = 0, $97 = 0, $98 = 0, $99 = 0, $F$0$i$i = 0, $F104$0 = 0, $F197$0$i = 0, $F224$0$i$i = 0, $F290$0$i = 0, $I252$0$i$i = 0, $I316$0$i = 0, $I57$0$i$i = 0, $K105$0$i$i = 0, $K305$0$i$i = 0, $K373$0$i = 0, $R$1$i = 0, $R$1$i$i = 0, $R$1$i175 = 0;
 var $R$3$i = 0, $R$3$i$i = 0, $R$3$i179 = 0, $RP$1$i = 0, $RP$1$i$i = 0, $RP$1$i174 = 0, $T$0$i = 0, $T$0$i$i = 0, $T$0$i29$i = 0, $add$i = 0, $add$i$i = 0, $add$i134 = 0, $add$i152 = 0, $add$ptr = 0, $add$ptr$i = 0, $add$ptr$i$i = 0, $add$ptr$i$i$i = 0, $add$ptr$i140 = 0, $add$ptr$i169 = 0, $add$ptr$i2$i$i = 0;
 var $add$ptr$i31$i = 0, $add$ptr$i38$i = 0, $add$ptr$i54$i = 0, $add$ptr14$i$i = 0, $add$ptr15$i$i = 0, $add$ptr16$i$i = 0, $add$ptr166 = 0, $add$ptr169 = 0, $add$ptr17$i$i = 0, $add$ptr178 = 0, $add$ptr181$i = 0, $add$ptr182 = 0, $add$ptr189$i = 0, $add$ptr190$i = 0, $add$ptr193 = 0, $add$ptr199 = 0, $add$ptr2$i$i = 0, $add$ptr205$i$i = 0, $add$ptr212$i$i = 0, $add$ptr225$i = 0;
 var $add$ptr227$i = 0, $add$ptr24$i$i = 0, $add$ptr262$i = 0, $add$ptr269$i = 0, $add$ptr273$i = 0, $add$ptr282$i = 0, $add$ptr3$i$i = 0, $add$ptr30$i$i = 0, $add$ptr369$i$i = 0, $add$ptr4$i$i = 0, $add$ptr4$i$i$i = 0, $add$ptr4$i36$i = 0, $add$ptr4$i43$i = 0, $add$ptr441$i = 0, $add$ptr5$i$i = 0, $add$ptr6$i$i = 0, $add$ptr6$i$i$i = 0, $add$ptr6$i47$i = 0, $add$ptr7$i$i = 0, $add$ptr81$i$i = 0;
 var $add$ptr95 = 0, $add$ptr98 = 0, $add10$i = 0, $add101$i = 0, $add110$i = 0, $add13$i = 0, $add14$i = 0, $add140$i = 0, $add144 = 0, $add150$i = 0, $add17$i = 0, $add17$i155 = 0, $add177$i = 0, $add18$i = 0, $add19$i = 0, $add2 = 0, $add20$i = 0, $add206$i$i = 0, $add212$i = 0, $add215$i = 0;
 var $add22$i = 0, $add246$i = 0, $add26$i$i = 0, $add268$i = 0, $add269$i$i = 0, $add274$i$i = 0, $add278$i$i = 0, $add280$i$i = 0, $add283$i$i = 0, $add337$i = 0, $add342$i = 0, $add346$i = 0, $add348$i = 0, $add351$i = 0, $add46$i = 0, $add50 = 0, $add51$i = 0, $add54 = 0, $add54$i = 0, $add58 = 0;
 var $add62 = 0, $add64 = 0, $add74$i$i = 0, $add77$i = 0, $add78$i = 0, $add79$i$i = 0, $add8 = 0, $add82$i = 0, $add83$i$i = 0, $add85$i$i = 0, $add86$i = 0, $add88$i$i = 0, $add9$i = 0, $add90$i = 0, $add92$i = 0, $and = 0, $and$i = 0, $and$i$i = 0, $and$i$i$i = 0, $and$i11$i = 0;
 var $and$i149 = 0, $and$i32$i = 0, $and$i39$i = 0, $and100$i = 0, $and103$i = 0, $and104$i = 0, $and106 = 0, $and11$add51$i = 0, $and11$i = 0, $and119$i$i = 0, $and12$i = 0, $and13$i = 0, $and13$i$i = 0, $and133$i$i = 0, $and14 = 0, $and145 = 0, $and17$i = 0, $and194$i = 0, $and194$i182 = 0, $and199$i = 0;
 var $and209$i$i = 0, $and21$i = 0, $and21$i156 = 0, $and227$i$i = 0, $and236$i = 0, $and264$i$i = 0, $and268$i$i = 0, $and273$i$i = 0, $and282$i$i = 0, $and29$i = 0, $and292$i = 0, $and295$i$i = 0, $and3$i = 0, $and3$i$i = 0, $and3$i$i$i = 0, $and3$i34$i = 0, $and3$i41$i = 0, $and30$i = 0, $and318$i$i = 0, $and32$i = 0;
 var $and32$i$i = 0, $and33$i$i = 0, $and331$i = 0, $and336$i = 0, $and341$i = 0, $and350$i = 0, $and363$i = 0, $and37$i$i = 0, $and387$i = 0, $and4 = 0, $and40$i$i = 0, $and41 = 0, $and42$i = 0, $and43 = 0, $and46 = 0, $and49 = 0, $and49$i = 0, $and49$i$i = 0, $and53 = 0, $and57 = 0;
 var $and6$i = 0, $and6$i$i = 0, $and6$i10$i = 0, $and6$i14$i = 0, $and61 = 0, $and64$i = 0, $and68$i = 0, $and69$i$i = 0, $and7 = 0, $and73$i = 0, $and73$i$i = 0, $and74 = 0, $and77$i = 0, $and78$i$i = 0, $and8$i = 0, $and80$i = 0, $and81$i = 0, $and85$i = 0, $and87$i$i = 0, $and89$i = 0;
 var $and9$i = 0, $and96$i$i = 0, $arrayidx = 0, $arrayidx$i = 0, $arrayidx$i$i = 0, $arrayidx$i157 = 0, $arrayidx$i50$i = 0, $arrayidx103 = 0, $arrayidx103$i$i = 0, $arrayidx106$i = 0, $arrayidx107$i$i = 0, $arrayidx113$i = 0, $arrayidx113$i167 = 0, $arrayidx121$i = 0, $arrayidx123$i$i = 0, $arrayidx126$i$i = 0, $arrayidx137$i = 0, $arrayidx143$i$i = 0, $arrayidx148$i = 0, $arrayidx151$i = 0;
 var $arrayidx151$i$i = 0, $arrayidx154$i = 0, $arrayidx155$i = 0, $arrayidx161$i = 0, $arrayidx165$i = 0, $arrayidx165$i177 = 0, $arrayidx178$i$i = 0, $arrayidx184$i = 0, $arrayidx184$i$i = 0, $arrayidx195$i$i = 0, $arrayidx196$i = 0, $arrayidx204$i = 0, $arrayidx212$i = 0, $arrayidx223$i$i = 0, $arrayidx228$i = 0, $arrayidx23$i = 0, $arrayidx232$i = 0, $arrayidx239$i = 0, $arrayidx245$i = 0, $arrayidx256$i = 0;
 var $arrayidx27$i = 0, $arrayidx275$i = 0, $arrayidx287$i$i = 0, $arrayidx289$i = 0, $arrayidx290$i$i = 0, $arrayidx325$i$i = 0, $arrayidx355$i = 0, $arrayidx358$i = 0, $arrayidx394$i = 0, $arrayidx40$i = 0, $arrayidx44$i = 0, $arrayidx61$i = 0, $arrayidx65$i = 0, $arrayidx66 = 0, $arrayidx71$i = 0, $arrayidx75$i = 0, $arrayidx91$i$i = 0, $arrayidx92$i$i = 0, $arrayidx94$i = 0, $arrayidx94$i165 = 0;
 var $arrayidx96$i$i = 0, $bk$i = 0, $bk$i$i = 0, $bk$i171 = 0, $bk$i22$i = 0, $bk102$i$i = 0, $bk122 = 0, $bk124 = 0, $bk139$i$i = 0, $bk145$i = 0, $bk158$i$i = 0, $bk161$i$i = 0, $bk18 = 0, $bk218$i = 0, $bk220$i = 0, $bk246$i$i = 0, $bk248$i$i = 0, $bk302$i$i = 0, $bk311$i = 0, $bk313$i = 0;
 var $bk338$i$i = 0, $bk357$i$i = 0, $bk360$i$i = 0, $bk370$i = 0, $bk407$i = 0, $bk429$i = 0, $bk432$i = 0, $bk55$i$i = 0, $bk56$i = 0, $bk67$i$i = 0, $bk74$i$i = 0, $bk85 = 0, $bk91$i$i = 0, $br$2$ph$i = 0, $call107$i = 0, $call131$i = 0, $call132$i = 0, $call275$i = 0, $call37$i = 0, $call68$i = 0;
 var $call83$i = 0, $child$i$i = 0, $child166$i$i = 0, $child289$i$i = 0, $child357$i = 0, $cmp = 0, $cmp$i = 0, $cmp$i$i$i = 0, $cmp$i12$i = 0, $cmp$i146 = 0, $cmp$i3$i$i = 0, $cmp$i33$i = 0, $cmp$i40$i = 0, $cmp$i52$i = 0, $cmp$i9$i = 0, $cmp1 = 0, $cmp1$i = 0, $cmp10 = 0, $cmp100$i$i = 0, $cmp102$i = 0;
 var $cmp104$i$i = 0, $cmp105$i = 0, $cmp106$i$i = 0, $cmp108$i = 0, $cmp108$i$i = 0, $cmp116$i = 0, $cmp118$i = 0, $cmp119$i = 0, $cmp12$i = 0, $cmp120$i$i = 0, $cmp120$i24$i = 0, $cmp123$i = 0, $cmp124$i$i = 0, $cmp126$i = 0, $cmp127$i = 0, $cmp128 = 0, $cmp128$i = 0, $cmp128$i$i = 0, $cmp133$i = 0, $cmp135$i = 0;
 var $cmp137$i = 0, $cmp138$i = 0, $cmp139 = 0, $cmp141$i = 0, $cmp146 = 0, $cmp147$i = 0, $cmp14795$i = 0, $cmp15$i = 0, $cmp151$i = 0, $cmp152$i = 0, $cmp155$i = 0, $cmp156 = 0, $cmp156$i = 0, $cmp156$i$i = 0, $cmp157$i = 0, $cmp159$i = 0, $cmp162 = 0, $cmp162$i = 0, $cmp162$i176 = 0, $cmp166$i = 0;
 var $cmp168$i$i = 0, $cmp174$i = 0, $cmp180$i = 0, $cmp185$i = 0, $cmp185$i$i = 0, $cmp186 = 0, $cmp186$i = 0, $cmp19$i = 0, $cmp190$i = 0, $cmp191$i = 0, $cmp2$i$i = 0, $cmp2$i$i$i = 0, $cmp20$i$i = 0, $cmp203$i = 0, $cmp209$i = 0, $cmp21$i = 0, $cmp215$i$i = 0, $cmp217$i = 0, $cmp218$i = 0, $cmp224$i = 0;
 var $cmp228$i = 0, $cmp229$i = 0, $cmp24$i = 0, $cmp24$i$i = 0, $cmp246$i = 0, $cmp254$i$i = 0, $cmp257$i = 0, $cmp258$i$i = 0, $cmp26$i = 0, $cmp265$i = 0, $cmp27$i$i = 0, $cmp28$i = 0, $cmp28$i$i = 0, $cmp284$i = 0, $cmp286$i = 0, $cmp29 = 0, $cmp3$i$i = 0, $cmp306$i$i = 0, $cmp31 = 0, $cmp319$i = 0;
 var $cmp319$i$i = 0, $cmp32$i = 0, $cmp32$i137 = 0, $cmp323$i = 0, $cmp327$i$i = 0, $cmp34$i = 0, $cmp34$i$i = 0, $cmp35$i = 0, $cmp36$i = 0, $cmp36$i$i = 0, $cmp374$i = 0, $cmp38$i = 0, $cmp38$i$i = 0, $cmp388$i = 0, $cmp396$i = 0, $cmp40$i = 0, $cmp43$i = 0, $cmp45$i = 0, $cmp46$i = 0, $cmp46$i$i = 0;
 var $cmp49$i = 0, $cmp5 = 0, $cmp55$i = 0, $cmp55$i161 = 0, $cmp57$i = 0, $cmp57$i162 = 0, $cmp59$i$i = 0, $cmp60$i = 0, $cmp62$i = 0, $cmp63$i = 0, $cmp63$i$i = 0, $cmp65$i = 0, $cmp66$i = 0, $cmp66$i139 = 0, $cmp69$i = 0, $cmp7$i$i = 0, $cmp70 = 0, $cmp72$i = 0, $cmp75$i$i = 0, $cmp76$i = 0;
 var $cmp81$i = 0, $cmp85$i = 0, $cmp89$i = 0, $cmp9$i$i = 0, $cmp90$i = 0, $cmp91$i = 0, $cmp93$i = 0, $cmp95$i = 0, $cmp96$i = 0, $cmp97$i = 0, $cmp97$i$i = 0, $cmp976$i = 0, $cmp99 = 0, $cond = 0, $cond$i = 0, $cond$i$i = 0, $cond$i$i$i = 0, $cond$i13$i = 0, $cond$i158 = 0, $cond$i35$i = 0;
 var $cond$i42$i = 0, $cond1$i$i = 0, $cond115$i$i = 0, $cond13$i$i = 0, $cond15$i$i = 0, $cond2$i = 0, $cond315$i$i = 0, $cond383$i = 0, $exitcond$i$i = 0, $fd$i = 0, $fd$i$i = 0, $fd$i172 = 0, $fd103$i$i = 0, $fd123 = 0, $fd140$i$i = 0, $fd146$i = 0, $fd148$i$i = 0, $fd160$i$i = 0, $fd219$i = 0, $fd247$i$i = 0;
 var $fd303$i$i = 0, $fd312$i = 0, $fd339$i$i = 0, $fd344$i$i = 0, $fd359$i$i = 0, $fd371$i = 0, $fd408$i = 0, $fd416$i = 0, $fd431$i = 0, $fd54$i$i = 0, $fd57$i = 0, $fd68$i$i = 0, $fd69 = 0, $fd78$i$i = 0, $fd9 = 0, $fd92$i$i = 0, $head = 0, $head$i = 0, $head$i$i = 0, $head$i$i$i = 0;
 var $head$i159 = 0, $head$i18$i = 0, $head$i37$i = 0, $head$i46$i = 0, $head118$i$i = 0, $head168 = 0, $head173 = 0, $head177 = 0, $head179 = 0, $head179$i = 0, $head182$i = 0, $head187$i = 0, $head189$i = 0, $head195 = 0, $head198 = 0, $head208$i$i = 0, $head211$i$i = 0, $head23$i$i = 0, $head25 = 0, $head26$i$i = 0;
 var $head265$i = 0, $head268$i = 0, $head271$i = 0, $head274$i = 0, $head279$i = 0, $head281$i = 0, $head29$i = 0, $head29$i$i = 0, $head317$i$i = 0, $head32$i$i = 0, $head34$i$i = 0, $head386$i = 0, $head7$i$i = 0, $head7$i$i$i = 0, $head7$i48$i = 0, $head94 = 0, $head97 = 0, $head99$i = 0, $i$01$i$i = 0, $idx$0$i = 0;
 var $inc$i$i = 0, $index$i = 0, $index$i$i = 0, $index$i180 = 0, $index$i25$i = 0, $index288$i$i = 0, $index356$i = 0, $magic$i$i = 0, $nb$0 = 0, $neg = 0, $neg$i = 0, $neg$i$i = 0, $neg$i136 = 0, $neg$i181 = 0, $neg103$i = 0, $neg13 = 0, $neg132$i$i = 0, $neg48$i = 0, $neg73 = 0, $next$i = 0;
 var $next$i$i = 0, $next$i$i$i = 0, $next231$i = 0, $not$cmp$i = 0, $not$cmp107$i = 0, $not$cmp114$i = 0, $not$cmp141$i = 0, $not$cmp144$i$i = 0, $not$cmp205$i = 0, $not$cmp3$i = 0, $not$cmp493$i = 0, $oldfirst$0$i$i = 0, $or$cond$i = 0, $or$cond$i163 = 0, $or$cond1$i = 0, $or$cond1$i160 = 0, $or$cond2$i = 0, $or$cond3$i = 0, $or$cond4$i = 0, $or$cond5$i = 0;
 var $or$cond7$i = 0, $or$cond7$not$i = 0, $or$cond8$i = 0, $or$cond93$i = 0, $or$cond94$i = 0, $or$i = 0, $or$i$i = 0, $or$i$i$i = 0, $or$i164 = 0, $or$i45$i = 0, $or101$i$i = 0, $or110 = 0, $or167 = 0, $or172 = 0, $or176 = 0, $or178$i = 0, $or180 = 0, $or183$i = 0, $or186$i = 0, $or188$i = 0;
 var $or19$i$i = 0, $or194 = 0, $or197 = 0, $or204$i = 0, $or210$i$i = 0, $or22$i$i = 0, $or23 = 0, $or232$i$i = 0, $or26 = 0, $or264$i = 0, $or267$i = 0, $or270$i = 0, $or275$i = 0, $or278$i = 0, $or28$i$i = 0, $or280$i = 0, $or297$i = 0, $or300$i$i = 0, $or33$i$i = 0, $or368$i = 0;
 var $or40 = 0, $or44$i$i = 0, $or93 = 0, $or96 = 0, $parent$i = 0, $parent$i$i = 0, $parent$i170 = 0, $parent$i23$i = 0, $parent135$i = 0, $parent138$i$i = 0, $parent149$i = 0, $parent162$i$i = 0, $parent165$i$i = 0, $parent166$i = 0, $parent179$i$i = 0, $parent196$i$i = 0, $parent226$i = 0, $parent240$i = 0, $parent257$i = 0, $parent301$i$i = 0;
 var $parent337$i$i = 0, $parent361$i$i = 0, $parent369$i = 0, $parent406$i = 0, $parent433$i = 0, $qsize$0$i$i = 0, $retval$0 = 0, $rsize$0$i = 0, $rsize$0$lcssa$i = 0, $rsize$07$i = 0, $rsize$1$i = 0, $rsize$3$i = 0, $rsize$4$lcssa$i = 0, $rsize$48$i = 0, $rst$0$i = 0, $rst$1$i = 0, $sflags193$i = 0, $sflags235$i = 0, $shl = 0, $shl$i = 0;
 var $shl$i$i = 0, $shl$i150 = 0, $shl$i49$i = 0, $shl102 = 0, $shl105 = 0, $shl116$i$i = 0, $shl12 = 0, $shl127$i$i = 0, $shl131$i$i = 0, $shl15$i = 0, $shl18$i = 0, $shl192$i = 0, $shl195$i = 0, $shl198$i = 0, $shl22 = 0, $shl222$i$i = 0, $shl226$i$i = 0, $shl265$i$i = 0, $shl270$i$i = 0, $shl276$i$i = 0;
 var $shl279$i$i = 0, $shl288$i = 0, $shl291$i = 0, $shl294$i$i = 0, $shl31$i = 0, $shl316$i$i = 0, $shl326$i$i = 0, $shl333$i = 0, $shl338$i = 0, $shl344$i = 0, $shl347$i = 0, $shl35 = 0, $shl362$i = 0, $shl37 = 0, $shl384$i = 0, $shl39$i$i = 0, $shl395$i = 0, $shl48$i$i = 0, $shl52$i = 0, $shl60$i = 0;
 var $shl65 = 0, $shl70$i$i = 0, $shl72 = 0, $shl75$i$i = 0, $shl81$i$i = 0, $shl84$i$i = 0, $shl9$i = 0, $shl90 = 0, $shl95$i$i = 0, $shr = 0, $shr$i = 0, $shr$i$i = 0, $shr$i145 = 0, $shr$i21$i = 0, $shr101 = 0, $shr11$i = 0, $shr11$i153 = 0, $shr110$i$i = 0, $shr12$i = 0, $shr124$i$i = 0;
 var $shr15$i = 0, $shr16$i = 0, $shr16$i154 = 0, $shr19$i = 0, $shr194$i = 0, $shr20$i = 0, $shr214$i$i = 0, $shr253$i$i = 0, $shr263$i$i = 0, $shr267$i$i = 0, $shr27$i = 0, $shr272$i$i = 0, $shr277$i$i = 0, $shr281$i$i = 0, $shr283$i = 0, $shr3 = 0, $shr310$i$i = 0, $shr318$i = 0, $shr323$i$i = 0, $shr330$i = 0;
 var $shr335$i = 0, $shr340$i = 0, $shr345$i = 0, $shr349$i = 0, $shr378$i = 0, $shr392$i = 0, $shr4$i = 0, $shr42$i = 0, $shr45 = 0, $shr47 = 0, $shr48 = 0, $shr5$i = 0, $shr5$i148 = 0, $shr51 = 0, $shr52 = 0, $shr55 = 0, $shr56 = 0, $shr58$i$i = 0, $shr59 = 0, $shr60 = 0;
 var $shr63 = 0, $shr68$i$i = 0, $shr7$i = 0, $shr7$i151 = 0, $shr72$i = 0, $shr72$i$i = 0, $shr75$i = 0, $shr76$i = 0, $shr77$i$i = 0, $shr79$i = 0, $shr8$i = 0, $shr80$i = 0, $shr82$i$i = 0, $shr83$i = 0, $shr84$i = 0, $shr86$i$i = 0, $shr87$i = 0, $shr88$i = 0, $shr91$i = 0, $size$i$i = 0;
 var $size$i$i$i = 0, $size188$i = 0, $size245$i = 0, $sizebits$0$i = 0, $sizebits$0$shl52$i = 0, $sp$0$i$i = 0, $sp$0$i$i$i = 0, $sp$0104$i = 0, $sp$1103$i = 0, $ssize$2$ph$i = 0, $sub = 0, $sub$i = 0, $sub$i135 = 0, $sub$i144 = 0, $sub$ptr$lhs$cast$i = 0, $sub$ptr$lhs$cast$i$i = 0, $sub$ptr$lhs$cast$i15$i = 0, $sub$ptr$rhs$cast$i = 0, $sub$ptr$rhs$cast$i$i = 0, $sub$ptr$rhs$cast$i16$i = 0;
 var $sub$ptr$sub$i = 0, $sub$ptr$sub$i$i = 0, $sub$ptr$sub$i17$i = 0, $sub$ptr$sub$tsize$4$i = 0, $sub10$i = 0, $sub101$i = 0, $sub101$rsize$4$i = 0, $sub112$i = 0, $sub113$i$i = 0, $sub118$i = 0, $sub14$i = 0, $sub16$i$i = 0, $sub160 = 0, $sub172$i = 0, $sub18$i$i = 0, $sub190 = 0, $sub2$i = 0, $sub22$i = 0, $sub260$i = 0, $sub262$i$i = 0;
 var $sub266$i$i = 0, $sub271$i$i = 0, $sub275$i$i = 0, $sub30$i = 0, $sub31$i = 0, $sub31$rsize$0$i = 0, $sub313$i$i = 0, $sub329$i = 0, $sub33$i = 0, $sub334$i = 0, $sub339$i = 0, $sub343$i = 0, $sub381$i = 0, $sub4$i = 0, $sub41$i = 0, $sub42 = 0, $sub44 = 0, $sub5$i$i = 0, $sub5$i$i$i = 0, $sub5$i44$i = 0;
 var $sub50$i = 0, $sub6$i = 0, $sub63$i = 0, $sub67$i = 0, $sub67$i$i = 0, $sub70$i = 0, $sub71$i$i = 0, $sub76$i$i = 0, $sub80$i$i = 0, $sub91 = 0, $sub99$i = 0, $t$0$i = 0, $t$2$i = 0, $t$4$ph$i = 0, $t$4$v$4$i = 0, $t$47$i = 0, $tbase$792$i = 0, $tobool$i$i = 0, $tobool107 = 0, $tobool195$i = 0;
 var $tobool200$i = 0, $tobool228$i$i = 0, $tobool237$i = 0, $tobool293$i = 0, $tobool296$i$i = 0, $tobool30$i = 0, $tobool364$i = 0, $tobool97$i$i = 0, $tsize$2617179$i = 0, $tsize$4$i = 0, $tsize$791$i = 0, $v$0$i = 0, $v$0$lcssa$i = 0, $v$08$i = 0, $v$1$i = 0, $v$3$i = 0, $v$4$lcssa$i = 0, $v$4$ph$i = 0, $v$49$i = 0, $xor$i$i = 0;
 var label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $magic$i$i = sp;
 $cmp = ($bytes>>>0)<(245);
 do {
  if ($cmp) {
   $cmp1 = ($bytes>>>0)<(11);
   $add2 = (($bytes) + 11)|0;
   $and = $add2 & -8;
   $cond = $cmp1 ? 16 : $and;
   $shr = $cond >>> 3;
   $0 = HEAP32[34]|0;
   $shr3 = $0 >>> $shr;
   $and4 = $shr3 & 3;
   $cmp5 = ($and4|0)==(0);
   if (!($cmp5)) {
    $neg = $shr3 & 1;
    $and7 = $neg ^ 1;
    $add8 = (($and7) + ($shr))|0;
    $shl = $add8 << 1;
    $arrayidx = (176 + ($shl<<2)|0);
    $1 = ((($arrayidx)) + 8|0);
    $2 = HEAP32[$1>>2]|0;
    $fd9 = ((($2)) + 8|0);
    $3 = HEAP32[$fd9>>2]|0;
    $cmp10 = ($arrayidx|0)==($3|0);
    if ($cmp10) {
     $shl12 = 1 << $add8;
     $neg13 = $shl12 ^ -1;
     $and14 = $0 & $neg13;
     HEAP32[34] = $and14;
    } else {
     $bk18 = ((($3)) + 12|0);
     HEAP32[$bk18>>2] = $arrayidx;
     HEAP32[$1>>2] = $3;
    }
    $shl22 = $add8 << 3;
    $or23 = $shl22 | 3;
    $head = ((($2)) + 4|0);
    HEAP32[$head>>2] = $or23;
    $add$ptr = (($2) + ($shl22)|0);
    $head25 = ((($add$ptr)) + 4|0);
    $4 = HEAP32[$head25>>2]|0;
    $or26 = $4 | 1;
    HEAP32[$head25>>2] = $or26;
    $retval$0 = $fd9;
    STACKTOP = sp;return ($retval$0|0);
   }
   $5 = HEAP32[(144)>>2]|0;
   $cmp29 = ($cond>>>0)>($5>>>0);
   if ($cmp29) {
    $cmp31 = ($shr3|0)==(0);
    if (!($cmp31)) {
     $shl35 = $shr3 << $shr;
     $shl37 = 2 << $shr;
     $sub = (0 - ($shl37))|0;
     $or40 = $shl37 | $sub;
     $and41 = $shl35 & $or40;
     $sub42 = (0 - ($and41))|0;
     $and43 = $and41 & $sub42;
     $sub44 = (($and43) + -1)|0;
     $shr45 = $sub44 >>> 12;
     $and46 = $shr45 & 16;
     $shr47 = $sub44 >>> $and46;
     $shr48 = $shr47 >>> 5;
     $and49 = $shr48 & 8;
     $add50 = $and49 | $and46;
     $shr51 = $shr47 >>> $and49;
     $shr52 = $shr51 >>> 2;
     $and53 = $shr52 & 4;
     $add54 = $add50 | $and53;
     $shr55 = $shr51 >>> $and53;
     $shr56 = $shr55 >>> 1;
     $and57 = $shr56 & 2;
     $add58 = $add54 | $and57;
     $shr59 = $shr55 >>> $and57;
     $shr60 = $shr59 >>> 1;
     $and61 = $shr60 & 1;
     $add62 = $add58 | $and61;
     $shr63 = $shr59 >>> $and61;
     $add64 = (($add62) + ($shr63))|0;
     $shl65 = $add64 << 1;
     $arrayidx66 = (176 + ($shl65<<2)|0);
     $6 = ((($arrayidx66)) + 8|0);
     $7 = HEAP32[$6>>2]|0;
     $fd69 = ((($7)) + 8|0);
     $8 = HEAP32[$fd69>>2]|0;
     $cmp70 = ($arrayidx66|0)==($8|0);
     if ($cmp70) {
      $shl72 = 1 << $add64;
      $neg73 = $shl72 ^ -1;
      $and74 = $0 & $neg73;
      HEAP32[34] = $and74;
      $10 = $and74;
     } else {
      $bk85 = ((($8)) + 12|0);
      HEAP32[$bk85>>2] = $arrayidx66;
      HEAP32[$6>>2] = $8;
      $10 = $0;
     }
     $shl90 = $add64 << 3;
     $sub91 = (($shl90) - ($cond))|0;
     $or93 = $cond | 3;
     $head94 = ((($7)) + 4|0);
     HEAP32[$head94>>2] = $or93;
     $add$ptr95 = (($7) + ($cond)|0);
     $or96 = $sub91 | 1;
     $head97 = ((($add$ptr95)) + 4|0);
     HEAP32[$head97>>2] = $or96;
     $add$ptr98 = (($add$ptr95) + ($sub91)|0);
     HEAP32[$add$ptr98>>2] = $sub91;
     $cmp99 = ($5|0)==(0);
     if (!($cmp99)) {
      $9 = HEAP32[(156)>>2]|0;
      $shr101 = $5 >>> 3;
      $shl102 = $shr101 << 1;
      $arrayidx103 = (176 + ($shl102<<2)|0);
      $shl105 = 1 << $shr101;
      $and106 = $10 & $shl105;
      $tobool107 = ($and106|0)==(0);
      if ($tobool107) {
       $or110 = $10 | $shl105;
       HEAP32[34] = $or110;
       $$pre = ((($arrayidx103)) + 8|0);
       $$pre$phiZ2D = $$pre;$F104$0 = $arrayidx103;
      } else {
       $11 = ((($arrayidx103)) + 8|0);
       $12 = HEAP32[$11>>2]|0;
       $$pre$phiZ2D = $11;$F104$0 = $12;
      }
      HEAP32[$$pre$phiZ2D>>2] = $9;
      $bk122 = ((($F104$0)) + 12|0);
      HEAP32[$bk122>>2] = $9;
      $fd123 = ((($9)) + 8|0);
      HEAP32[$fd123>>2] = $F104$0;
      $bk124 = ((($9)) + 12|0);
      HEAP32[$bk124>>2] = $arrayidx103;
     }
     HEAP32[(144)>>2] = $sub91;
     HEAP32[(156)>>2] = $add$ptr95;
     $retval$0 = $fd69;
     STACKTOP = sp;return ($retval$0|0);
    }
    $13 = HEAP32[(140)>>2]|0;
    $cmp128 = ($13|0)==(0);
    if ($cmp128) {
     $nb$0 = $cond;
    } else {
     $sub$i = (0 - ($13))|0;
     $and$i = $13 & $sub$i;
     $sub2$i = (($and$i) + -1)|0;
     $shr$i = $sub2$i >>> 12;
     $and3$i = $shr$i & 16;
     $shr4$i = $sub2$i >>> $and3$i;
     $shr5$i = $shr4$i >>> 5;
     $and6$i = $shr5$i & 8;
     $add$i = $and6$i | $and3$i;
     $shr7$i = $shr4$i >>> $and6$i;
     $shr8$i = $shr7$i >>> 2;
     $and9$i = $shr8$i & 4;
     $add10$i = $add$i | $and9$i;
     $shr11$i = $shr7$i >>> $and9$i;
     $shr12$i = $shr11$i >>> 1;
     $and13$i = $shr12$i & 2;
     $add14$i = $add10$i | $and13$i;
     $shr15$i = $shr11$i >>> $and13$i;
     $shr16$i = $shr15$i >>> 1;
     $and17$i = $shr16$i & 1;
     $add18$i = $add14$i | $and17$i;
     $shr19$i = $shr15$i >>> $and17$i;
     $add20$i = (($add18$i) + ($shr19$i))|0;
     $arrayidx$i = (440 + ($add20$i<<2)|0);
     $14 = HEAP32[$arrayidx$i>>2]|0;
     $head$i = ((($14)) + 4|0);
     $15 = HEAP32[$head$i>>2]|0;
     $and21$i = $15 & -8;
     $sub22$i = (($and21$i) - ($cond))|0;
     $arrayidx232$i = ((($14)) + 16|0);
     $16 = HEAP32[$arrayidx232$i>>2]|0;
     $not$cmp3$i = ($16|0)==(0|0);
     $$sink4$i = $not$cmp3$i&1;
     $arrayidx275$i = (((($14)) + 16|0) + ($$sink4$i<<2)|0);
     $17 = HEAP32[$arrayidx275$i>>2]|0;
     $cmp286$i = ($17|0)==(0|0);
     if ($cmp286$i) {
      $rsize$0$lcssa$i = $sub22$i;$v$0$lcssa$i = $14;
     } else {
      $18 = $17;$rsize$07$i = $sub22$i;$v$08$i = $14;
      while(1) {
       $head29$i = ((($18)) + 4|0);
       $19 = HEAP32[$head29$i>>2]|0;
       $and30$i = $19 & -8;
       $sub31$i = (($and30$i) - ($cond))|0;
       $cmp32$i = ($sub31$i>>>0)<($rsize$07$i>>>0);
       $sub31$rsize$0$i = $cmp32$i ? $sub31$i : $rsize$07$i;
       $$v$0$i = $cmp32$i ? $18 : $v$08$i;
       $arrayidx23$i = ((($18)) + 16|0);
       $20 = HEAP32[$arrayidx23$i>>2]|0;
       $not$cmp$i = ($20|0)==(0|0);
       $$sink$i = $not$cmp$i&1;
       $arrayidx27$i = (((($18)) + 16|0) + ($$sink$i<<2)|0);
       $21 = HEAP32[$arrayidx27$i>>2]|0;
       $cmp28$i = ($21|0)==(0|0);
       if ($cmp28$i) {
        $rsize$0$lcssa$i = $sub31$rsize$0$i;$v$0$lcssa$i = $$v$0$i;
        break;
       } else {
        $18 = $21;$rsize$07$i = $sub31$rsize$0$i;$v$08$i = $$v$0$i;
       }
      }
     }
     $add$ptr$i = (($v$0$lcssa$i) + ($cond)|0);
     $cmp35$i = ($v$0$lcssa$i>>>0)<($add$ptr$i>>>0);
     if ($cmp35$i) {
      $parent$i = ((($v$0$lcssa$i)) + 24|0);
      $22 = HEAP32[$parent$i>>2]|0;
      $bk$i = ((($v$0$lcssa$i)) + 12|0);
      $23 = HEAP32[$bk$i>>2]|0;
      $cmp40$i = ($23|0)==($v$0$lcssa$i|0);
      do {
       if ($cmp40$i) {
        $arrayidx61$i = ((($v$0$lcssa$i)) + 20|0);
        $25 = HEAP32[$arrayidx61$i>>2]|0;
        $cmp62$i = ($25|0)==(0|0);
        if ($cmp62$i) {
         $arrayidx65$i = ((($v$0$lcssa$i)) + 16|0);
         $26 = HEAP32[$arrayidx65$i>>2]|0;
         $cmp66$i = ($26|0)==(0|0);
         if ($cmp66$i) {
          $R$3$i = 0;
          break;
         } else {
          $R$1$i = $26;$RP$1$i = $arrayidx65$i;
         }
        } else {
         $R$1$i = $25;$RP$1$i = $arrayidx61$i;
        }
        while(1) {
         $arrayidx71$i = ((($R$1$i)) + 20|0);
         $27 = HEAP32[$arrayidx71$i>>2]|0;
         $cmp72$i = ($27|0)==(0|0);
         if (!($cmp72$i)) {
          $R$1$i = $27;$RP$1$i = $arrayidx71$i;
          continue;
         }
         $arrayidx75$i = ((($R$1$i)) + 16|0);
         $28 = HEAP32[$arrayidx75$i>>2]|0;
         $cmp76$i = ($28|0)==(0|0);
         if ($cmp76$i) {
          break;
         } else {
          $R$1$i = $28;$RP$1$i = $arrayidx75$i;
         }
        }
        HEAP32[$RP$1$i>>2] = 0;
        $R$3$i = $R$1$i;
       } else {
        $fd$i = ((($v$0$lcssa$i)) + 8|0);
        $24 = HEAP32[$fd$i>>2]|0;
        $bk56$i = ((($24)) + 12|0);
        HEAP32[$bk56$i>>2] = $23;
        $fd57$i = ((($23)) + 8|0);
        HEAP32[$fd57$i>>2] = $24;
        $R$3$i = $23;
       }
      } while(0);
      $cmp90$i = ($22|0)==(0|0);
      do {
       if (!($cmp90$i)) {
        $index$i = ((($v$0$lcssa$i)) + 28|0);
        $29 = HEAP32[$index$i>>2]|0;
        $arrayidx94$i = (440 + ($29<<2)|0);
        $30 = HEAP32[$arrayidx94$i>>2]|0;
        $cmp95$i = ($v$0$lcssa$i|0)==($30|0);
        if ($cmp95$i) {
         HEAP32[$arrayidx94$i>>2] = $R$3$i;
         $cond$i = ($R$3$i|0)==(0|0);
         if ($cond$i) {
          $shl$i = 1 << $29;
          $neg$i = $shl$i ^ -1;
          $and103$i = $13 & $neg$i;
          HEAP32[(140)>>2] = $and103$i;
          break;
         }
        } else {
         $arrayidx113$i = ((($22)) + 16|0);
         $31 = HEAP32[$arrayidx113$i>>2]|0;
         $not$cmp114$i = ($31|0)!=($v$0$lcssa$i|0);
         $$sink2$i = $not$cmp114$i&1;
         $arrayidx121$i = (((($22)) + 16|0) + ($$sink2$i<<2)|0);
         HEAP32[$arrayidx121$i>>2] = $R$3$i;
         $cmp126$i = ($R$3$i|0)==(0|0);
         if ($cmp126$i) {
          break;
         }
        }
        $parent135$i = ((($R$3$i)) + 24|0);
        HEAP32[$parent135$i>>2] = $22;
        $arrayidx137$i = ((($v$0$lcssa$i)) + 16|0);
        $32 = HEAP32[$arrayidx137$i>>2]|0;
        $cmp138$i = ($32|0)==(0|0);
        if (!($cmp138$i)) {
         $arrayidx148$i = ((($R$3$i)) + 16|0);
         HEAP32[$arrayidx148$i>>2] = $32;
         $parent149$i = ((($32)) + 24|0);
         HEAP32[$parent149$i>>2] = $R$3$i;
        }
        $arrayidx154$i = ((($v$0$lcssa$i)) + 20|0);
        $33 = HEAP32[$arrayidx154$i>>2]|0;
        $cmp155$i = ($33|0)==(0|0);
        if (!($cmp155$i)) {
         $arrayidx165$i = ((($R$3$i)) + 20|0);
         HEAP32[$arrayidx165$i>>2] = $33;
         $parent166$i = ((($33)) + 24|0);
         HEAP32[$parent166$i>>2] = $R$3$i;
        }
       }
      } while(0);
      $cmp174$i = ($rsize$0$lcssa$i>>>0)<(16);
      if ($cmp174$i) {
       $add177$i = (($rsize$0$lcssa$i) + ($cond))|0;
       $or178$i = $add177$i | 3;
       $head179$i = ((($v$0$lcssa$i)) + 4|0);
       HEAP32[$head179$i>>2] = $or178$i;
       $add$ptr181$i = (($v$0$lcssa$i) + ($add177$i)|0);
       $head182$i = ((($add$ptr181$i)) + 4|0);
       $34 = HEAP32[$head182$i>>2]|0;
       $or183$i = $34 | 1;
       HEAP32[$head182$i>>2] = $or183$i;
      } else {
       $or186$i = $cond | 3;
       $head187$i = ((($v$0$lcssa$i)) + 4|0);
       HEAP32[$head187$i>>2] = $or186$i;
       $or188$i = $rsize$0$lcssa$i | 1;
       $head189$i = ((($add$ptr$i)) + 4|0);
       HEAP32[$head189$i>>2] = $or188$i;
       $add$ptr190$i = (($add$ptr$i) + ($rsize$0$lcssa$i)|0);
       HEAP32[$add$ptr190$i>>2] = $rsize$0$lcssa$i;
       $cmp191$i = ($5|0)==(0);
       if (!($cmp191$i)) {
        $35 = HEAP32[(156)>>2]|0;
        $shr194$i = $5 >>> 3;
        $shl195$i = $shr194$i << 1;
        $arrayidx196$i = (176 + ($shl195$i<<2)|0);
        $shl198$i = 1 << $shr194$i;
        $and199$i = $0 & $shl198$i;
        $tobool200$i = ($and199$i|0)==(0);
        if ($tobool200$i) {
         $or204$i = $0 | $shl198$i;
         HEAP32[34] = $or204$i;
         $$pre$i = ((($arrayidx196$i)) + 8|0);
         $$pre$phi$iZ2D = $$pre$i;$F197$0$i = $arrayidx196$i;
        } else {
         $36 = ((($arrayidx196$i)) + 8|0);
         $37 = HEAP32[$36>>2]|0;
         $$pre$phi$iZ2D = $36;$F197$0$i = $37;
        }
        HEAP32[$$pre$phi$iZ2D>>2] = $35;
        $bk218$i = ((($F197$0$i)) + 12|0);
        HEAP32[$bk218$i>>2] = $35;
        $fd219$i = ((($35)) + 8|0);
        HEAP32[$fd219$i>>2] = $F197$0$i;
        $bk220$i = ((($35)) + 12|0);
        HEAP32[$bk220$i>>2] = $arrayidx196$i;
       }
       HEAP32[(144)>>2] = $rsize$0$lcssa$i;
       HEAP32[(156)>>2] = $add$ptr$i;
      }
      $add$ptr225$i = ((($v$0$lcssa$i)) + 8|0);
      $retval$0 = $add$ptr225$i;
      STACKTOP = sp;return ($retval$0|0);
     } else {
      $nb$0 = $cond;
     }
    }
   } else {
    $nb$0 = $cond;
   }
  } else {
   $cmp139 = ($bytes>>>0)>(4294967231);
   if ($cmp139) {
    $nb$0 = -1;
   } else {
    $add144 = (($bytes) + 11)|0;
    $and145 = $add144 & -8;
    $38 = HEAP32[(140)>>2]|0;
    $cmp146 = ($38|0)==(0);
    if ($cmp146) {
     $nb$0 = $and145;
    } else {
     $sub$i144 = (0 - ($and145))|0;
     $shr$i145 = $add144 >>> 8;
     $cmp$i146 = ($shr$i145|0)==(0);
     if ($cmp$i146) {
      $idx$0$i = 0;
     } else {
      $cmp1$i = ($and145>>>0)>(16777215);
      if ($cmp1$i) {
       $idx$0$i = 31;
      } else {
       $sub4$i = (($shr$i145) + 1048320)|0;
       $shr5$i148 = $sub4$i >>> 16;
       $and$i149 = $shr5$i148 & 8;
       $shl$i150 = $shr$i145 << $and$i149;
       $sub6$i = (($shl$i150) + 520192)|0;
       $shr7$i151 = $sub6$i >>> 16;
       $and8$i = $shr7$i151 & 4;
       $add$i152 = $and8$i | $and$i149;
       $shl9$i = $shl$i150 << $and8$i;
       $sub10$i = (($shl9$i) + 245760)|0;
       $shr11$i153 = $sub10$i >>> 16;
       $and12$i = $shr11$i153 & 2;
       $add13$i = $add$i152 | $and12$i;
       $sub14$i = (14 - ($add13$i))|0;
       $shl15$i = $shl9$i << $and12$i;
       $shr16$i154 = $shl15$i >>> 15;
       $add17$i155 = (($sub14$i) + ($shr16$i154))|0;
       $shl18$i = $add17$i155 << 1;
       $add19$i = (($add17$i155) + 7)|0;
       $shr20$i = $and145 >>> $add19$i;
       $and21$i156 = $shr20$i & 1;
       $add22$i = $and21$i156 | $shl18$i;
       $idx$0$i = $add22$i;
      }
     }
     $arrayidx$i157 = (440 + ($idx$0$i<<2)|0);
     $39 = HEAP32[$arrayidx$i157>>2]|0;
     $cmp24$i = ($39|0)==(0|0);
     L74: do {
      if ($cmp24$i) {
       $rsize$3$i = $sub$i144;$t$2$i = 0;$v$3$i = 0;
       label = 57;
      } else {
       $cmp26$i = ($idx$0$i|0)==(31);
       $shr27$i = $idx$0$i >>> 1;
       $sub30$i = (25 - ($shr27$i))|0;
       $cond$i158 = $cmp26$i ? 0 : $sub30$i;
       $shl31$i = $and145 << $cond$i158;
       $rsize$0$i = $sub$i144;$rst$0$i = 0;$sizebits$0$i = $shl31$i;$t$0$i = $39;$v$0$i = 0;
       while(1) {
        $head$i159 = ((($t$0$i)) + 4|0);
        $40 = HEAP32[$head$i159>>2]|0;
        $and32$i = $40 & -8;
        $sub33$i = (($and32$i) - ($and145))|0;
        $cmp34$i = ($sub33$i>>>0)<($rsize$0$i>>>0);
        if ($cmp34$i) {
         $cmp36$i = ($sub33$i|0)==(0);
         if ($cmp36$i) {
          $rsize$48$i = 0;$t$47$i = $t$0$i;$v$49$i = $t$0$i;
          label = 61;
          break L74;
         } else {
          $rsize$1$i = $sub33$i;$v$1$i = $t$0$i;
         }
        } else {
         $rsize$1$i = $rsize$0$i;$v$1$i = $v$0$i;
        }
        $arrayidx40$i = ((($t$0$i)) + 20|0);
        $41 = HEAP32[$arrayidx40$i>>2]|0;
        $shr42$i = $sizebits$0$i >>> 31;
        $arrayidx44$i = (((($t$0$i)) + 16|0) + ($shr42$i<<2)|0);
        $42 = HEAP32[$arrayidx44$i>>2]|0;
        $cmp45$i = ($41|0)==(0|0);
        $cmp46$i = ($41|0)==($42|0);
        $or$cond1$i160 = $cmp45$i | $cmp46$i;
        $rst$1$i = $or$cond1$i160 ? $rst$0$i : $41;
        $cmp49$i = ($42|0)==(0|0);
        $not$cmp493$i = $cmp49$i ^ 1;
        $shl52$i = $not$cmp493$i&1;
        $sizebits$0$shl52$i = $sizebits$0$i << $shl52$i;
        if ($cmp49$i) {
         $rsize$3$i = $rsize$1$i;$t$2$i = $rst$1$i;$v$3$i = $v$1$i;
         label = 57;
         break;
        } else {
         $rsize$0$i = $rsize$1$i;$rst$0$i = $rst$1$i;$sizebits$0$i = $sizebits$0$shl52$i;$t$0$i = $42;$v$0$i = $v$1$i;
        }
       }
      }
     } while(0);
     if ((label|0) == 57) {
      $cmp55$i161 = ($t$2$i|0)==(0|0);
      $cmp57$i162 = ($v$3$i|0)==(0|0);
      $or$cond$i163 = $cmp55$i161 & $cmp57$i162;
      if ($or$cond$i163) {
       $shl60$i = 2 << $idx$0$i;
       $sub63$i = (0 - ($shl60$i))|0;
       $or$i164 = $shl60$i | $sub63$i;
       $and64$i = $38 & $or$i164;
       $cmp65$i = ($and64$i|0)==(0);
       if ($cmp65$i) {
        $nb$0 = $and145;
        break;
       }
       $sub67$i = (0 - ($and64$i))|0;
       $and68$i = $and64$i & $sub67$i;
       $sub70$i = (($and68$i) + -1)|0;
       $shr72$i = $sub70$i >>> 12;
       $and73$i = $shr72$i & 16;
       $shr75$i = $sub70$i >>> $and73$i;
       $shr76$i = $shr75$i >>> 5;
       $and77$i = $shr76$i & 8;
       $add78$i = $and77$i | $and73$i;
       $shr79$i = $shr75$i >>> $and77$i;
       $shr80$i = $shr79$i >>> 2;
       $and81$i = $shr80$i & 4;
       $add82$i = $add78$i | $and81$i;
       $shr83$i = $shr79$i >>> $and81$i;
       $shr84$i = $shr83$i >>> 1;
       $and85$i = $shr84$i & 2;
       $add86$i = $add82$i | $and85$i;
       $shr87$i = $shr83$i >>> $and85$i;
       $shr88$i = $shr87$i >>> 1;
       $and89$i = $shr88$i & 1;
       $add90$i = $add86$i | $and89$i;
       $shr91$i = $shr87$i >>> $and89$i;
       $add92$i = (($add90$i) + ($shr91$i))|0;
       $arrayidx94$i165 = (440 + ($add92$i<<2)|0);
       $43 = HEAP32[$arrayidx94$i165>>2]|0;
       $t$4$ph$i = $43;$v$4$ph$i = 0;
      } else {
       $t$4$ph$i = $t$2$i;$v$4$ph$i = $v$3$i;
      }
      $cmp976$i = ($t$4$ph$i|0)==(0|0);
      if ($cmp976$i) {
       $rsize$4$lcssa$i = $rsize$3$i;$v$4$lcssa$i = $v$4$ph$i;
      } else {
       $rsize$48$i = $rsize$3$i;$t$47$i = $t$4$ph$i;$v$49$i = $v$4$ph$i;
       label = 61;
      }
     }
     if ((label|0) == 61) {
      while(1) {
       label = 0;
       $head99$i = ((($t$47$i)) + 4|0);
       $44 = HEAP32[$head99$i>>2]|0;
       $and100$i = $44 & -8;
       $sub101$i = (($and100$i) - ($and145))|0;
       $cmp102$i = ($sub101$i>>>0)<($rsize$48$i>>>0);
       $sub101$rsize$4$i = $cmp102$i ? $sub101$i : $rsize$48$i;
       $t$4$v$4$i = $cmp102$i ? $t$47$i : $v$49$i;
       $arrayidx106$i = ((($t$47$i)) + 16|0);
       $45 = HEAP32[$arrayidx106$i>>2]|0;
       $not$cmp107$i = ($45|0)==(0|0);
       $$sink$i166 = $not$cmp107$i&1;
       $arrayidx113$i167 = (((($t$47$i)) + 16|0) + ($$sink$i166<<2)|0);
       $46 = HEAP32[$arrayidx113$i167>>2]|0;
       $cmp97$i = ($46|0)==(0|0);
       if ($cmp97$i) {
        $rsize$4$lcssa$i = $sub101$rsize$4$i;$v$4$lcssa$i = $t$4$v$4$i;
        break;
       } else {
        $rsize$48$i = $sub101$rsize$4$i;$t$47$i = $46;$v$49$i = $t$4$v$4$i;
        label = 61;
       }
      }
     }
     $cmp116$i = ($v$4$lcssa$i|0)==(0|0);
     if ($cmp116$i) {
      $nb$0 = $and145;
     } else {
      $47 = HEAP32[(144)>>2]|0;
      $sub118$i = (($47) - ($and145))|0;
      $cmp119$i = ($rsize$4$lcssa$i>>>0)<($sub118$i>>>0);
      if ($cmp119$i) {
       $add$ptr$i169 = (($v$4$lcssa$i) + ($and145)|0);
       $cmp123$i = ($v$4$lcssa$i>>>0)<($add$ptr$i169>>>0);
       if (!($cmp123$i)) {
        $retval$0 = 0;
        STACKTOP = sp;return ($retval$0|0);
       }
       $parent$i170 = ((($v$4$lcssa$i)) + 24|0);
       $48 = HEAP32[$parent$i170>>2]|0;
       $bk$i171 = ((($v$4$lcssa$i)) + 12|0);
       $49 = HEAP32[$bk$i171>>2]|0;
       $cmp128$i = ($49|0)==($v$4$lcssa$i|0);
       do {
        if ($cmp128$i) {
         $arrayidx151$i = ((($v$4$lcssa$i)) + 20|0);
         $51 = HEAP32[$arrayidx151$i>>2]|0;
         $cmp152$i = ($51|0)==(0|0);
         if ($cmp152$i) {
          $arrayidx155$i = ((($v$4$lcssa$i)) + 16|0);
          $52 = HEAP32[$arrayidx155$i>>2]|0;
          $cmp156$i = ($52|0)==(0|0);
          if ($cmp156$i) {
           $R$3$i179 = 0;
           break;
          } else {
           $R$1$i175 = $52;$RP$1$i174 = $arrayidx155$i;
          }
         } else {
          $R$1$i175 = $51;$RP$1$i174 = $arrayidx151$i;
         }
         while(1) {
          $arrayidx161$i = ((($R$1$i175)) + 20|0);
          $53 = HEAP32[$arrayidx161$i>>2]|0;
          $cmp162$i176 = ($53|0)==(0|0);
          if (!($cmp162$i176)) {
           $R$1$i175 = $53;$RP$1$i174 = $arrayidx161$i;
           continue;
          }
          $arrayidx165$i177 = ((($R$1$i175)) + 16|0);
          $54 = HEAP32[$arrayidx165$i177>>2]|0;
          $cmp166$i = ($54|0)==(0|0);
          if ($cmp166$i) {
           break;
          } else {
           $R$1$i175 = $54;$RP$1$i174 = $arrayidx165$i177;
          }
         }
         HEAP32[$RP$1$i174>>2] = 0;
         $R$3$i179 = $R$1$i175;
        } else {
         $fd$i172 = ((($v$4$lcssa$i)) + 8|0);
         $50 = HEAP32[$fd$i172>>2]|0;
         $bk145$i = ((($50)) + 12|0);
         HEAP32[$bk145$i>>2] = $49;
         $fd146$i = ((($49)) + 8|0);
         HEAP32[$fd146$i>>2] = $50;
         $R$3$i179 = $49;
        }
       } while(0);
       $cmp180$i = ($48|0)==(0|0);
       do {
        if ($cmp180$i) {
         $64 = $38;
        } else {
         $index$i180 = ((($v$4$lcssa$i)) + 28|0);
         $55 = HEAP32[$index$i180>>2]|0;
         $arrayidx184$i = (440 + ($55<<2)|0);
         $56 = HEAP32[$arrayidx184$i>>2]|0;
         $cmp185$i = ($v$4$lcssa$i|0)==($56|0);
         if ($cmp185$i) {
          HEAP32[$arrayidx184$i>>2] = $R$3$i179;
          $cond2$i = ($R$3$i179|0)==(0|0);
          if ($cond2$i) {
           $shl192$i = 1 << $55;
           $neg$i181 = $shl192$i ^ -1;
           $and194$i182 = $38 & $neg$i181;
           HEAP32[(140)>>2] = $and194$i182;
           $64 = $and194$i182;
           break;
          }
         } else {
          $arrayidx204$i = ((($48)) + 16|0);
          $57 = HEAP32[$arrayidx204$i>>2]|0;
          $not$cmp205$i = ($57|0)!=($v$4$lcssa$i|0);
          $$sink2$i183 = $not$cmp205$i&1;
          $arrayidx212$i = (((($48)) + 16|0) + ($$sink2$i183<<2)|0);
          HEAP32[$arrayidx212$i>>2] = $R$3$i179;
          $cmp217$i = ($R$3$i179|0)==(0|0);
          if ($cmp217$i) {
           $64 = $38;
           break;
          }
         }
         $parent226$i = ((($R$3$i179)) + 24|0);
         HEAP32[$parent226$i>>2] = $48;
         $arrayidx228$i = ((($v$4$lcssa$i)) + 16|0);
         $58 = HEAP32[$arrayidx228$i>>2]|0;
         $cmp229$i = ($58|0)==(0|0);
         if (!($cmp229$i)) {
          $arrayidx239$i = ((($R$3$i179)) + 16|0);
          HEAP32[$arrayidx239$i>>2] = $58;
          $parent240$i = ((($58)) + 24|0);
          HEAP32[$parent240$i>>2] = $R$3$i179;
         }
         $arrayidx245$i = ((($v$4$lcssa$i)) + 20|0);
         $59 = HEAP32[$arrayidx245$i>>2]|0;
         $cmp246$i = ($59|0)==(0|0);
         if ($cmp246$i) {
          $64 = $38;
         } else {
          $arrayidx256$i = ((($R$3$i179)) + 20|0);
          HEAP32[$arrayidx256$i>>2] = $59;
          $parent257$i = ((($59)) + 24|0);
          HEAP32[$parent257$i>>2] = $R$3$i179;
          $64 = $38;
         }
        }
       } while(0);
       $cmp265$i = ($rsize$4$lcssa$i>>>0)<(16);
       do {
        if ($cmp265$i) {
         $add268$i = (($rsize$4$lcssa$i) + ($and145))|0;
         $or270$i = $add268$i | 3;
         $head271$i = ((($v$4$lcssa$i)) + 4|0);
         HEAP32[$head271$i>>2] = $or270$i;
         $add$ptr273$i = (($v$4$lcssa$i) + ($add268$i)|0);
         $head274$i = ((($add$ptr273$i)) + 4|0);
         $60 = HEAP32[$head274$i>>2]|0;
         $or275$i = $60 | 1;
         HEAP32[$head274$i>>2] = $or275$i;
        } else {
         $or278$i = $and145 | 3;
         $head279$i = ((($v$4$lcssa$i)) + 4|0);
         HEAP32[$head279$i>>2] = $or278$i;
         $or280$i = $rsize$4$lcssa$i | 1;
         $head281$i = ((($add$ptr$i169)) + 4|0);
         HEAP32[$head281$i>>2] = $or280$i;
         $add$ptr282$i = (($add$ptr$i169) + ($rsize$4$lcssa$i)|0);
         HEAP32[$add$ptr282$i>>2] = $rsize$4$lcssa$i;
         $shr283$i = $rsize$4$lcssa$i >>> 3;
         $cmp284$i = ($rsize$4$lcssa$i>>>0)<(256);
         if ($cmp284$i) {
          $shl288$i = $shr283$i << 1;
          $arrayidx289$i = (176 + ($shl288$i<<2)|0);
          $61 = HEAP32[34]|0;
          $shl291$i = 1 << $shr283$i;
          $and292$i = $61 & $shl291$i;
          $tobool293$i = ($and292$i|0)==(0);
          if ($tobool293$i) {
           $or297$i = $61 | $shl291$i;
           HEAP32[34] = $or297$i;
           $$pre$i186 = ((($arrayidx289$i)) + 8|0);
           $$pre$phi$i187Z2D = $$pre$i186;$F290$0$i = $arrayidx289$i;
          } else {
           $62 = ((($arrayidx289$i)) + 8|0);
           $63 = HEAP32[$62>>2]|0;
           $$pre$phi$i187Z2D = $62;$F290$0$i = $63;
          }
          HEAP32[$$pre$phi$i187Z2D>>2] = $add$ptr$i169;
          $bk311$i = ((($F290$0$i)) + 12|0);
          HEAP32[$bk311$i>>2] = $add$ptr$i169;
          $fd312$i = ((($add$ptr$i169)) + 8|0);
          HEAP32[$fd312$i>>2] = $F290$0$i;
          $bk313$i = ((($add$ptr$i169)) + 12|0);
          HEAP32[$bk313$i>>2] = $arrayidx289$i;
          break;
         }
         $shr318$i = $rsize$4$lcssa$i >>> 8;
         $cmp319$i = ($shr318$i|0)==(0);
         if ($cmp319$i) {
          $I316$0$i = 0;
         } else {
          $cmp323$i = ($rsize$4$lcssa$i>>>0)>(16777215);
          if ($cmp323$i) {
           $I316$0$i = 31;
          } else {
           $sub329$i = (($shr318$i) + 1048320)|0;
           $shr330$i = $sub329$i >>> 16;
           $and331$i = $shr330$i & 8;
           $shl333$i = $shr318$i << $and331$i;
           $sub334$i = (($shl333$i) + 520192)|0;
           $shr335$i = $sub334$i >>> 16;
           $and336$i = $shr335$i & 4;
           $add337$i = $and336$i | $and331$i;
           $shl338$i = $shl333$i << $and336$i;
           $sub339$i = (($shl338$i) + 245760)|0;
           $shr340$i = $sub339$i >>> 16;
           $and341$i = $shr340$i & 2;
           $add342$i = $add337$i | $and341$i;
           $sub343$i = (14 - ($add342$i))|0;
           $shl344$i = $shl338$i << $and341$i;
           $shr345$i = $shl344$i >>> 15;
           $add346$i = (($sub343$i) + ($shr345$i))|0;
           $shl347$i = $add346$i << 1;
           $add348$i = (($add346$i) + 7)|0;
           $shr349$i = $rsize$4$lcssa$i >>> $add348$i;
           $and350$i = $shr349$i & 1;
           $add351$i = $and350$i | $shl347$i;
           $I316$0$i = $add351$i;
          }
         }
         $arrayidx355$i = (440 + ($I316$0$i<<2)|0);
         $index356$i = ((($add$ptr$i169)) + 28|0);
         HEAP32[$index356$i>>2] = $I316$0$i;
         $child357$i = ((($add$ptr$i169)) + 16|0);
         $arrayidx358$i = ((($child357$i)) + 4|0);
         HEAP32[$arrayidx358$i>>2] = 0;
         HEAP32[$child357$i>>2] = 0;
         $shl362$i = 1 << $I316$0$i;
         $and363$i = $64 & $shl362$i;
         $tobool364$i = ($and363$i|0)==(0);
         if ($tobool364$i) {
          $or368$i = $64 | $shl362$i;
          HEAP32[(140)>>2] = $or368$i;
          HEAP32[$arrayidx355$i>>2] = $add$ptr$i169;
          $parent369$i = ((($add$ptr$i169)) + 24|0);
          HEAP32[$parent369$i>>2] = $arrayidx355$i;
          $bk370$i = ((($add$ptr$i169)) + 12|0);
          HEAP32[$bk370$i>>2] = $add$ptr$i169;
          $fd371$i = ((($add$ptr$i169)) + 8|0);
          HEAP32[$fd371$i>>2] = $add$ptr$i169;
          break;
         }
         $65 = HEAP32[$arrayidx355$i>>2]|0;
         $cmp374$i = ($I316$0$i|0)==(31);
         $shr378$i = $I316$0$i >>> 1;
         $sub381$i = (25 - ($shr378$i))|0;
         $cond383$i = $cmp374$i ? 0 : $sub381$i;
         $shl384$i = $rsize$4$lcssa$i << $cond383$i;
         $K373$0$i = $shl384$i;$T$0$i = $65;
         while(1) {
          $head386$i = ((($T$0$i)) + 4|0);
          $66 = HEAP32[$head386$i>>2]|0;
          $and387$i = $66 & -8;
          $cmp388$i = ($and387$i|0)==($rsize$4$lcssa$i|0);
          if ($cmp388$i) {
           label = 97;
           break;
          }
          $shr392$i = $K373$0$i >>> 31;
          $arrayidx394$i = (((($T$0$i)) + 16|0) + ($shr392$i<<2)|0);
          $shl395$i = $K373$0$i << 1;
          $67 = HEAP32[$arrayidx394$i>>2]|0;
          $cmp396$i = ($67|0)==(0|0);
          if ($cmp396$i) {
           label = 96;
           break;
          } else {
           $K373$0$i = $shl395$i;$T$0$i = $67;
          }
         }
         if ((label|0) == 96) {
          HEAP32[$arrayidx394$i>>2] = $add$ptr$i169;
          $parent406$i = ((($add$ptr$i169)) + 24|0);
          HEAP32[$parent406$i>>2] = $T$0$i;
          $bk407$i = ((($add$ptr$i169)) + 12|0);
          HEAP32[$bk407$i>>2] = $add$ptr$i169;
          $fd408$i = ((($add$ptr$i169)) + 8|0);
          HEAP32[$fd408$i>>2] = $add$ptr$i169;
          break;
         }
         else if ((label|0) == 97) {
          $fd416$i = ((($T$0$i)) + 8|0);
          $68 = HEAP32[$fd416$i>>2]|0;
          $bk429$i = ((($68)) + 12|0);
          HEAP32[$bk429$i>>2] = $add$ptr$i169;
          HEAP32[$fd416$i>>2] = $add$ptr$i169;
          $fd431$i = ((($add$ptr$i169)) + 8|0);
          HEAP32[$fd431$i>>2] = $68;
          $bk432$i = ((($add$ptr$i169)) + 12|0);
          HEAP32[$bk432$i>>2] = $T$0$i;
          $parent433$i = ((($add$ptr$i169)) + 24|0);
          HEAP32[$parent433$i>>2] = 0;
          break;
         }
        }
       } while(0);
       $add$ptr441$i = ((($v$4$lcssa$i)) + 8|0);
       $retval$0 = $add$ptr441$i;
       STACKTOP = sp;return ($retval$0|0);
      } else {
       $nb$0 = $and145;
      }
     }
    }
   }
  }
 } while(0);
 $69 = HEAP32[(144)>>2]|0;
 $cmp156 = ($69>>>0)<($nb$0>>>0);
 if (!($cmp156)) {
  $sub160 = (($69) - ($nb$0))|0;
  $70 = HEAP32[(156)>>2]|0;
  $cmp162 = ($sub160>>>0)>(15);
  if ($cmp162) {
   $add$ptr166 = (($70) + ($nb$0)|0);
   HEAP32[(156)>>2] = $add$ptr166;
   HEAP32[(144)>>2] = $sub160;
   $or167 = $sub160 | 1;
   $head168 = ((($add$ptr166)) + 4|0);
   HEAP32[$head168>>2] = $or167;
   $add$ptr169 = (($add$ptr166) + ($sub160)|0);
   HEAP32[$add$ptr169>>2] = $sub160;
   $or172 = $nb$0 | 3;
   $head173 = ((($70)) + 4|0);
   HEAP32[$head173>>2] = $or172;
  } else {
   HEAP32[(144)>>2] = 0;
   HEAP32[(156)>>2] = 0;
   $or176 = $69 | 3;
   $head177 = ((($70)) + 4|0);
   HEAP32[$head177>>2] = $or176;
   $add$ptr178 = (($70) + ($69)|0);
   $head179 = ((($add$ptr178)) + 4|0);
   $71 = HEAP32[$head179>>2]|0;
   $or180 = $71 | 1;
   HEAP32[$head179>>2] = $or180;
  }
  $add$ptr182 = ((($70)) + 8|0);
  $retval$0 = $add$ptr182;
  STACKTOP = sp;return ($retval$0|0);
 }
 $72 = HEAP32[(148)>>2]|0;
 $cmp186 = ($72>>>0)>($nb$0>>>0);
 if ($cmp186) {
  $sub190 = (($72) - ($nb$0))|0;
  HEAP32[(148)>>2] = $sub190;
  $73 = HEAP32[(160)>>2]|0;
  $add$ptr193 = (($73) + ($nb$0)|0);
  HEAP32[(160)>>2] = $add$ptr193;
  $or194 = $sub190 | 1;
  $head195 = ((($add$ptr193)) + 4|0);
  HEAP32[$head195>>2] = $or194;
  $or197 = $nb$0 | 3;
  $head198 = ((($73)) + 4|0);
  HEAP32[$head198>>2] = $or197;
  $add$ptr199 = ((($73)) + 8|0);
  $retval$0 = $add$ptr199;
  STACKTOP = sp;return ($retval$0|0);
 }
 $74 = HEAP32[152]|0;
 $cmp$i = ($74|0)==(0);
 if ($cmp$i) {
  HEAP32[(616)>>2] = 4096;
  HEAP32[(612)>>2] = 4096;
  HEAP32[(620)>>2] = -1;
  HEAP32[(624)>>2] = -1;
  HEAP32[(628)>>2] = 0;
  HEAP32[(580)>>2] = 0;
  $75 = $magic$i$i;
  $xor$i$i = $75 & -16;
  $and6$i$i = $xor$i$i ^ 1431655768;
  HEAP32[$magic$i$i>>2] = $and6$i$i;
  HEAP32[152] = $and6$i$i;
  $76 = 4096;
 } else {
  $$pre$i133 = HEAP32[(616)>>2]|0;
  $76 = $$pre$i133;
 }
 $add$i134 = (($nb$0) + 48)|0;
 $sub$i135 = (($nb$0) + 47)|0;
 $add9$i = (($76) + ($sub$i135))|0;
 $neg$i136 = (0 - ($76))|0;
 $and11$i = $add9$i & $neg$i136;
 $cmp12$i = ($and11$i>>>0)>($nb$0>>>0);
 if (!($cmp12$i)) {
  $retval$0 = 0;
  STACKTOP = sp;return ($retval$0|0);
 }
 $77 = HEAP32[(576)>>2]|0;
 $cmp15$i = ($77|0)==(0);
 if (!($cmp15$i)) {
  $78 = HEAP32[(568)>>2]|0;
  $add17$i = (($78) + ($and11$i))|0;
  $cmp19$i = ($add17$i>>>0)<=($78>>>0);
  $cmp21$i = ($add17$i>>>0)>($77>>>0);
  $or$cond1$i = $cmp19$i | $cmp21$i;
  if ($or$cond1$i) {
   $retval$0 = 0;
   STACKTOP = sp;return ($retval$0|0);
  }
 }
 $79 = HEAP32[(580)>>2]|0;
 $and29$i = $79 & 4;
 $tobool30$i = ($and29$i|0)==(0);
 L167: do {
  if ($tobool30$i) {
   $80 = HEAP32[(160)>>2]|0;
   $cmp32$i137 = ($80|0)==(0|0);
   L169: do {
    if ($cmp32$i137) {
     label = 118;
    } else {
     $sp$0$i$i = (584);
     while(1) {
      $81 = HEAP32[$sp$0$i$i>>2]|0;
      $cmp$i52$i = ($81>>>0)>($80>>>0);
      if (!($cmp$i52$i)) {
       $size$i$i = ((($sp$0$i$i)) + 4|0);
       $82 = HEAP32[$size$i$i>>2]|0;
       $add$ptr$i54$i = (($81) + ($82)|0);
       $cmp2$i$i = ($add$ptr$i54$i>>>0)>($80>>>0);
       if ($cmp2$i$i) {
        break;
       }
      }
      $next$i$i = ((($sp$0$i$i)) + 8|0);
      $83 = HEAP32[$next$i$i>>2]|0;
      $cmp3$i$i = ($83|0)==(0|0);
      if ($cmp3$i$i) {
       label = 118;
       break L169;
      } else {
       $sp$0$i$i = $83;
      }
     }
     $add77$i = (($add9$i) - ($72))|0;
     $and80$i = $add77$i & $neg$i136;
     $cmp81$i = ($and80$i>>>0)<(2147483647);
     if ($cmp81$i) {
      $call83$i = (_sbrk(($and80$i|0))|0);
      $88 = HEAP32[$sp$0$i$i>>2]|0;
      $89 = HEAP32[$size$i$i>>2]|0;
      $add$ptr$i140 = (($88) + ($89)|0);
      $cmp85$i = ($call83$i|0)==($add$ptr$i140|0);
      if ($cmp85$i) {
       $cmp89$i = ($call83$i|0)==((-1)|0);
       if ($cmp89$i) {
        $tsize$2617179$i = $and80$i;
       } else {
        $tbase$792$i = $call83$i;$tsize$791$i = $and80$i;
        label = 135;
        break L167;
       }
      } else {
       $br$2$ph$i = $call83$i;$ssize$2$ph$i = $and80$i;
       label = 126;
      }
     } else {
      $tsize$2617179$i = 0;
     }
    }
   } while(0);
   do {
    if ((label|0) == 118) {
     $call37$i = (_sbrk(0)|0);
     $cmp38$i = ($call37$i|0)==((-1)|0);
     if ($cmp38$i) {
      $tsize$2617179$i = 0;
     } else {
      $84 = $call37$i;
      $85 = HEAP32[(612)>>2]|0;
      $sub41$i = (($85) + -1)|0;
      $and42$i = $sub41$i & $84;
      $cmp43$i = ($and42$i|0)==(0);
      $add46$i = (($sub41$i) + ($84))|0;
      $neg48$i = (0 - ($85))|0;
      $and49$i = $add46$i & $neg48$i;
      $sub50$i = (($and49$i) - ($84))|0;
      $add51$i = $cmp43$i ? 0 : $sub50$i;
      $and11$add51$i = (($add51$i) + ($and11$i))|0;
      $86 = HEAP32[(568)>>2]|0;
      $add54$i = (($and11$add51$i) + ($86))|0;
      $cmp55$i = ($and11$add51$i>>>0)>($nb$0>>>0);
      $cmp57$i = ($and11$add51$i>>>0)<(2147483647);
      $or$cond$i = $cmp55$i & $cmp57$i;
      if ($or$cond$i) {
       $87 = HEAP32[(576)>>2]|0;
       $cmp60$i = ($87|0)==(0);
       if (!($cmp60$i)) {
        $cmp63$i = ($add54$i>>>0)<=($86>>>0);
        $cmp66$i139 = ($add54$i>>>0)>($87>>>0);
        $or$cond2$i = $cmp63$i | $cmp66$i139;
        if ($or$cond2$i) {
         $tsize$2617179$i = 0;
         break;
        }
       }
       $call68$i = (_sbrk(($and11$add51$i|0))|0);
       $cmp69$i = ($call68$i|0)==($call37$i|0);
       if ($cmp69$i) {
        $tbase$792$i = $call37$i;$tsize$791$i = $and11$add51$i;
        label = 135;
        break L167;
       } else {
        $br$2$ph$i = $call68$i;$ssize$2$ph$i = $and11$add51$i;
        label = 126;
       }
      } else {
       $tsize$2617179$i = 0;
      }
     }
    }
   } while(0);
   do {
    if ((label|0) == 126) {
     $sub112$i = (0 - ($ssize$2$ph$i))|0;
     $cmp91$i = ($br$2$ph$i|0)!=((-1)|0);
     $cmp93$i = ($ssize$2$ph$i>>>0)<(2147483647);
     $or$cond5$i = $cmp93$i & $cmp91$i;
     $cmp96$i = ($add$i134>>>0)>($ssize$2$ph$i>>>0);
     $or$cond3$i = $cmp96$i & $or$cond5$i;
     if (!($or$cond3$i)) {
      $cmp118$i = ($br$2$ph$i|0)==((-1)|0);
      if ($cmp118$i) {
       $tsize$2617179$i = 0;
       break;
      } else {
       $tbase$792$i = $br$2$ph$i;$tsize$791$i = $ssize$2$ph$i;
       label = 135;
       break L167;
      }
     }
     $90 = HEAP32[(616)>>2]|0;
     $sub99$i = (($sub$i135) - ($ssize$2$ph$i))|0;
     $add101$i = (($sub99$i) + ($90))|0;
     $neg103$i = (0 - ($90))|0;
     $and104$i = $add101$i & $neg103$i;
     $cmp105$i = ($and104$i>>>0)<(2147483647);
     if (!($cmp105$i)) {
      $tbase$792$i = $br$2$ph$i;$tsize$791$i = $ssize$2$ph$i;
      label = 135;
      break L167;
     }
     $call107$i = (_sbrk(($and104$i|0))|0);
     $cmp108$i = ($call107$i|0)==((-1)|0);
     if ($cmp108$i) {
      (_sbrk(($sub112$i|0))|0);
      $tsize$2617179$i = 0;
      break;
     } else {
      $add110$i = (($and104$i) + ($ssize$2$ph$i))|0;
      $tbase$792$i = $br$2$ph$i;$tsize$791$i = $add110$i;
      label = 135;
      break L167;
     }
    }
   } while(0);
   $91 = HEAP32[(580)>>2]|0;
   $or$i = $91 | 4;
   HEAP32[(580)>>2] = $or$i;
   $tsize$4$i = $tsize$2617179$i;
   label = 133;
  } else {
   $tsize$4$i = 0;
   label = 133;
  }
 } while(0);
 if ((label|0) == 133) {
  $cmp127$i = ($and11$i>>>0)<(2147483647);
  if ($cmp127$i) {
   $call131$i = (_sbrk(($and11$i|0))|0);
   $call132$i = (_sbrk(0)|0);
   $cmp133$i = ($call131$i|0)!=((-1)|0);
   $cmp135$i = ($call132$i|0)!=((-1)|0);
   $or$cond4$i = $cmp133$i & $cmp135$i;
   $cmp137$i = ($call131$i>>>0)<($call132$i>>>0);
   $or$cond7$i = $cmp137$i & $or$cond4$i;
   $sub$ptr$lhs$cast$i = $call132$i;
   $sub$ptr$rhs$cast$i = $call131$i;
   $sub$ptr$sub$i = (($sub$ptr$lhs$cast$i) - ($sub$ptr$rhs$cast$i))|0;
   $add140$i = (($nb$0) + 40)|0;
   $cmp141$i = ($sub$ptr$sub$i>>>0)>($add140$i>>>0);
   $sub$ptr$sub$tsize$4$i = $cmp141$i ? $sub$ptr$sub$i : $tsize$4$i;
   $or$cond7$not$i = $or$cond7$i ^ 1;
   $cmp14795$i = ($call131$i|0)==((-1)|0);
   $not$cmp141$i = $cmp141$i ^ 1;
   $cmp147$i = $cmp14795$i | $not$cmp141$i;
   $or$cond93$i = $cmp147$i | $or$cond7$not$i;
   if (!($or$cond93$i)) {
    $tbase$792$i = $call131$i;$tsize$791$i = $sub$ptr$sub$tsize$4$i;
    label = 135;
   }
  }
 }
 if ((label|0) == 135) {
  $92 = HEAP32[(568)>>2]|0;
  $add150$i = (($92) + ($tsize$791$i))|0;
  HEAP32[(568)>>2] = $add150$i;
  $93 = HEAP32[(572)>>2]|0;
  $cmp151$i = ($add150$i>>>0)>($93>>>0);
  if ($cmp151$i) {
   HEAP32[(572)>>2] = $add150$i;
  }
  $94 = HEAP32[(160)>>2]|0;
  $cmp157$i = ($94|0)==(0|0);
  do {
   if ($cmp157$i) {
    $95 = HEAP32[(152)>>2]|0;
    $cmp159$i = ($95|0)==(0|0);
    $cmp162$i = ($tbase$792$i>>>0)<($95>>>0);
    $or$cond8$i = $cmp159$i | $cmp162$i;
    if ($or$cond8$i) {
     HEAP32[(152)>>2] = $tbase$792$i;
    }
    HEAP32[(584)>>2] = $tbase$792$i;
    HEAP32[(588)>>2] = $tsize$791$i;
    HEAP32[(596)>>2] = 0;
    $96 = HEAP32[152]|0;
    HEAP32[(172)>>2] = $96;
    HEAP32[(168)>>2] = -1;
    $i$01$i$i = 0;
    while(1) {
     $shl$i49$i = $i$01$i$i << 1;
     $arrayidx$i50$i = (176 + ($shl$i49$i<<2)|0);
     $97 = ((($arrayidx$i50$i)) + 12|0);
     HEAP32[$97>>2] = $arrayidx$i50$i;
     $98 = ((($arrayidx$i50$i)) + 8|0);
     HEAP32[$98>>2] = $arrayidx$i50$i;
     $inc$i$i = (($i$01$i$i) + 1)|0;
     $exitcond$i$i = ($inc$i$i|0)==(32);
     if ($exitcond$i$i) {
      break;
     } else {
      $i$01$i$i = $inc$i$i;
     }
    }
    $sub172$i = (($tsize$791$i) + -40)|0;
    $add$ptr$i38$i = ((($tbase$792$i)) + 8|0);
    $99 = $add$ptr$i38$i;
    $and$i39$i = $99 & 7;
    $cmp$i40$i = ($and$i39$i|0)==(0);
    $100 = (0 - ($99))|0;
    $and3$i41$i = $100 & 7;
    $cond$i42$i = $cmp$i40$i ? 0 : $and3$i41$i;
    $add$ptr4$i43$i = (($tbase$792$i) + ($cond$i42$i)|0);
    $sub5$i44$i = (($sub172$i) - ($cond$i42$i))|0;
    HEAP32[(160)>>2] = $add$ptr4$i43$i;
    HEAP32[(148)>>2] = $sub5$i44$i;
    $or$i45$i = $sub5$i44$i | 1;
    $head$i46$i = ((($add$ptr4$i43$i)) + 4|0);
    HEAP32[$head$i46$i>>2] = $or$i45$i;
    $add$ptr6$i47$i = (($add$ptr4$i43$i) + ($sub5$i44$i)|0);
    $head7$i48$i = ((($add$ptr6$i47$i)) + 4|0);
    HEAP32[$head7$i48$i>>2] = 40;
    $101 = HEAP32[(624)>>2]|0;
    HEAP32[(164)>>2] = $101;
   } else {
    $sp$0104$i = (584);
    while(1) {
     $102 = HEAP32[$sp$0104$i>>2]|0;
     $size188$i = ((($sp$0104$i)) + 4|0);
     $103 = HEAP32[$size188$i>>2]|0;
     $add$ptr189$i = (($102) + ($103)|0);
     $cmp190$i = ($tbase$792$i|0)==($add$ptr189$i|0);
     if ($cmp190$i) {
      label = 145;
      break;
     }
     $next$i = ((($sp$0104$i)) + 8|0);
     $104 = HEAP32[$next$i>>2]|0;
     $cmp186$i = ($104|0)==(0|0);
     if ($cmp186$i) {
      break;
     } else {
      $sp$0104$i = $104;
     }
    }
    if ((label|0) == 145) {
     $sflags193$i = ((($sp$0104$i)) + 12|0);
     $105 = HEAP32[$sflags193$i>>2]|0;
     $and194$i = $105 & 8;
     $tobool195$i = ($and194$i|0)==(0);
     if ($tobool195$i) {
      $cmp203$i = ($94>>>0)>=($102>>>0);
      $cmp209$i = ($94>>>0)<($tbase$792$i>>>0);
      $or$cond94$i = $cmp209$i & $cmp203$i;
      if ($or$cond94$i) {
       $add212$i = (($103) + ($tsize$791$i))|0;
       HEAP32[$size188$i>>2] = $add212$i;
       $106 = HEAP32[(148)>>2]|0;
       $add$ptr$i31$i = ((($94)) + 8|0);
       $107 = $add$ptr$i31$i;
       $and$i32$i = $107 & 7;
       $cmp$i33$i = ($and$i32$i|0)==(0);
       $108 = (0 - ($107))|0;
       $and3$i34$i = $108 & 7;
       $cond$i35$i = $cmp$i33$i ? 0 : $and3$i34$i;
       $add$ptr4$i36$i = (($94) + ($cond$i35$i)|0);
       $add215$i = (($tsize$791$i) - ($cond$i35$i))|0;
       $sub5$i$i = (($106) + ($add215$i))|0;
       HEAP32[(160)>>2] = $add$ptr4$i36$i;
       HEAP32[(148)>>2] = $sub5$i$i;
       $or$i$i = $sub5$i$i | 1;
       $head$i37$i = ((($add$ptr4$i36$i)) + 4|0);
       HEAP32[$head$i37$i>>2] = $or$i$i;
       $add$ptr6$i$i = (($add$ptr4$i36$i) + ($sub5$i$i)|0);
       $head7$i$i = ((($add$ptr6$i$i)) + 4|0);
       HEAP32[$head7$i$i>>2] = 40;
       $109 = HEAP32[(624)>>2]|0;
       HEAP32[(164)>>2] = $109;
       break;
      }
     }
    }
    $110 = HEAP32[(152)>>2]|0;
    $cmp218$i = ($tbase$792$i>>>0)<($110>>>0);
    if ($cmp218$i) {
     HEAP32[(152)>>2] = $tbase$792$i;
    }
    $add$ptr227$i = (($tbase$792$i) + ($tsize$791$i)|0);
    $sp$1103$i = (584);
    while(1) {
     $111 = HEAP32[$sp$1103$i>>2]|0;
     $cmp228$i = ($111|0)==($add$ptr227$i|0);
     if ($cmp228$i) {
      label = 153;
      break;
     }
     $next231$i = ((($sp$1103$i)) + 8|0);
     $112 = HEAP32[$next231$i>>2]|0;
     $cmp224$i = ($112|0)==(0|0);
     if ($cmp224$i) {
      break;
     } else {
      $sp$1103$i = $112;
     }
    }
    if ((label|0) == 153) {
     $sflags235$i = ((($sp$1103$i)) + 12|0);
     $113 = HEAP32[$sflags235$i>>2]|0;
     $and236$i = $113 & 8;
     $tobool237$i = ($and236$i|0)==(0);
     if ($tobool237$i) {
      HEAP32[$sp$1103$i>>2] = $tbase$792$i;
      $size245$i = ((($sp$1103$i)) + 4|0);
      $114 = HEAP32[$size245$i>>2]|0;
      $add246$i = (($114) + ($tsize$791$i))|0;
      HEAP32[$size245$i>>2] = $add246$i;
      $add$ptr$i$i = ((($tbase$792$i)) + 8|0);
      $115 = $add$ptr$i$i;
      $and$i11$i = $115 & 7;
      $cmp$i12$i = ($and$i11$i|0)==(0);
      $116 = (0 - ($115))|0;
      $and3$i$i = $116 & 7;
      $cond$i13$i = $cmp$i12$i ? 0 : $and3$i$i;
      $add$ptr4$i$i = (($tbase$792$i) + ($cond$i13$i)|0);
      $add$ptr5$i$i = ((($add$ptr227$i)) + 8|0);
      $117 = $add$ptr5$i$i;
      $and6$i14$i = $117 & 7;
      $cmp7$i$i = ($and6$i14$i|0)==(0);
      $118 = (0 - ($117))|0;
      $and13$i$i = $118 & 7;
      $cond15$i$i = $cmp7$i$i ? 0 : $and13$i$i;
      $add$ptr16$i$i = (($add$ptr227$i) + ($cond15$i$i)|0);
      $sub$ptr$lhs$cast$i15$i = $add$ptr16$i$i;
      $sub$ptr$rhs$cast$i16$i = $add$ptr4$i$i;
      $sub$ptr$sub$i17$i = (($sub$ptr$lhs$cast$i15$i) - ($sub$ptr$rhs$cast$i16$i))|0;
      $add$ptr17$i$i = (($add$ptr4$i$i) + ($nb$0)|0);
      $sub18$i$i = (($sub$ptr$sub$i17$i) - ($nb$0))|0;
      $or19$i$i = $nb$0 | 3;
      $head$i18$i = ((($add$ptr4$i$i)) + 4|0);
      HEAP32[$head$i18$i>>2] = $or19$i$i;
      $cmp20$i$i = ($add$ptr16$i$i|0)==($94|0);
      do {
       if ($cmp20$i$i) {
        $119 = HEAP32[(148)>>2]|0;
        $add$i$i = (($119) + ($sub18$i$i))|0;
        HEAP32[(148)>>2] = $add$i$i;
        HEAP32[(160)>>2] = $add$ptr17$i$i;
        $or22$i$i = $add$i$i | 1;
        $head23$i$i = ((($add$ptr17$i$i)) + 4|0);
        HEAP32[$head23$i$i>>2] = $or22$i$i;
       } else {
        $120 = HEAP32[(156)>>2]|0;
        $cmp24$i$i = ($add$ptr16$i$i|0)==($120|0);
        if ($cmp24$i$i) {
         $121 = HEAP32[(144)>>2]|0;
         $add26$i$i = (($121) + ($sub18$i$i))|0;
         HEAP32[(144)>>2] = $add26$i$i;
         HEAP32[(156)>>2] = $add$ptr17$i$i;
         $or28$i$i = $add26$i$i | 1;
         $head29$i$i = ((($add$ptr17$i$i)) + 4|0);
         HEAP32[$head29$i$i>>2] = $or28$i$i;
         $add$ptr30$i$i = (($add$ptr17$i$i) + ($add26$i$i)|0);
         HEAP32[$add$ptr30$i$i>>2] = $add26$i$i;
         break;
        }
        $head32$i$i = ((($add$ptr16$i$i)) + 4|0);
        $122 = HEAP32[$head32$i$i>>2]|0;
        $and33$i$i = $122 & 3;
        $cmp34$i$i = ($and33$i$i|0)==(1);
        if ($cmp34$i$i) {
         $and37$i$i = $122 & -8;
         $shr$i21$i = $122 >>> 3;
         $cmp38$i$i = ($122>>>0)<(256);
         L237: do {
          if ($cmp38$i$i) {
           $fd$i$i = ((($add$ptr16$i$i)) + 8|0);
           $123 = HEAP32[$fd$i$i>>2]|0;
           $bk$i22$i = ((($add$ptr16$i$i)) + 12|0);
           $124 = HEAP32[$bk$i22$i>>2]|0;
           $cmp46$i$i = ($124|0)==($123|0);
           if ($cmp46$i$i) {
            $shl48$i$i = 1 << $shr$i21$i;
            $neg$i$i = $shl48$i$i ^ -1;
            $125 = HEAP32[34]|0;
            $and49$i$i = $125 & $neg$i$i;
            HEAP32[34] = $and49$i$i;
            break;
           } else {
            $bk67$i$i = ((($123)) + 12|0);
            HEAP32[$bk67$i$i>>2] = $124;
            $fd68$i$i = ((($124)) + 8|0);
            HEAP32[$fd68$i$i>>2] = $123;
            break;
           }
          } else {
           $parent$i23$i = ((($add$ptr16$i$i)) + 24|0);
           $126 = HEAP32[$parent$i23$i>>2]|0;
           $bk74$i$i = ((($add$ptr16$i$i)) + 12|0);
           $127 = HEAP32[$bk74$i$i>>2]|0;
           $cmp75$i$i = ($127|0)==($add$ptr16$i$i|0);
           do {
            if ($cmp75$i$i) {
             $child$i$i = ((($add$ptr16$i$i)) + 16|0);
             $arrayidx96$i$i = ((($child$i$i)) + 4|0);
             $129 = HEAP32[$arrayidx96$i$i>>2]|0;
             $cmp97$i$i = ($129|0)==(0|0);
             if ($cmp97$i$i) {
              $130 = HEAP32[$child$i$i>>2]|0;
              $cmp100$i$i = ($130|0)==(0|0);
              if ($cmp100$i$i) {
               $R$3$i$i = 0;
               break;
              } else {
               $R$1$i$i = $130;$RP$1$i$i = $child$i$i;
              }
             } else {
              $R$1$i$i = $129;$RP$1$i$i = $arrayidx96$i$i;
             }
             while(1) {
              $arrayidx103$i$i = ((($R$1$i$i)) + 20|0);
              $131 = HEAP32[$arrayidx103$i$i>>2]|0;
              $cmp104$i$i = ($131|0)==(0|0);
              if (!($cmp104$i$i)) {
               $R$1$i$i = $131;$RP$1$i$i = $arrayidx103$i$i;
               continue;
              }
              $arrayidx107$i$i = ((($R$1$i$i)) + 16|0);
              $132 = HEAP32[$arrayidx107$i$i>>2]|0;
              $cmp108$i$i = ($132|0)==(0|0);
              if ($cmp108$i$i) {
               break;
              } else {
               $R$1$i$i = $132;$RP$1$i$i = $arrayidx107$i$i;
              }
             }
             HEAP32[$RP$1$i$i>>2] = 0;
             $R$3$i$i = $R$1$i$i;
            } else {
             $fd78$i$i = ((($add$ptr16$i$i)) + 8|0);
             $128 = HEAP32[$fd78$i$i>>2]|0;
             $bk91$i$i = ((($128)) + 12|0);
             HEAP32[$bk91$i$i>>2] = $127;
             $fd92$i$i = ((($127)) + 8|0);
             HEAP32[$fd92$i$i>>2] = $128;
             $R$3$i$i = $127;
            }
           } while(0);
           $cmp120$i24$i = ($126|0)==(0|0);
           if ($cmp120$i24$i) {
            break;
           }
           $index$i25$i = ((($add$ptr16$i$i)) + 28|0);
           $133 = HEAP32[$index$i25$i>>2]|0;
           $arrayidx123$i$i = (440 + ($133<<2)|0);
           $134 = HEAP32[$arrayidx123$i$i>>2]|0;
           $cmp124$i$i = ($add$ptr16$i$i|0)==($134|0);
           do {
            if ($cmp124$i$i) {
             HEAP32[$arrayidx123$i$i>>2] = $R$3$i$i;
             $cond1$i$i = ($R$3$i$i|0)==(0|0);
             if (!($cond1$i$i)) {
              break;
             }
             $shl131$i$i = 1 << $133;
             $neg132$i$i = $shl131$i$i ^ -1;
             $135 = HEAP32[(140)>>2]|0;
             $and133$i$i = $135 & $neg132$i$i;
             HEAP32[(140)>>2] = $and133$i$i;
             break L237;
            } else {
             $arrayidx143$i$i = ((($126)) + 16|0);
             $136 = HEAP32[$arrayidx143$i$i>>2]|0;
             $not$cmp144$i$i = ($136|0)!=($add$ptr16$i$i|0);
             $$sink$i$i = $not$cmp144$i$i&1;
             $arrayidx151$i$i = (((($126)) + 16|0) + ($$sink$i$i<<2)|0);
             HEAP32[$arrayidx151$i$i>>2] = $R$3$i$i;
             $cmp156$i$i = ($R$3$i$i|0)==(0|0);
             if ($cmp156$i$i) {
              break L237;
             }
            }
           } while(0);
           $parent165$i$i = ((($R$3$i$i)) + 24|0);
           HEAP32[$parent165$i$i>>2] = $126;
           $child166$i$i = ((($add$ptr16$i$i)) + 16|0);
           $137 = HEAP32[$child166$i$i>>2]|0;
           $cmp168$i$i = ($137|0)==(0|0);
           if (!($cmp168$i$i)) {
            $arrayidx178$i$i = ((($R$3$i$i)) + 16|0);
            HEAP32[$arrayidx178$i$i>>2] = $137;
            $parent179$i$i = ((($137)) + 24|0);
            HEAP32[$parent179$i$i>>2] = $R$3$i$i;
           }
           $arrayidx184$i$i = ((($child166$i$i)) + 4|0);
           $138 = HEAP32[$arrayidx184$i$i>>2]|0;
           $cmp185$i$i = ($138|0)==(0|0);
           if ($cmp185$i$i) {
            break;
           }
           $arrayidx195$i$i = ((($R$3$i$i)) + 20|0);
           HEAP32[$arrayidx195$i$i>>2] = $138;
           $parent196$i$i = ((($138)) + 24|0);
           HEAP32[$parent196$i$i>>2] = $R$3$i$i;
          }
         } while(0);
         $add$ptr205$i$i = (($add$ptr16$i$i) + ($and37$i$i)|0);
         $add206$i$i = (($and37$i$i) + ($sub18$i$i))|0;
         $oldfirst$0$i$i = $add$ptr205$i$i;$qsize$0$i$i = $add206$i$i;
        } else {
         $oldfirst$0$i$i = $add$ptr16$i$i;$qsize$0$i$i = $sub18$i$i;
        }
        $head208$i$i = ((($oldfirst$0$i$i)) + 4|0);
        $139 = HEAP32[$head208$i$i>>2]|0;
        $and209$i$i = $139 & -2;
        HEAP32[$head208$i$i>>2] = $and209$i$i;
        $or210$i$i = $qsize$0$i$i | 1;
        $head211$i$i = ((($add$ptr17$i$i)) + 4|0);
        HEAP32[$head211$i$i>>2] = $or210$i$i;
        $add$ptr212$i$i = (($add$ptr17$i$i) + ($qsize$0$i$i)|0);
        HEAP32[$add$ptr212$i$i>>2] = $qsize$0$i$i;
        $shr214$i$i = $qsize$0$i$i >>> 3;
        $cmp215$i$i = ($qsize$0$i$i>>>0)<(256);
        if ($cmp215$i$i) {
         $shl222$i$i = $shr214$i$i << 1;
         $arrayidx223$i$i = (176 + ($shl222$i$i<<2)|0);
         $140 = HEAP32[34]|0;
         $shl226$i$i = 1 << $shr214$i$i;
         $and227$i$i = $140 & $shl226$i$i;
         $tobool228$i$i = ($and227$i$i|0)==(0);
         if ($tobool228$i$i) {
          $or232$i$i = $140 | $shl226$i$i;
          HEAP32[34] = $or232$i$i;
          $$pre$i27$i = ((($arrayidx223$i$i)) + 8|0);
          $$pre$phi$i28$iZ2D = $$pre$i27$i;$F224$0$i$i = $arrayidx223$i$i;
         } else {
          $141 = ((($arrayidx223$i$i)) + 8|0);
          $142 = HEAP32[$141>>2]|0;
          $$pre$phi$i28$iZ2D = $141;$F224$0$i$i = $142;
         }
         HEAP32[$$pre$phi$i28$iZ2D>>2] = $add$ptr17$i$i;
         $bk246$i$i = ((($F224$0$i$i)) + 12|0);
         HEAP32[$bk246$i$i>>2] = $add$ptr17$i$i;
         $fd247$i$i = ((($add$ptr17$i$i)) + 8|0);
         HEAP32[$fd247$i$i>>2] = $F224$0$i$i;
         $bk248$i$i = ((($add$ptr17$i$i)) + 12|0);
         HEAP32[$bk248$i$i>>2] = $arrayidx223$i$i;
         break;
        }
        $shr253$i$i = $qsize$0$i$i >>> 8;
        $cmp254$i$i = ($shr253$i$i|0)==(0);
        do {
         if ($cmp254$i$i) {
          $I252$0$i$i = 0;
         } else {
          $cmp258$i$i = ($qsize$0$i$i>>>0)>(16777215);
          if ($cmp258$i$i) {
           $I252$0$i$i = 31;
           break;
          }
          $sub262$i$i = (($shr253$i$i) + 1048320)|0;
          $shr263$i$i = $sub262$i$i >>> 16;
          $and264$i$i = $shr263$i$i & 8;
          $shl265$i$i = $shr253$i$i << $and264$i$i;
          $sub266$i$i = (($shl265$i$i) + 520192)|0;
          $shr267$i$i = $sub266$i$i >>> 16;
          $and268$i$i = $shr267$i$i & 4;
          $add269$i$i = $and268$i$i | $and264$i$i;
          $shl270$i$i = $shl265$i$i << $and268$i$i;
          $sub271$i$i = (($shl270$i$i) + 245760)|0;
          $shr272$i$i = $sub271$i$i >>> 16;
          $and273$i$i = $shr272$i$i & 2;
          $add274$i$i = $add269$i$i | $and273$i$i;
          $sub275$i$i = (14 - ($add274$i$i))|0;
          $shl276$i$i = $shl270$i$i << $and273$i$i;
          $shr277$i$i = $shl276$i$i >>> 15;
          $add278$i$i = (($sub275$i$i) + ($shr277$i$i))|0;
          $shl279$i$i = $add278$i$i << 1;
          $add280$i$i = (($add278$i$i) + 7)|0;
          $shr281$i$i = $qsize$0$i$i >>> $add280$i$i;
          $and282$i$i = $shr281$i$i & 1;
          $add283$i$i = $and282$i$i | $shl279$i$i;
          $I252$0$i$i = $add283$i$i;
         }
        } while(0);
        $arrayidx287$i$i = (440 + ($I252$0$i$i<<2)|0);
        $index288$i$i = ((($add$ptr17$i$i)) + 28|0);
        HEAP32[$index288$i$i>>2] = $I252$0$i$i;
        $child289$i$i = ((($add$ptr17$i$i)) + 16|0);
        $arrayidx290$i$i = ((($child289$i$i)) + 4|0);
        HEAP32[$arrayidx290$i$i>>2] = 0;
        HEAP32[$child289$i$i>>2] = 0;
        $143 = HEAP32[(140)>>2]|0;
        $shl294$i$i = 1 << $I252$0$i$i;
        $and295$i$i = $143 & $shl294$i$i;
        $tobool296$i$i = ($and295$i$i|0)==(0);
        if ($tobool296$i$i) {
         $or300$i$i = $143 | $shl294$i$i;
         HEAP32[(140)>>2] = $or300$i$i;
         HEAP32[$arrayidx287$i$i>>2] = $add$ptr17$i$i;
         $parent301$i$i = ((($add$ptr17$i$i)) + 24|0);
         HEAP32[$parent301$i$i>>2] = $arrayidx287$i$i;
         $bk302$i$i = ((($add$ptr17$i$i)) + 12|0);
         HEAP32[$bk302$i$i>>2] = $add$ptr17$i$i;
         $fd303$i$i = ((($add$ptr17$i$i)) + 8|0);
         HEAP32[$fd303$i$i>>2] = $add$ptr17$i$i;
         break;
        }
        $144 = HEAP32[$arrayidx287$i$i>>2]|0;
        $cmp306$i$i = ($I252$0$i$i|0)==(31);
        $shr310$i$i = $I252$0$i$i >>> 1;
        $sub313$i$i = (25 - ($shr310$i$i))|0;
        $cond315$i$i = $cmp306$i$i ? 0 : $sub313$i$i;
        $shl316$i$i = $qsize$0$i$i << $cond315$i$i;
        $K305$0$i$i = $shl316$i$i;$T$0$i29$i = $144;
        while(1) {
         $head317$i$i = ((($T$0$i29$i)) + 4|0);
         $145 = HEAP32[$head317$i$i>>2]|0;
         $and318$i$i = $145 & -8;
         $cmp319$i$i = ($and318$i$i|0)==($qsize$0$i$i|0);
         if ($cmp319$i$i) {
          label = 194;
          break;
         }
         $shr323$i$i = $K305$0$i$i >>> 31;
         $arrayidx325$i$i = (((($T$0$i29$i)) + 16|0) + ($shr323$i$i<<2)|0);
         $shl326$i$i = $K305$0$i$i << 1;
         $146 = HEAP32[$arrayidx325$i$i>>2]|0;
         $cmp327$i$i = ($146|0)==(0|0);
         if ($cmp327$i$i) {
          label = 193;
          break;
         } else {
          $K305$0$i$i = $shl326$i$i;$T$0$i29$i = $146;
         }
        }
        if ((label|0) == 193) {
         HEAP32[$arrayidx325$i$i>>2] = $add$ptr17$i$i;
         $parent337$i$i = ((($add$ptr17$i$i)) + 24|0);
         HEAP32[$parent337$i$i>>2] = $T$0$i29$i;
         $bk338$i$i = ((($add$ptr17$i$i)) + 12|0);
         HEAP32[$bk338$i$i>>2] = $add$ptr17$i$i;
         $fd339$i$i = ((($add$ptr17$i$i)) + 8|0);
         HEAP32[$fd339$i$i>>2] = $add$ptr17$i$i;
         break;
        }
        else if ((label|0) == 194) {
         $fd344$i$i = ((($T$0$i29$i)) + 8|0);
         $147 = HEAP32[$fd344$i$i>>2]|0;
         $bk357$i$i = ((($147)) + 12|0);
         HEAP32[$bk357$i$i>>2] = $add$ptr17$i$i;
         HEAP32[$fd344$i$i>>2] = $add$ptr17$i$i;
         $fd359$i$i = ((($add$ptr17$i$i)) + 8|0);
         HEAP32[$fd359$i$i>>2] = $147;
         $bk360$i$i = ((($add$ptr17$i$i)) + 12|0);
         HEAP32[$bk360$i$i>>2] = $T$0$i29$i;
         $parent361$i$i = ((($add$ptr17$i$i)) + 24|0);
         HEAP32[$parent361$i$i>>2] = 0;
         break;
        }
       }
      } while(0);
      $add$ptr369$i$i = ((($add$ptr4$i$i)) + 8|0);
      $retval$0 = $add$ptr369$i$i;
      STACKTOP = sp;return ($retval$0|0);
     }
    }
    $sp$0$i$i$i = (584);
    while(1) {
     $148 = HEAP32[$sp$0$i$i$i>>2]|0;
     $cmp$i$i$i = ($148>>>0)>($94>>>0);
     if (!($cmp$i$i$i)) {
      $size$i$i$i = ((($sp$0$i$i$i)) + 4|0);
      $149 = HEAP32[$size$i$i$i>>2]|0;
      $add$ptr$i$i$i = (($148) + ($149)|0);
      $cmp2$i$i$i = ($add$ptr$i$i$i>>>0)>($94>>>0);
      if ($cmp2$i$i$i) {
       break;
      }
     }
     $next$i$i$i = ((($sp$0$i$i$i)) + 8|0);
     $150 = HEAP32[$next$i$i$i>>2]|0;
     $sp$0$i$i$i = $150;
    }
    $add$ptr2$i$i = ((($add$ptr$i$i$i)) + -47|0);
    $add$ptr3$i$i = ((($add$ptr2$i$i)) + 8|0);
    $151 = $add$ptr3$i$i;
    $and$i$i = $151 & 7;
    $cmp$i9$i = ($and$i$i|0)==(0);
    $152 = (0 - ($151))|0;
    $and6$i10$i = $152 & 7;
    $cond$i$i = $cmp$i9$i ? 0 : $and6$i10$i;
    $add$ptr7$i$i = (($add$ptr2$i$i) + ($cond$i$i)|0);
    $add$ptr81$i$i = ((($94)) + 16|0);
    $cmp9$i$i = ($add$ptr7$i$i>>>0)<($add$ptr81$i$i>>>0);
    $cond13$i$i = $cmp9$i$i ? $94 : $add$ptr7$i$i;
    $add$ptr14$i$i = ((($cond13$i$i)) + 8|0);
    $add$ptr15$i$i = ((($cond13$i$i)) + 24|0);
    $sub16$i$i = (($tsize$791$i) + -40)|0;
    $add$ptr$i2$i$i = ((($tbase$792$i)) + 8|0);
    $153 = $add$ptr$i2$i$i;
    $and$i$i$i = $153 & 7;
    $cmp$i3$i$i = ($and$i$i$i|0)==(0);
    $154 = (0 - ($153))|0;
    $and3$i$i$i = $154 & 7;
    $cond$i$i$i = $cmp$i3$i$i ? 0 : $and3$i$i$i;
    $add$ptr4$i$i$i = (($tbase$792$i) + ($cond$i$i$i)|0);
    $sub5$i$i$i = (($sub16$i$i) - ($cond$i$i$i))|0;
    HEAP32[(160)>>2] = $add$ptr4$i$i$i;
    HEAP32[(148)>>2] = $sub5$i$i$i;
    $or$i$i$i = $sub5$i$i$i | 1;
    $head$i$i$i = ((($add$ptr4$i$i$i)) + 4|0);
    HEAP32[$head$i$i$i>>2] = $or$i$i$i;
    $add$ptr6$i$i$i = (($add$ptr4$i$i$i) + ($sub5$i$i$i)|0);
    $head7$i$i$i = ((($add$ptr6$i$i$i)) + 4|0);
    HEAP32[$head7$i$i$i>>2] = 40;
    $155 = HEAP32[(624)>>2]|0;
    HEAP32[(164)>>2] = $155;
    $head$i$i = ((($cond13$i$i)) + 4|0);
    HEAP32[$head$i$i>>2] = 27;
    ;HEAP32[$add$ptr14$i$i>>2]=HEAP32[(584)>>2]|0;HEAP32[$add$ptr14$i$i+4>>2]=HEAP32[(584)+4>>2]|0;HEAP32[$add$ptr14$i$i+8>>2]=HEAP32[(584)+8>>2]|0;HEAP32[$add$ptr14$i$i+12>>2]=HEAP32[(584)+12>>2]|0;
    HEAP32[(584)>>2] = $tbase$792$i;
    HEAP32[(588)>>2] = $tsize$791$i;
    HEAP32[(596)>>2] = 0;
    HEAP32[(592)>>2] = $add$ptr14$i$i;
    $156 = $add$ptr15$i$i;
    while(1) {
     $add$ptr24$i$i = ((($156)) + 4|0);
     HEAP32[$add$ptr24$i$i>>2] = 7;
     $head26$i$i = ((($156)) + 8|0);
     $cmp27$i$i = ($head26$i$i>>>0)<($add$ptr$i$i$i>>>0);
     if ($cmp27$i$i) {
      $156 = $add$ptr24$i$i;
     } else {
      break;
     }
    }
    $cmp28$i$i = ($cond13$i$i|0)==($94|0);
    if (!($cmp28$i$i)) {
     $sub$ptr$lhs$cast$i$i = $cond13$i$i;
     $sub$ptr$rhs$cast$i$i = $94;
     $sub$ptr$sub$i$i = (($sub$ptr$lhs$cast$i$i) - ($sub$ptr$rhs$cast$i$i))|0;
     $157 = HEAP32[$head$i$i>>2]|0;
     $and32$i$i = $157 & -2;
     HEAP32[$head$i$i>>2] = $and32$i$i;
     $or33$i$i = $sub$ptr$sub$i$i | 1;
     $head34$i$i = ((($94)) + 4|0);
     HEAP32[$head34$i$i>>2] = $or33$i$i;
     HEAP32[$cond13$i$i>>2] = $sub$ptr$sub$i$i;
     $shr$i$i = $sub$ptr$sub$i$i >>> 3;
     $cmp36$i$i = ($sub$ptr$sub$i$i>>>0)<(256);
     if ($cmp36$i$i) {
      $shl$i$i = $shr$i$i << 1;
      $arrayidx$i$i = (176 + ($shl$i$i<<2)|0);
      $158 = HEAP32[34]|0;
      $shl39$i$i = 1 << $shr$i$i;
      $and40$i$i = $158 & $shl39$i$i;
      $tobool$i$i = ($and40$i$i|0)==(0);
      if ($tobool$i$i) {
       $or44$i$i = $158 | $shl39$i$i;
       HEAP32[34] = $or44$i$i;
       $$pre$i$i = ((($arrayidx$i$i)) + 8|0);
       $$pre$phi$i$iZ2D = $$pre$i$i;$F$0$i$i = $arrayidx$i$i;
      } else {
       $159 = ((($arrayidx$i$i)) + 8|0);
       $160 = HEAP32[$159>>2]|0;
       $$pre$phi$i$iZ2D = $159;$F$0$i$i = $160;
      }
      HEAP32[$$pre$phi$i$iZ2D>>2] = $94;
      $bk$i$i = ((($F$0$i$i)) + 12|0);
      HEAP32[$bk$i$i>>2] = $94;
      $fd54$i$i = ((($94)) + 8|0);
      HEAP32[$fd54$i$i>>2] = $F$0$i$i;
      $bk55$i$i = ((($94)) + 12|0);
      HEAP32[$bk55$i$i>>2] = $arrayidx$i$i;
      break;
     }
     $shr58$i$i = $sub$ptr$sub$i$i >>> 8;
     $cmp59$i$i = ($shr58$i$i|0)==(0);
     if ($cmp59$i$i) {
      $I57$0$i$i = 0;
     } else {
      $cmp63$i$i = ($sub$ptr$sub$i$i>>>0)>(16777215);
      if ($cmp63$i$i) {
       $I57$0$i$i = 31;
      } else {
       $sub67$i$i = (($shr58$i$i) + 1048320)|0;
       $shr68$i$i = $sub67$i$i >>> 16;
       $and69$i$i = $shr68$i$i & 8;
       $shl70$i$i = $shr58$i$i << $and69$i$i;
       $sub71$i$i = (($shl70$i$i) + 520192)|0;
       $shr72$i$i = $sub71$i$i >>> 16;
       $and73$i$i = $shr72$i$i & 4;
       $add74$i$i = $and73$i$i | $and69$i$i;
       $shl75$i$i = $shl70$i$i << $and73$i$i;
       $sub76$i$i = (($shl75$i$i) + 245760)|0;
       $shr77$i$i = $sub76$i$i >>> 16;
       $and78$i$i = $shr77$i$i & 2;
       $add79$i$i = $add74$i$i | $and78$i$i;
       $sub80$i$i = (14 - ($add79$i$i))|0;
       $shl81$i$i = $shl75$i$i << $and78$i$i;
       $shr82$i$i = $shl81$i$i >>> 15;
       $add83$i$i = (($sub80$i$i) + ($shr82$i$i))|0;
       $shl84$i$i = $add83$i$i << 1;
       $add85$i$i = (($add83$i$i) + 7)|0;
       $shr86$i$i = $sub$ptr$sub$i$i >>> $add85$i$i;
       $and87$i$i = $shr86$i$i & 1;
       $add88$i$i = $and87$i$i | $shl84$i$i;
       $I57$0$i$i = $add88$i$i;
      }
     }
     $arrayidx91$i$i = (440 + ($I57$0$i$i<<2)|0);
     $index$i$i = ((($94)) + 28|0);
     HEAP32[$index$i$i>>2] = $I57$0$i$i;
     $arrayidx92$i$i = ((($94)) + 20|0);
     HEAP32[$arrayidx92$i$i>>2] = 0;
     HEAP32[$add$ptr81$i$i>>2] = 0;
     $161 = HEAP32[(140)>>2]|0;
     $shl95$i$i = 1 << $I57$0$i$i;
     $and96$i$i = $161 & $shl95$i$i;
     $tobool97$i$i = ($and96$i$i|0)==(0);
     if ($tobool97$i$i) {
      $or101$i$i = $161 | $shl95$i$i;
      HEAP32[(140)>>2] = $or101$i$i;
      HEAP32[$arrayidx91$i$i>>2] = $94;
      $parent$i$i = ((($94)) + 24|0);
      HEAP32[$parent$i$i>>2] = $arrayidx91$i$i;
      $bk102$i$i = ((($94)) + 12|0);
      HEAP32[$bk102$i$i>>2] = $94;
      $fd103$i$i = ((($94)) + 8|0);
      HEAP32[$fd103$i$i>>2] = $94;
      break;
     }
     $162 = HEAP32[$arrayidx91$i$i>>2]|0;
     $cmp106$i$i = ($I57$0$i$i|0)==(31);
     $shr110$i$i = $I57$0$i$i >>> 1;
     $sub113$i$i = (25 - ($shr110$i$i))|0;
     $cond115$i$i = $cmp106$i$i ? 0 : $sub113$i$i;
     $shl116$i$i = $sub$ptr$sub$i$i << $cond115$i$i;
     $K105$0$i$i = $shl116$i$i;$T$0$i$i = $162;
     while(1) {
      $head118$i$i = ((($T$0$i$i)) + 4|0);
      $163 = HEAP32[$head118$i$i>>2]|0;
      $and119$i$i = $163 & -8;
      $cmp120$i$i = ($and119$i$i|0)==($sub$ptr$sub$i$i|0);
      if ($cmp120$i$i) {
       label = 216;
       break;
      }
      $shr124$i$i = $K105$0$i$i >>> 31;
      $arrayidx126$i$i = (((($T$0$i$i)) + 16|0) + ($shr124$i$i<<2)|0);
      $shl127$i$i = $K105$0$i$i << 1;
      $164 = HEAP32[$arrayidx126$i$i>>2]|0;
      $cmp128$i$i = ($164|0)==(0|0);
      if ($cmp128$i$i) {
       label = 215;
       break;
      } else {
       $K105$0$i$i = $shl127$i$i;$T$0$i$i = $164;
      }
     }
     if ((label|0) == 215) {
      HEAP32[$arrayidx126$i$i>>2] = $94;
      $parent138$i$i = ((($94)) + 24|0);
      HEAP32[$parent138$i$i>>2] = $T$0$i$i;
      $bk139$i$i = ((($94)) + 12|0);
      HEAP32[$bk139$i$i>>2] = $94;
      $fd140$i$i = ((($94)) + 8|0);
      HEAP32[$fd140$i$i>>2] = $94;
      break;
     }
     else if ((label|0) == 216) {
      $fd148$i$i = ((($T$0$i$i)) + 8|0);
      $165 = HEAP32[$fd148$i$i>>2]|0;
      $bk158$i$i = ((($165)) + 12|0);
      HEAP32[$bk158$i$i>>2] = $94;
      HEAP32[$fd148$i$i>>2] = $94;
      $fd160$i$i = ((($94)) + 8|0);
      HEAP32[$fd160$i$i>>2] = $165;
      $bk161$i$i = ((($94)) + 12|0);
      HEAP32[$bk161$i$i>>2] = $T$0$i$i;
      $parent162$i$i = ((($94)) + 24|0);
      HEAP32[$parent162$i$i>>2] = 0;
      break;
     }
    }
   }
  } while(0);
  $166 = HEAP32[(148)>>2]|0;
  $cmp257$i = ($166>>>0)>($nb$0>>>0);
  if ($cmp257$i) {
   $sub260$i = (($166) - ($nb$0))|0;
   HEAP32[(148)>>2] = $sub260$i;
   $167 = HEAP32[(160)>>2]|0;
   $add$ptr262$i = (($167) + ($nb$0)|0);
   HEAP32[(160)>>2] = $add$ptr262$i;
   $or264$i = $sub260$i | 1;
   $head265$i = ((($add$ptr262$i)) + 4|0);
   HEAP32[$head265$i>>2] = $or264$i;
   $or267$i = $nb$0 | 3;
   $head268$i = ((($167)) + 4|0);
   HEAP32[$head268$i>>2] = $or267$i;
   $add$ptr269$i = ((($167)) + 8|0);
   $retval$0 = $add$ptr269$i;
   STACKTOP = sp;return ($retval$0|0);
  }
 }
 $call275$i = (___errno_location()|0);
 HEAP32[$call275$i>>2] = 12;
 $retval$0 = 0;
 STACKTOP = sp;return ($retval$0|0);
}
function _free($mem) {
 $mem = $mem|0;
 var $$pre = 0, $$pre$phiZ2D = 0, $$sink = 0, $$sink4 = 0, $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0;
 var $23 = 0, $24 = 0, $25 = 0, $26 = 0, $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0;
 var $41 = 0, $42 = 0, $43 = 0, $44 = 0, $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0, $50 = 0, $51 = 0, $52 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $F510$0 = 0, $I534$0 = 0, $K583$0 = 0;
 var $R$1 = 0, $R$3 = 0, $R332$1 = 0, $R332$3 = 0, $RP$1 = 0, $RP360$1 = 0, $T$0 = 0, $add$ptr = 0, $add$ptr16 = 0, $add$ptr217 = 0, $add$ptr261 = 0, $add$ptr482 = 0, $add$ptr498 = 0, $add$ptr6 = 0, $add17 = 0, $add246 = 0, $add258 = 0, $add267 = 0, $add550 = 0, $add555 = 0;
 var $add559 = 0, $add561 = 0, $add564 = 0, $and12 = 0, $and140 = 0, $and210 = 0, $and215 = 0, $and232 = 0, $and240 = 0, $and266 = 0, $and301 = 0, $and410 = 0, $and46 = 0, $and495 = 0, $and5 = 0, $and512 = 0, $and545 = 0, $and549 = 0, $and554 = 0, $and563 = 0;
 var $and574 = 0, $and592 = 0, $and8 = 0, $arrayidx108 = 0, $arrayidx113 = 0, $arrayidx130 = 0, $arrayidx149 = 0, $arrayidx157 = 0, $arrayidx182 = 0, $arrayidx188 = 0, $arrayidx198 = 0, $arrayidx362 = 0, $arrayidx374 = 0, $arrayidx379 = 0, $arrayidx400 = 0, $arrayidx419 = 0, $arrayidx427 = 0, $arrayidx454 = 0, $arrayidx460 = 0, $arrayidx470 = 0;
 var $arrayidx509 = 0, $arrayidx567 = 0, $arrayidx570 = 0, $arrayidx599 = 0, $arrayidx99 = 0, $bk = 0, $bk275 = 0, $bk321 = 0, $bk333 = 0, $bk355 = 0, $bk529 = 0, $bk531 = 0, $bk580 = 0, $bk611 = 0, $bk631 = 0, $bk634 = 0, $bk66 = 0, $bk73 = 0, $bk94 = 0, $child = 0;
 var $child171 = 0, $child361 = 0, $child443 = 0, $child569 = 0, $cmp = 0, $cmp$i = 0, $cmp100 = 0, $cmp104 = 0, $cmp109 = 0, $cmp114 = 0, $cmp127 = 0, $cmp13 = 0, $cmp131 = 0, $cmp162 = 0, $cmp173 = 0, $cmp18 = 0, $cmp189 = 0, $cmp211 = 0, $cmp22 = 0, $cmp228 = 0;
 var $cmp243 = 0, $cmp249 = 0, $cmp25 = 0, $cmp255 = 0, $cmp269 = 0, $cmp296 = 0, $cmp334 = 0, $cmp363 = 0, $cmp368 = 0, $cmp375 = 0, $cmp380 = 0, $cmp395 = 0, $cmp401 = 0, $cmp42 = 0, $cmp432 = 0, $cmp445 = 0, $cmp461 = 0, $cmp484 = 0, $cmp502 = 0, $cmp536 = 0;
 var $cmp540 = 0, $cmp584 = 0, $cmp593 = 0, $cmp601 = 0, $cmp640 = 0, $cmp74 = 0, $cond = 0, $cond255 = 0, $cond256 = 0, $dec = 0, $fd = 0, $fd273 = 0, $fd322 = 0, $fd338 = 0, $fd356 = 0, $fd530 = 0, $fd581 = 0, $fd612 = 0, $fd620 = 0, $fd633 = 0;
 var $fd67 = 0, $fd78 = 0, $fd95 = 0, $head209 = 0, $head216 = 0, $head231 = 0, $head248 = 0, $head260 = 0, $head4 = 0, $head481 = 0, $head497 = 0, $head591 = 0, $idx$neg = 0, $index = 0, $index399 = 0, $index568 = 0, $neg = 0, $neg139 = 0, $neg300 = 0, $neg409 = 0;
 var $next4$i = 0, $not$cmp150 = 0, $not$cmp420 = 0, $or = 0, $or247 = 0, $or259 = 0, $or480 = 0, $or496 = 0, $or516 = 0, $or578 = 0, $p$1 = 0, $parent = 0, $parent170 = 0, $parent183 = 0, $parent199 = 0, $parent331 = 0, $parent442 = 0, $parent455 = 0, $parent471 = 0, $parent579 = 0;
 var $parent610 = 0, $parent635 = 0, $psize$1 = 0, $psize$2 = 0, $shl138 = 0, $shl299 = 0, $shl408 = 0, $shl45 = 0, $shl508 = 0, $shl511 = 0, $shl546 = 0, $shl551 = 0, $shl557 = 0, $shl560 = 0, $shl573 = 0, $shl590 = 0, $shl600 = 0, $shr = 0, $shr268 = 0, $shr501 = 0;
 var $shr535 = 0, $shr544 = 0, $shr548 = 0, $shr553 = 0, $shr558 = 0, $shr562 = 0, $shr586 = 0, $shr597 = 0, $sp$0$i = 0, $sp$0$in$i = 0, $sub = 0, $sub547 = 0, $sub552 = 0, $sub556 = 0, $sub589 = 0, $tobool233 = 0, $tobool241 = 0, $tobool513 = 0, $tobool575 = 0, $tobool9 = 0;
 var label = 0, sp = 0;
 sp = STACKTOP;
 $cmp = ($mem|0)==(0|0);
 if ($cmp) {
  return;
 }
 $add$ptr = ((($mem)) + -8|0);
 $0 = HEAP32[(152)>>2]|0;
 $head4 = ((($mem)) + -4|0);
 $1 = HEAP32[$head4>>2]|0;
 $and5 = $1 & -8;
 $add$ptr6 = (($add$ptr) + ($and5)|0);
 $and8 = $1 & 1;
 $tobool9 = ($and8|0)==(0);
 do {
  if ($tobool9) {
   $2 = HEAP32[$add$ptr>>2]|0;
   $and12 = $1 & 3;
   $cmp13 = ($and12|0)==(0);
   if ($cmp13) {
    return;
   }
   $idx$neg = (0 - ($2))|0;
   $add$ptr16 = (($add$ptr) + ($idx$neg)|0);
   $add17 = (($2) + ($and5))|0;
   $cmp18 = ($add$ptr16>>>0)<($0>>>0);
   if ($cmp18) {
    return;
   }
   $3 = HEAP32[(156)>>2]|0;
   $cmp22 = ($add$ptr16|0)==($3|0);
   if ($cmp22) {
    $head209 = ((($add$ptr6)) + 4|0);
    $20 = HEAP32[$head209>>2]|0;
    $and210 = $20 & 3;
    $cmp211 = ($and210|0)==(3);
    if (!($cmp211)) {
     $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
     break;
    }
    $add$ptr217 = (($add$ptr16) + ($add17)|0);
    $head216 = ((($add$ptr16)) + 4|0);
    $or = $add17 | 1;
    $and215 = $20 & -2;
    HEAP32[(144)>>2] = $add17;
    HEAP32[$head209>>2] = $and215;
    HEAP32[$head216>>2] = $or;
    HEAP32[$add$ptr217>>2] = $add17;
    return;
   }
   $shr = $2 >>> 3;
   $cmp25 = ($2>>>0)<(256);
   if ($cmp25) {
    $fd = ((($add$ptr16)) + 8|0);
    $4 = HEAP32[$fd>>2]|0;
    $bk = ((($add$ptr16)) + 12|0);
    $5 = HEAP32[$bk>>2]|0;
    $cmp42 = ($5|0)==($4|0);
    if ($cmp42) {
     $shl45 = 1 << $shr;
     $neg = $shl45 ^ -1;
     $6 = HEAP32[34]|0;
     $and46 = $6 & $neg;
     HEAP32[34] = $and46;
     $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
     break;
    } else {
     $bk66 = ((($4)) + 12|0);
     HEAP32[$bk66>>2] = $5;
     $fd67 = ((($5)) + 8|0);
     HEAP32[$fd67>>2] = $4;
     $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
     break;
    }
   }
   $parent = ((($add$ptr16)) + 24|0);
   $7 = HEAP32[$parent>>2]|0;
   $bk73 = ((($add$ptr16)) + 12|0);
   $8 = HEAP32[$bk73>>2]|0;
   $cmp74 = ($8|0)==($add$ptr16|0);
   do {
    if ($cmp74) {
     $child = ((($add$ptr16)) + 16|0);
     $arrayidx99 = ((($child)) + 4|0);
     $10 = HEAP32[$arrayidx99>>2]|0;
     $cmp100 = ($10|0)==(0|0);
     if ($cmp100) {
      $11 = HEAP32[$child>>2]|0;
      $cmp104 = ($11|0)==(0|0);
      if ($cmp104) {
       $R$3 = 0;
       break;
      } else {
       $R$1 = $11;$RP$1 = $child;
      }
     } else {
      $R$1 = $10;$RP$1 = $arrayidx99;
     }
     while(1) {
      $arrayidx108 = ((($R$1)) + 20|0);
      $12 = HEAP32[$arrayidx108>>2]|0;
      $cmp109 = ($12|0)==(0|0);
      if (!($cmp109)) {
       $R$1 = $12;$RP$1 = $arrayidx108;
       continue;
      }
      $arrayidx113 = ((($R$1)) + 16|0);
      $13 = HEAP32[$arrayidx113>>2]|0;
      $cmp114 = ($13|0)==(0|0);
      if ($cmp114) {
       break;
      } else {
       $R$1 = $13;$RP$1 = $arrayidx113;
      }
     }
     HEAP32[$RP$1>>2] = 0;
     $R$3 = $R$1;
    } else {
     $fd78 = ((($add$ptr16)) + 8|0);
     $9 = HEAP32[$fd78>>2]|0;
     $bk94 = ((($9)) + 12|0);
     HEAP32[$bk94>>2] = $8;
     $fd95 = ((($8)) + 8|0);
     HEAP32[$fd95>>2] = $9;
     $R$3 = $8;
    }
   } while(0);
   $cmp127 = ($7|0)==(0|0);
   if ($cmp127) {
    $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
   } else {
    $index = ((($add$ptr16)) + 28|0);
    $14 = HEAP32[$index>>2]|0;
    $arrayidx130 = (440 + ($14<<2)|0);
    $15 = HEAP32[$arrayidx130>>2]|0;
    $cmp131 = ($add$ptr16|0)==($15|0);
    if ($cmp131) {
     HEAP32[$arrayidx130>>2] = $R$3;
     $cond255 = ($R$3|0)==(0|0);
     if ($cond255) {
      $shl138 = 1 << $14;
      $neg139 = $shl138 ^ -1;
      $16 = HEAP32[(140)>>2]|0;
      $and140 = $16 & $neg139;
      HEAP32[(140)>>2] = $and140;
      $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
      break;
     }
    } else {
     $arrayidx149 = ((($7)) + 16|0);
     $17 = HEAP32[$arrayidx149>>2]|0;
     $not$cmp150 = ($17|0)!=($add$ptr16|0);
     $$sink = $not$cmp150&1;
     $arrayidx157 = (((($7)) + 16|0) + ($$sink<<2)|0);
     HEAP32[$arrayidx157>>2] = $R$3;
     $cmp162 = ($R$3|0)==(0|0);
     if ($cmp162) {
      $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
      break;
     }
    }
    $parent170 = ((($R$3)) + 24|0);
    HEAP32[$parent170>>2] = $7;
    $child171 = ((($add$ptr16)) + 16|0);
    $18 = HEAP32[$child171>>2]|0;
    $cmp173 = ($18|0)==(0|0);
    if (!($cmp173)) {
     $arrayidx182 = ((($R$3)) + 16|0);
     HEAP32[$arrayidx182>>2] = $18;
     $parent183 = ((($18)) + 24|0);
     HEAP32[$parent183>>2] = $R$3;
    }
    $arrayidx188 = ((($child171)) + 4|0);
    $19 = HEAP32[$arrayidx188>>2]|0;
    $cmp189 = ($19|0)==(0|0);
    if ($cmp189) {
     $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
    } else {
     $arrayidx198 = ((($R$3)) + 20|0);
     HEAP32[$arrayidx198>>2] = $19;
     $parent199 = ((($19)) + 24|0);
     HEAP32[$parent199>>2] = $R$3;
     $21 = $add$ptr16;$p$1 = $add$ptr16;$psize$1 = $add17;
    }
   }
  } else {
   $21 = $add$ptr;$p$1 = $add$ptr;$psize$1 = $and5;
  }
 } while(0);
 $cmp228 = ($21>>>0)<($add$ptr6>>>0);
 if (!($cmp228)) {
  return;
 }
 $head231 = ((($add$ptr6)) + 4|0);
 $22 = HEAP32[$head231>>2]|0;
 $and232 = $22 & 1;
 $tobool233 = ($and232|0)==(0);
 if ($tobool233) {
  return;
 }
 $and240 = $22 & 2;
 $tobool241 = ($and240|0)==(0);
 if ($tobool241) {
  $23 = HEAP32[(160)>>2]|0;
  $cmp243 = ($add$ptr6|0)==($23|0);
  $24 = HEAP32[(156)>>2]|0;
  if ($cmp243) {
   $25 = HEAP32[(148)>>2]|0;
   $add246 = (($25) + ($psize$1))|0;
   HEAP32[(148)>>2] = $add246;
   HEAP32[(160)>>2] = $p$1;
   $or247 = $add246 | 1;
   $head248 = ((($p$1)) + 4|0);
   HEAP32[$head248>>2] = $or247;
   $cmp249 = ($p$1|0)==($24|0);
   if (!($cmp249)) {
    return;
   }
   HEAP32[(156)>>2] = 0;
   HEAP32[(144)>>2] = 0;
   return;
  }
  $cmp255 = ($add$ptr6|0)==($24|0);
  if ($cmp255) {
   $26 = HEAP32[(144)>>2]|0;
   $add258 = (($26) + ($psize$1))|0;
   HEAP32[(144)>>2] = $add258;
   HEAP32[(156)>>2] = $21;
   $or259 = $add258 | 1;
   $head260 = ((($p$1)) + 4|0);
   HEAP32[$head260>>2] = $or259;
   $add$ptr261 = (($21) + ($add258)|0);
   HEAP32[$add$ptr261>>2] = $add258;
   return;
  }
  $and266 = $22 & -8;
  $add267 = (($and266) + ($psize$1))|0;
  $shr268 = $22 >>> 3;
  $cmp269 = ($22>>>0)<(256);
  do {
   if ($cmp269) {
    $fd273 = ((($add$ptr6)) + 8|0);
    $27 = HEAP32[$fd273>>2]|0;
    $bk275 = ((($add$ptr6)) + 12|0);
    $28 = HEAP32[$bk275>>2]|0;
    $cmp296 = ($28|0)==($27|0);
    if ($cmp296) {
     $shl299 = 1 << $shr268;
     $neg300 = $shl299 ^ -1;
     $29 = HEAP32[34]|0;
     $and301 = $29 & $neg300;
     HEAP32[34] = $and301;
     break;
    } else {
     $bk321 = ((($27)) + 12|0);
     HEAP32[$bk321>>2] = $28;
     $fd322 = ((($28)) + 8|0);
     HEAP32[$fd322>>2] = $27;
     break;
    }
   } else {
    $parent331 = ((($add$ptr6)) + 24|0);
    $30 = HEAP32[$parent331>>2]|0;
    $bk333 = ((($add$ptr6)) + 12|0);
    $31 = HEAP32[$bk333>>2]|0;
    $cmp334 = ($31|0)==($add$ptr6|0);
    do {
     if ($cmp334) {
      $child361 = ((($add$ptr6)) + 16|0);
      $arrayidx362 = ((($child361)) + 4|0);
      $33 = HEAP32[$arrayidx362>>2]|0;
      $cmp363 = ($33|0)==(0|0);
      if ($cmp363) {
       $34 = HEAP32[$child361>>2]|0;
       $cmp368 = ($34|0)==(0|0);
       if ($cmp368) {
        $R332$3 = 0;
        break;
       } else {
        $R332$1 = $34;$RP360$1 = $child361;
       }
      } else {
       $R332$1 = $33;$RP360$1 = $arrayidx362;
      }
      while(1) {
       $arrayidx374 = ((($R332$1)) + 20|0);
       $35 = HEAP32[$arrayidx374>>2]|0;
       $cmp375 = ($35|0)==(0|0);
       if (!($cmp375)) {
        $R332$1 = $35;$RP360$1 = $arrayidx374;
        continue;
       }
       $arrayidx379 = ((($R332$1)) + 16|0);
       $36 = HEAP32[$arrayidx379>>2]|0;
       $cmp380 = ($36|0)==(0|0);
       if ($cmp380) {
        break;
       } else {
        $R332$1 = $36;$RP360$1 = $arrayidx379;
       }
      }
      HEAP32[$RP360$1>>2] = 0;
      $R332$3 = $R332$1;
     } else {
      $fd338 = ((($add$ptr6)) + 8|0);
      $32 = HEAP32[$fd338>>2]|0;
      $bk355 = ((($32)) + 12|0);
      HEAP32[$bk355>>2] = $31;
      $fd356 = ((($31)) + 8|0);
      HEAP32[$fd356>>2] = $32;
      $R332$3 = $31;
     }
    } while(0);
    $cmp395 = ($30|0)==(0|0);
    if (!($cmp395)) {
     $index399 = ((($add$ptr6)) + 28|0);
     $37 = HEAP32[$index399>>2]|0;
     $arrayidx400 = (440 + ($37<<2)|0);
     $38 = HEAP32[$arrayidx400>>2]|0;
     $cmp401 = ($add$ptr6|0)==($38|0);
     if ($cmp401) {
      HEAP32[$arrayidx400>>2] = $R332$3;
      $cond256 = ($R332$3|0)==(0|0);
      if ($cond256) {
       $shl408 = 1 << $37;
       $neg409 = $shl408 ^ -1;
       $39 = HEAP32[(140)>>2]|0;
       $and410 = $39 & $neg409;
       HEAP32[(140)>>2] = $and410;
       break;
      }
     } else {
      $arrayidx419 = ((($30)) + 16|0);
      $40 = HEAP32[$arrayidx419>>2]|0;
      $not$cmp420 = ($40|0)!=($add$ptr6|0);
      $$sink4 = $not$cmp420&1;
      $arrayidx427 = (((($30)) + 16|0) + ($$sink4<<2)|0);
      HEAP32[$arrayidx427>>2] = $R332$3;
      $cmp432 = ($R332$3|0)==(0|0);
      if ($cmp432) {
       break;
      }
     }
     $parent442 = ((($R332$3)) + 24|0);
     HEAP32[$parent442>>2] = $30;
     $child443 = ((($add$ptr6)) + 16|0);
     $41 = HEAP32[$child443>>2]|0;
     $cmp445 = ($41|0)==(0|0);
     if (!($cmp445)) {
      $arrayidx454 = ((($R332$3)) + 16|0);
      HEAP32[$arrayidx454>>2] = $41;
      $parent455 = ((($41)) + 24|0);
      HEAP32[$parent455>>2] = $R332$3;
     }
     $arrayidx460 = ((($child443)) + 4|0);
     $42 = HEAP32[$arrayidx460>>2]|0;
     $cmp461 = ($42|0)==(0|0);
     if (!($cmp461)) {
      $arrayidx470 = ((($R332$3)) + 20|0);
      HEAP32[$arrayidx470>>2] = $42;
      $parent471 = ((($42)) + 24|0);
      HEAP32[$parent471>>2] = $R332$3;
     }
    }
   }
  } while(0);
  $or480 = $add267 | 1;
  $head481 = ((($p$1)) + 4|0);
  HEAP32[$head481>>2] = $or480;
  $add$ptr482 = (($21) + ($add267)|0);
  HEAP32[$add$ptr482>>2] = $add267;
  $43 = HEAP32[(156)>>2]|0;
  $cmp484 = ($p$1|0)==($43|0);
  if ($cmp484) {
   HEAP32[(144)>>2] = $add267;
   return;
  } else {
   $psize$2 = $add267;
  }
 } else {
  $and495 = $22 & -2;
  HEAP32[$head231>>2] = $and495;
  $or496 = $psize$1 | 1;
  $head497 = ((($p$1)) + 4|0);
  HEAP32[$head497>>2] = $or496;
  $add$ptr498 = (($21) + ($psize$1)|0);
  HEAP32[$add$ptr498>>2] = $psize$1;
  $psize$2 = $psize$1;
 }
 $shr501 = $psize$2 >>> 3;
 $cmp502 = ($psize$2>>>0)<(256);
 if ($cmp502) {
  $shl508 = $shr501 << 1;
  $arrayidx509 = (176 + ($shl508<<2)|0);
  $44 = HEAP32[34]|0;
  $shl511 = 1 << $shr501;
  $and512 = $44 & $shl511;
  $tobool513 = ($and512|0)==(0);
  if ($tobool513) {
   $or516 = $44 | $shl511;
   HEAP32[34] = $or516;
   $$pre = ((($arrayidx509)) + 8|0);
   $$pre$phiZ2D = $$pre;$F510$0 = $arrayidx509;
  } else {
   $45 = ((($arrayidx509)) + 8|0);
   $46 = HEAP32[$45>>2]|0;
   $$pre$phiZ2D = $45;$F510$0 = $46;
  }
  HEAP32[$$pre$phiZ2D>>2] = $p$1;
  $bk529 = ((($F510$0)) + 12|0);
  HEAP32[$bk529>>2] = $p$1;
  $fd530 = ((($p$1)) + 8|0);
  HEAP32[$fd530>>2] = $F510$0;
  $bk531 = ((($p$1)) + 12|0);
  HEAP32[$bk531>>2] = $arrayidx509;
  return;
 }
 $shr535 = $psize$2 >>> 8;
 $cmp536 = ($shr535|0)==(0);
 if ($cmp536) {
  $I534$0 = 0;
 } else {
  $cmp540 = ($psize$2>>>0)>(16777215);
  if ($cmp540) {
   $I534$0 = 31;
  } else {
   $sub = (($shr535) + 1048320)|0;
   $shr544 = $sub >>> 16;
   $and545 = $shr544 & 8;
   $shl546 = $shr535 << $and545;
   $sub547 = (($shl546) + 520192)|0;
   $shr548 = $sub547 >>> 16;
   $and549 = $shr548 & 4;
   $add550 = $and549 | $and545;
   $shl551 = $shl546 << $and549;
   $sub552 = (($shl551) + 245760)|0;
   $shr553 = $sub552 >>> 16;
   $and554 = $shr553 & 2;
   $add555 = $add550 | $and554;
   $sub556 = (14 - ($add555))|0;
   $shl557 = $shl551 << $and554;
   $shr558 = $shl557 >>> 15;
   $add559 = (($sub556) + ($shr558))|0;
   $shl560 = $add559 << 1;
   $add561 = (($add559) + 7)|0;
   $shr562 = $psize$2 >>> $add561;
   $and563 = $shr562 & 1;
   $add564 = $and563 | $shl560;
   $I534$0 = $add564;
  }
 }
 $arrayidx567 = (440 + ($I534$0<<2)|0);
 $index568 = ((($p$1)) + 28|0);
 HEAP32[$index568>>2] = $I534$0;
 $child569 = ((($p$1)) + 16|0);
 $arrayidx570 = ((($p$1)) + 20|0);
 HEAP32[$arrayidx570>>2] = 0;
 HEAP32[$child569>>2] = 0;
 $47 = HEAP32[(140)>>2]|0;
 $shl573 = 1 << $I534$0;
 $and574 = $47 & $shl573;
 $tobool575 = ($and574|0)==(0);
 do {
  if ($tobool575) {
   $or578 = $47 | $shl573;
   HEAP32[(140)>>2] = $or578;
   HEAP32[$arrayidx567>>2] = $p$1;
   $parent579 = ((($p$1)) + 24|0);
   HEAP32[$parent579>>2] = $arrayidx567;
   $bk580 = ((($p$1)) + 12|0);
   HEAP32[$bk580>>2] = $p$1;
   $fd581 = ((($p$1)) + 8|0);
   HEAP32[$fd581>>2] = $p$1;
  } else {
   $48 = HEAP32[$arrayidx567>>2]|0;
   $cmp584 = ($I534$0|0)==(31);
   $shr586 = $I534$0 >>> 1;
   $sub589 = (25 - ($shr586))|0;
   $cond = $cmp584 ? 0 : $sub589;
   $shl590 = $psize$2 << $cond;
   $K583$0 = $shl590;$T$0 = $48;
   while(1) {
    $head591 = ((($T$0)) + 4|0);
    $49 = HEAP32[$head591>>2]|0;
    $and592 = $49 & -8;
    $cmp593 = ($and592|0)==($psize$2|0);
    if ($cmp593) {
     label = 73;
     break;
    }
    $shr597 = $K583$0 >>> 31;
    $arrayidx599 = (((($T$0)) + 16|0) + ($shr597<<2)|0);
    $shl600 = $K583$0 << 1;
    $50 = HEAP32[$arrayidx599>>2]|0;
    $cmp601 = ($50|0)==(0|0);
    if ($cmp601) {
     label = 72;
     break;
    } else {
     $K583$0 = $shl600;$T$0 = $50;
    }
   }
   if ((label|0) == 72) {
    HEAP32[$arrayidx599>>2] = $p$1;
    $parent610 = ((($p$1)) + 24|0);
    HEAP32[$parent610>>2] = $T$0;
    $bk611 = ((($p$1)) + 12|0);
    HEAP32[$bk611>>2] = $p$1;
    $fd612 = ((($p$1)) + 8|0);
    HEAP32[$fd612>>2] = $p$1;
    break;
   }
   else if ((label|0) == 73) {
    $fd620 = ((($T$0)) + 8|0);
    $51 = HEAP32[$fd620>>2]|0;
    $bk631 = ((($51)) + 12|0);
    HEAP32[$bk631>>2] = $p$1;
    HEAP32[$fd620>>2] = $p$1;
    $fd633 = ((($p$1)) + 8|0);
    HEAP32[$fd633>>2] = $51;
    $bk634 = ((($p$1)) + 12|0);
    HEAP32[$bk634>>2] = $T$0;
    $parent635 = ((($p$1)) + 24|0);
    HEAP32[$parent635>>2] = 0;
    break;
   }
  }
 } while(0);
 $52 = HEAP32[(168)>>2]|0;
 $dec = (($52) + -1)|0;
 HEAP32[(168)>>2] = $dec;
 $cmp640 = ($dec|0)==(0);
 if ($cmp640) {
  $sp$0$in$i = (592);
 } else {
  return;
 }
 while(1) {
  $sp$0$i = HEAP32[$sp$0$in$i>>2]|0;
  $cmp$i = ($sp$0$i|0)==(0|0);
  $next4$i = ((($sp$0$i)) + 8|0);
  if ($cmp$i) {
   break;
  } else {
   $sp$0$in$i = $next4$i;
  }
 }
 HEAP32[(168)>>2] = -1;
 return;
}
function ___emscripten_pthread_data_constructor() {
 var $call = 0, $locale = 0, label = 0, sp = 0;
 sp = STACKTOP;
 $call = (_pthread_self()|0);
 $locale = ((($call)) + 188|0);
 HEAP32[$locale>>2] = (672);
 return;
}
function _pthread_self() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 return (696|0);
}
function ___stdio_close($f) {
 $f = $f|0;
 var $0 = 0, $1 = 0, $call = 0, $call1 = 0, $call2 = 0, $f$addr = 0, $fd = 0, $vararg_buffer = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $vararg_buffer = sp;
 $f$addr = $f;
 $0 = $f$addr;
 $fd = ((($0)) + 60|0);
 $1 = HEAP32[$fd>>2]|0;
 $call = (_dummy($1)|0);
 HEAP32[$vararg_buffer>>2] = $call;
 $call1 = (___syscall6(6,($vararg_buffer|0))|0);
 $call2 = (___syscall_ret($call1)|0);
 STACKTOP = sp;return ($call2|0);
}
function ___stdio_seek($f,$off,$whence) {
 $f = $f|0;
 $off = $off|0;
 $whence = $whence|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $call = 0, $call1 = 0, $cmp = 0, $f$addr = 0, $fd = 0, $off$addr = 0, $ret = 0, $shr = 0, $vararg_buffer = 0, $vararg_ptr1 = 0, $vararg_ptr2 = 0, $vararg_ptr3 = 0, $vararg_ptr4 = 0;
 var $whence$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 48|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(48|0);
 $vararg_buffer = sp;
 $ret = sp + 20|0;
 $f$addr = $f;
 $off$addr = $off;
 $whence$addr = $whence;
 $0 = $f$addr;
 $fd = ((($0)) + 60|0);
 $1 = HEAP32[$fd>>2]|0;
 $2 = $off$addr;
 $shr = $2 >> 32;
 $3 = $off$addr;
 $4 = $ret;
 $5 = $whence$addr;
 HEAP32[$vararg_buffer>>2] = $1;
 $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
 HEAP32[$vararg_ptr1>>2] = $shr;
 $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
 HEAP32[$vararg_ptr2>>2] = $3;
 $vararg_ptr3 = ((($vararg_buffer)) + 12|0);
 HEAP32[$vararg_ptr3>>2] = $4;
 $vararg_ptr4 = ((($vararg_buffer)) + 16|0);
 HEAP32[$vararg_ptr4>>2] = $5;
 $call = (___syscall140(140,($vararg_buffer|0))|0);
 $call1 = (___syscall_ret($call)|0);
 $cmp = ($call1|0)<(0);
 if (!($cmp)) {
  $6 = HEAP32[$ret>>2]|0;
  STACKTOP = sp;return ($6|0);
 }
 HEAP32[$ret>>2] = -1;
 $6 = HEAP32[$ret>>2]|0;
 STACKTOP = sp;return ($6|0);
}
function ___syscall_ret($r) {
 $r = $r|0;
 var $0 = 0, $1 = 0, $2 = 0, $call = 0, $cmp = 0, $r$addr = 0, $retval = 0, $sub = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $r$addr = $r;
 $0 = $r$addr;
 $cmp = ($0>>>0)>(4294963200);
 $1 = $r$addr;
 if ($cmp) {
  $sub = (0 - ($1))|0;
  $call = (___errno_location()|0);
  HEAP32[$call>>2] = $sub;
  $retval = -1;
  $2 = $retval;
  STACKTOP = sp;return ($2|0);
 } else {
  $retval = $1;
  $2 = $retval;
  STACKTOP = sp;return ($2|0);
 }
 return (0)|0;
}
function ___errno_location() {
 var $call = 0, $errno_val = 0, label = 0, sp = 0;
 sp = STACKTOP;
 $call = (___pthread_self_560()|0);
 $errno_val = ((($call)) + 64|0);
 return ($errno_val|0);
}
function ___pthread_self_560() {
 var $call = 0, label = 0, sp = 0;
 sp = STACKTOP;
 $call = (_pthread_self()|0);
 return ($call|0);
}
function _dummy($fd) {
 $fd = $fd|0;
 var $0 = 0, $fd$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $fd$addr = $fd;
 $0 = $fd$addr;
 STACKTOP = sp;return ($0|0);
}
function ___stdio_write($f,$buf,$len) {
 $f = $f|0;
 $buf = $buf|0;
 $len = $len|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0;
 var $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0, $50 = 0, $51 = 0, $52 = 0, $53 = 0, $54 = 0, $55 = 0, $56 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add = 0, $add$ptr = 0, $add$ptr32 = 0;
 var $arrayidx5 = 0, $arrayinit$element = 0, $buf$addr = 0, $buf8 = 0, $buf9 = 0, $buf_size = 0, $call = 0, $call7 = 0, $cmp = 0, $cmp12 = 0, $cmp17 = 0, $cmp24 = 0, $cnt = 0, $cond = 0, $dec = 0, $f$addr = 0, $fd = 0, $incdec$ptr = 0, $iov = 0, $iov_len = 0;
 var $iov_len19 = 0, $iov_len23 = 0, $iov_len27 = 0, $iov_len3 = 0, $iov_len36 = 0, $iov_len4 = 0, $iov_len6 = 0, $iovcnt = 0, $iovs = 0, $len$addr = 0, $or = 0, $rem = 0, $retval = 0, $sub = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$sub = 0, $sub21 = 0, $sub28 = 0, $sub37 = 0;
 var $vararg_buffer = 0, $vararg_ptr1 = 0, $vararg_ptr2 = 0, $wbase = 0, $wbase1 = 0, $wbase10 = 0, $wbase15 = 0, $wend = 0, $wend14 = 0, $wpos = 0, $wpos11 = 0, $wpos16 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 64|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(64|0);
 $vararg_buffer = sp;
 $iovs = sp + 32|0;
 $f$addr = $f;
 $buf$addr = $buf;
 $len$addr = $len;
 $0 = $f$addr;
 $wbase = ((($0)) + 28|0);
 $1 = HEAP32[$wbase>>2]|0;
 HEAP32[$iovs>>2] = $1;
 $iov_len = ((($iovs)) + 4|0);
 $2 = $f$addr;
 $wpos = ((($2)) + 20|0);
 $3 = HEAP32[$wpos>>2]|0;
 $4 = $f$addr;
 $wbase1 = ((($4)) + 28|0);
 $5 = HEAP32[$wbase1>>2]|0;
 $sub$ptr$lhs$cast = $3;
 $sub$ptr$rhs$cast = $5;
 $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
 HEAP32[$iov_len>>2] = $sub$ptr$sub;
 $arrayinit$element = ((($iovs)) + 8|0);
 $6 = $buf$addr;
 HEAP32[$arrayinit$element>>2] = $6;
 $iov_len3 = ((($arrayinit$element)) + 4|0);
 $7 = $len$addr;
 HEAP32[$iov_len3>>2] = $7;
 $iov = $iovs;
 $8 = $iov;
 $iov_len4 = ((($8)) + 4|0);
 $9 = HEAP32[$iov_len4>>2]|0;
 $10 = $iov;
 $arrayidx5 = ((($10)) + 8|0);
 $iov_len6 = ((($arrayidx5)) + 4|0);
 $11 = HEAP32[$iov_len6>>2]|0;
 $add = (($9) + ($11))|0;
 $rem = $add;
 $iovcnt = 2;
 while(1) {
  $12 = $f$addr;
  $fd = ((($12)) + 60|0);
  $13 = HEAP32[$fd>>2]|0;
  $14 = $iov;
  $15 = $14;
  $16 = $iovcnt;
  HEAP32[$vararg_buffer>>2] = $13;
  $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
  HEAP32[$vararg_ptr1>>2] = $15;
  $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
  HEAP32[$vararg_ptr2>>2] = $16;
  $call = (___syscall146(146,($vararg_buffer|0))|0);
  $call7 = (___syscall_ret($call)|0);
  $cnt = $call7;
  $17 = $cnt;
  $18 = $rem;
  $cmp = ($17|0)==($18|0);
  if ($cmp) {
   label = 3;
   break;
  }
  $29 = $cnt;
  $cmp12 = ($29|0)<(0);
  if ($cmp12) {
   break;
  }
  $39 = $cnt;
  $40 = $rem;
  $sub21 = (($40) - ($39))|0;
  $rem = $sub21;
  $41 = $cnt;
  $42 = $iov;
  $iov_len23 = ((($42)) + 4|0);
  $43 = HEAP32[$iov_len23>>2]|0;
  $cmp24 = ($41>>>0)>($43>>>0);
  if ($cmp24) {
   $44 = $iov;
   $iov_len27 = ((($44)) + 4|0);
   $45 = HEAP32[$iov_len27>>2]|0;
   $46 = $cnt;
   $sub28 = (($46) - ($45))|0;
   $cnt = $sub28;
   $47 = $iov;
   $incdec$ptr = ((($47)) + 8|0);
   $iov = $incdec$ptr;
   $48 = $iovcnt;
   $dec = (($48) + -1)|0;
   $iovcnt = $dec;
  }
  $49 = $iov;
  $50 = HEAP32[$49>>2]|0;
  $51 = $cnt;
  $add$ptr32 = (($50) + ($51)|0);
  $52 = $iov;
  HEAP32[$52>>2] = $add$ptr32;
  $53 = $cnt;
  $54 = $iov;
  $iov_len36 = ((($54)) + 4|0);
  $55 = HEAP32[$iov_len36>>2]|0;
  $sub37 = (($55) - ($53))|0;
  HEAP32[$iov_len36>>2] = $sub37;
 }
 if ((label|0) == 3) {
  $19 = $f$addr;
  $buf8 = ((($19)) + 44|0);
  $20 = HEAP32[$buf8>>2]|0;
  $21 = $f$addr;
  $buf_size = ((($21)) + 48|0);
  $22 = HEAP32[$buf_size>>2]|0;
  $add$ptr = (($20) + ($22)|0);
  $23 = $f$addr;
  $wend = ((($23)) + 16|0);
  HEAP32[$wend>>2] = $add$ptr;
  $24 = $f$addr;
  $buf9 = ((($24)) + 44|0);
  $25 = HEAP32[$buf9>>2]|0;
  $26 = $f$addr;
  $wbase10 = ((($26)) + 28|0);
  HEAP32[$wbase10>>2] = $25;
  $27 = $f$addr;
  $wpos11 = ((($27)) + 20|0);
  HEAP32[$wpos11>>2] = $25;
  $28 = $len$addr;
  $retval = $28;
  $56 = $retval;
  STACKTOP = sp;return ($56|0);
 }
 $30 = $f$addr;
 $wend14 = ((($30)) + 16|0);
 HEAP32[$wend14>>2] = 0;
 $31 = $f$addr;
 $wbase15 = ((($31)) + 28|0);
 HEAP32[$wbase15>>2] = 0;
 $32 = $f$addr;
 $wpos16 = ((($32)) + 20|0);
 HEAP32[$wpos16>>2] = 0;
 $33 = $f$addr;
 $34 = HEAP32[$33>>2]|0;
 $or = $34 | 32;
 HEAP32[$33>>2] = $or;
 $35 = $iovcnt;
 $cmp17 = ($35|0)==(2);
 if ($cmp17) {
  $cond = 0;
 } else {
  $36 = $len$addr;
  $37 = $iov;
  $iov_len19 = ((($37)) + 4|0);
  $38 = HEAP32[$iov_len19>>2]|0;
  $sub = (($36) - ($38))|0;
  $cond = $sub;
 }
 $retval = $cond;
 $56 = $retval;
 STACKTOP = sp;return ($56|0);
}
function ___stdout_write($f,$buf,$len) {
 $f = $f|0;
 $buf = $buf|0;
 $len = $len|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $and = 0, $buf$addr = 0, $call = 0, $call3 = 0, $f$addr = 0, $fd = 0, $lbf = 0, $len$addr = 0, $tobool = 0, $tobool2 = 0;
 var $vararg_buffer = 0, $vararg_ptr1 = 0, $vararg_ptr2 = 0, $write = 0, $wsz = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $vararg_buffer = sp;
 $wsz = sp + 24|0;
 $f$addr = $f;
 $buf$addr = $buf;
 $len$addr = $len;
 $0 = $f$addr;
 $write = ((($0)) + 36|0);
 HEAP32[$write>>2] = 4;
 $1 = $f$addr;
 $2 = HEAP32[$1>>2]|0;
 $and = $2 & 64;
 $tobool = ($and|0)!=(0);
 if (!($tobool)) {
  $3 = $f$addr;
  $fd = ((($3)) + 60|0);
  $4 = HEAP32[$fd>>2]|0;
  $5 = $wsz;
  HEAP32[$vararg_buffer>>2] = $4;
  $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
  HEAP32[$vararg_ptr1>>2] = 21523;
  $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
  HEAP32[$vararg_ptr2>>2] = $5;
  $call = (___syscall54(54,($vararg_buffer|0))|0);
  $tobool2 = ($call|0)!=(0);
  if ($tobool2) {
   $6 = $f$addr;
   $lbf = ((($6)) + 75|0);
   HEAP8[$lbf>>0] = -1;
  }
 }
 $7 = $f$addr;
 $8 = $buf$addr;
 $9 = $len$addr;
 $call3 = (___stdio_write($7,$8,$9)|0);
 STACKTOP = sp;return ($call3|0);
}
function _emscripten_get_global_libc() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 return (632|0);
}
function ___lockfile($f) {
 $f = $f|0;
 var $0 = 0, $f$addr = 0, $retval = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 $0 = $retval;
 STACKTOP = sp;return ($0|0);
}
function ___unlockfile($f) {
 $f = $f|0;
 var $f$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 STACKTOP = sp;return;
}
function ___ofl_lock() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 ___lock((940|0));
 return (948|0);
}
function ___ofl_unlock() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 ___unlock((940|0));
 return;
}
function _fflush($f) {
 $f = $f|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $__need_unlock = 0, $__need_unlock13 = 0, $call = 0, $call1 = 0, $call11 = 0, $call17 = 0, $call23 = 0, $call7 = 0, $cmp = 0, $cmp15 = 0, $cmp21 = 0, $cond = 0, $cond10 = 0;
 var $cond20 = 0, $f$addr = 0, $lock = 0, $lock14 = 0, $next = 0, $or = 0, $r = 0, $retval = 0, $tobool = 0, $tobool12 = 0, $tobool2 = 0, $tobool25 = 0, $tobool5 = 0, $wbase = 0, $wpos = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $f$addr = $f;
 $0 = $f$addr;
 $tobool = ($0|0)!=(0|0);
 if ($tobool) {
  $1 = $f$addr;
  $lock = ((($1)) + 76|0);
  $2 = HEAP32[$lock>>2]|0;
  $cmp = ($2|0)>=(0);
  if ($cmp) {
   $3 = $f$addr;
   $call = (___lockfile($3)|0);
   $cond = $call;
  } else {
   $cond = 0;
  }
  $__need_unlock = $cond;
  $4 = $f$addr;
  $call1 = (___fflush_unlocked($4)|0);
  $r = $call1;
  $5 = $__need_unlock;
  $tobool2 = ($5|0)!=(0);
  if ($tobool2) {
   $6 = $f$addr;
   ___unlockfile($6);
  }
  $7 = $r;
  $retval = $7;
  $26 = $retval;
  STACKTOP = sp;return ($26|0);
 }
 $8 = HEAP32[33]|0;
 $tobool5 = ($8|0)!=(0|0);
 if ($tobool5) {
  $9 = HEAP32[33]|0;
  $call7 = (_fflush($9)|0);
  $cond10 = $call7;
 } else {
  $cond10 = 0;
 }
 $r = $cond10;
 $call11 = (___ofl_lock()|0);
 $10 = HEAP32[$call11>>2]|0;
 $f$addr = $10;
 while(1) {
  $11 = $f$addr;
  $tobool12 = ($11|0)!=(0|0);
  if (!($tobool12)) {
   break;
  }
  $12 = $f$addr;
  $lock14 = ((($12)) + 76|0);
  $13 = HEAP32[$lock14>>2]|0;
  $cmp15 = ($13|0)>=(0);
  if ($cmp15) {
   $14 = $f$addr;
   $call17 = (___lockfile($14)|0);
   $cond20 = $call17;
  } else {
   $cond20 = 0;
  }
  $__need_unlock13 = $cond20;
  $15 = $f$addr;
  $wpos = ((($15)) + 20|0);
  $16 = HEAP32[$wpos>>2]|0;
  $17 = $f$addr;
  $wbase = ((($17)) + 28|0);
  $18 = HEAP32[$wbase>>2]|0;
  $cmp21 = ($16>>>0)>($18>>>0);
  if ($cmp21) {
   $19 = $f$addr;
   $call23 = (___fflush_unlocked($19)|0);
   $20 = $r;
   $or = $20 | $call23;
   $r = $or;
  }
  $21 = $__need_unlock13;
  $tobool25 = ($21|0)!=(0);
  if ($tobool25) {
   $22 = $f$addr;
   ___unlockfile($22);
  }
  $23 = $f$addr;
  $next = ((($23)) + 56|0);
  $24 = HEAP32[$next>>2]|0;
  $f$addr = $24;
 }
 ___ofl_unlock();
 $25 = $r;
 $retval = $25;
 $26 = $retval;
 STACKTOP = sp;return ($26|0);
}
function ___fflush_unlocked($f) {
 $f = $f|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $3 = 0;
 var $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $cmp = 0, $cmp4 = 0, $f$addr = 0, $rend = 0, $rend12 = 0, $rend7 = 0, $retval = 0, $rpos = 0, $rpos13 = 0, $rpos6 = 0, $seek = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$sub = 0;
 var $tobool = 0, $wbase = 0, $wbase10 = 0, $wend = 0, $wpos = 0, $wpos1 = 0, $wpos11 = 0, $write = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 $0 = $f$addr;
 $wpos = ((($0)) + 20|0);
 $1 = HEAP32[$wpos>>2]|0;
 $2 = $f$addr;
 $wbase = ((($2)) + 28|0);
 $3 = HEAP32[$wbase>>2]|0;
 $cmp = ($1>>>0)>($3>>>0);
 if ($cmp) {
  $4 = $f$addr;
  $write = ((($4)) + 36|0);
  $5 = HEAP32[$write>>2]|0;
  $6 = $f$addr;
  (FUNCTION_TABLE_iiii[$5 & 7]($6,0,0)|0);
  $7 = $f$addr;
  $wpos1 = ((($7)) + 20|0);
  $8 = HEAP32[$wpos1>>2]|0;
  $tobool = ($8|0)!=(0|0);
  if (!($tobool)) {
   $retval = -1;
   $25 = $retval;
   STACKTOP = sp;return ($25|0);
  }
 }
 $9 = $f$addr;
 $rpos = ((($9)) + 4|0);
 $10 = HEAP32[$rpos>>2]|0;
 $11 = $f$addr;
 $rend = ((($11)) + 8|0);
 $12 = HEAP32[$rend>>2]|0;
 $cmp4 = ($10>>>0)<($12>>>0);
 if ($cmp4) {
  $13 = $f$addr;
  $seek = ((($13)) + 40|0);
  $14 = HEAP32[$seek>>2]|0;
  $15 = $f$addr;
  $16 = $f$addr;
  $rpos6 = ((($16)) + 4|0);
  $17 = HEAP32[$rpos6>>2]|0;
  $18 = $f$addr;
  $rend7 = ((($18)) + 8|0);
  $19 = HEAP32[$rend7>>2]|0;
  $sub$ptr$lhs$cast = $17;
  $sub$ptr$rhs$cast = $19;
  $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
  (FUNCTION_TABLE_iiii[$14 & 7]($15,$sub$ptr$sub,1)|0);
 }
 $20 = $f$addr;
 $wend = ((($20)) + 16|0);
 HEAP32[$wend>>2] = 0;
 $21 = $f$addr;
 $wbase10 = ((($21)) + 28|0);
 HEAP32[$wbase10>>2] = 0;
 $22 = $f$addr;
 $wpos11 = ((($22)) + 20|0);
 HEAP32[$wpos11>>2] = 0;
 $23 = $f$addr;
 $rend12 = ((($23)) + 8|0);
 HEAP32[$rend12>>2] = 0;
 $24 = $f$addr;
 $rpos13 = ((($24)) + 4|0);
 HEAP32[$rpos13>>2] = 0;
 $retval = 0;
 $25 = $retval;
 STACKTOP = sp;return ($25|0);
}
function runPostSets() {
}
function _sbrk(increment) {
    increment = increment|0;
    var oldDynamicTop = 0;
    var oldDynamicTopOnChange = 0;
    var newDynamicTop = 0;
    var totalMemory = 0;
    increment = ((increment + 15) & -16)|0;
    oldDynamicTop = HEAP32[DYNAMICTOP_PTR>>2]|0;
    newDynamicTop = oldDynamicTop + increment | 0;

    if (((increment|0) > 0 & (newDynamicTop|0) < (oldDynamicTop|0)) // Detect and fail if we would wrap around signed 32-bit int.
      | (newDynamicTop|0) < 0) { // Also underflow, sbrk() should be able to be used to subtract.
      abortOnCannotGrowMemory()|0;
      ___setErrNo(12);
      return -1;
    }

    HEAP32[DYNAMICTOP_PTR>>2] = newDynamicTop;
    totalMemory = getTotalMemory()|0;
    if ((newDynamicTop|0) > (totalMemory|0)) {
      if ((enlargeMemory()|0) == 0) {
        HEAP32[DYNAMICTOP_PTR>>2] = oldDynamicTop;
        ___setErrNo(12);
        return -1;
      }
    }
    return oldDynamicTop|0;
}
function _memset(ptr, value, num) {
    ptr = ptr|0; value = value|0; num = num|0;
    var end = 0, aligned_end = 0, block_aligned_end = 0, value4 = 0;
    end = (ptr + num)|0;

    value = value & 0xff;
    if ((num|0) >= 67 /* 64 bytes for an unrolled loop + 3 bytes for unaligned head*/) {
      while ((ptr&3) != 0) {
        HEAP8[((ptr)>>0)]=value;
        ptr = (ptr+1)|0;
      }

      aligned_end = (end & -4)|0;
      block_aligned_end = (aligned_end - 64)|0;
      value4 = value | (value << 8) | (value << 16) | (value << 24);

      while((ptr|0) <= (block_aligned_end|0)) {
        HEAP32[((ptr)>>2)]=value4;
        HEAP32[(((ptr)+(4))>>2)]=value4;
        HEAP32[(((ptr)+(8))>>2)]=value4;
        HEAP32[(((ptr)+(12))>>2)]=value4;
        HEAP32[(((ptr)+(16))>>2)]=value4;
        HEAP32[(((ptr)+(20))>>2)]=value4;
        HEAP32[(((ptr)+(24))>>2)]=value4;
        HEAP32[(((ptr)+(28))>>2)]=value4;
        HEAP32[(((ptr)+(32))>>2)]=value4;
        HEAP32[(((ptr)+(36))>>2)]=value4;
        HEAP32[(((ptr)+(40))>>2)]=value4;
        HEAP32[(((ptr)+(44))>>2)]=value4;
        HEAP32[(((ptr)+(48))>>2)]=value4;
        HEAP32[(((ptr)+(52))>>2)]=value4;
        HEAP32[(((ptr)+(56))>>2)]=value4;
        HEAP32[(((ptr)+(60))>>2)]=value4;
        ptr = (ptr + 64)|0;
      }

      while ((ptr|0) < (aligned_end|0) ) {
        HEAP32[((ptr)>>2)]=value4;
        ptr = (ptr+4)|0;
      }
    }
    // The remaining bytes.
    while ((ptr|0) < (end|0)) {
      HEAP8[((ptr)>>0)]=value;
      ptr = (ptr+1)|0;
    }
    return (end-num)|0;
}
function _memcpy(dest, src, num) {
    dest = dest|0; src = src|0; num = num|0;
    var ret = 0;
    var aligned_dest_end = 0;
    var block_aligned_dest_end = 0;
    var dest_end = 0;
    // Test against a benchmarked cutoff limit for when HEAPU8.set() becomes faster to use.
    if ((num|0) >=
      8192
    ) {
      return _emscripten_memcpy_big(dest|0, src|0, num|0)|0;
    }

    ret = dest|0;
    dest_end = (dest + num)|0;
    if ((dest&3) == (src&3)) {
      // The initial unaligned < 4-byte front.
      while (dest & 3) {
        if ((num|0) == 0) return ret|0;
        HEAP8[((dest)>>0)]=((HEAP8[((src)>>0)])|0);
        dest = (dest+1)|0;
        src = (src+1)|0;
        num = (num-1)|0;
      }
      aligned_dest_end = (dest_end & -4)|0;
      block_aligned_dest_end = (aligned_dest_end - 64)|0;
      while ((dest|0) <= (block_aligned_dest_end|0) ) {
        HEAP32[((dest)>>2)]=((HEAP32[((src)>>2)])|0);
        HEAP32[(((dest)+(4))>>2)]=((HEAP32[(((src)+(4))>>2)])|0);
        HEAP32[(((dest)+(8))>>2)]=((HEAP32[(((src)+(8))>>2)])|0);
        HEAP32[(((dest)+(12))>>2)]=((HEAP32[(((src)+(12))>>2)])|0);
        HEAP32[(((dest)+(16))>>2)]=((HEAP32[(((src)+(16))>>2)])|0);
        HEAP32[(((dest)+(20))>>2)]=((HEAP32[(((src)+(20))>>2)])|0);
        HEAP32[(((dest)+(24))>>2)]=((HEAP32[(((src)+(24))>>2)])|0);
        HEAP32[(((dest)+(28))>>2)]=((HEAP32[(((src)+(28))>>2)])|0);
        HEAP32[(((dest)+(32))>>2)]=((HEAP32[(((src)+(32))>>2)])|0);
        HEAP32[(((dest)+(36))>>2)]=((HEAP32[(((src)+(36))>>2)])|0);
        HEAP32[(((dest)+(40))>>2)]=((HEAP32[(((src)+(40))>>2)])|0);
        HEAP32[(((dest)+(44))>>2)]=((HEAP32[(((src)+(44))>>2)])|0);
        HEAP32[(((dest)+(48))>>2)]=((HEAP32[(((src)+(48))>>2)])|0);
        HEAP32[(((dest)+(52))>>2)]=((HEAP32[(((src)+(52))>>2)])|0);
        HEAP32[(((dest)+(56))>>2)]=((HEAP32[(((src)+(56))>>2)])|0);
        HEAP32[(((dest)+(60))>>2)]=((HEAP32[(((src)+(60))>>2)])|0);
        dest = (dest+64)|0;
        src = (src+64)|0;
      }
      while ((dest|0) < (aligned_dest_end|0) ) {
        HEAP32[((dest)>>2)]=((HEAP32[((src)>>2)])|0);
        dest = (dest+4)|0;
        src = (src+4)|0;
      }
    } else {
      // In the unaligned copy case, unroll a bit as well.
      aligned_dest_end = (dest_end - 4)|0;
      while ((dest|0) < (aligned_dest_end|0) ) {
        HEAP8[((dest)>>0)]=((HEAP8[((src)>>0)])|0);
        HEAP8[(((dest)+(1))>>0)]=((HEAP8[(((src)+(1))>>0)])|0);
        HEAP8[(((dest)+(2))>>0)]=((HEAP8[(((src)+(2))>>0)])|0);
        HEAP8[(((dest)+(3))>>0)]=((HEAP8[(((src)+(3))>>0)])|0);
        dest = (dest+4)|0;
        src = (src+4)|0;
      }
    }
    // The remaining unaligned < 4 byte tail.
    while ((dest|0) < (dest_end|0)) {
      HEAP8[((dest)>>0)]=((HEAP8[((src)>>0)])|0);
      dest = (dest+1)|0;
      src = (src+1)|0;
    }
    return ret|0;
}

  
function dynCall_ii(index,a1) {
  index = index|0;
  a1=a1|0;
  return FUNCTION_TABLE_ii[index&1](a1|0)|0;
}


function dynCall_iiii(index,a1,a2,a3) {
  index = index|0;
  a1=a1|0; a2=a2|0; a3=a3|0;
  return FUNCTION_TABLE_iiii[index&7](a1|0,a2|0,a3|0)|0;
}

function b0(p0) {
 p0 = p0|0; nullFunc_ii(0);return 0;
}
function b1(p0,p1,p2) {
 p0 = p0|0;p1 = p1|0;p2 = p2|0; nullFunc_iiii(1);return 0;
}

// EMSCRIPTEN_END_FUNCS
var FUNCTION_TABLE_ii = [b0,___stdio_close];
var FUNCTION_TABLE_iiii = [b1,b1,___stdout_write,___stdio_seek,___stdio_write,b1,b1,b1];

  return { _sbrk: _sbrk, getTempRet0: getTempRet0, _fflush: _fflush, _main: _main, setTempRet0: setTempRet0, establishStackSpace: establishStackSpace, ___emscripten_pthread_data_constructor: ___emscripten_pthread_data_constructor, dynCall_iiii: dynCall_iiii, _memset: _memset, dynCall_ii: dynCall_ii, _malloc: _malloc, ___errno_location: ___errno_location, _emscripten_get_global_libc: _emscripten_get_global_libc, _memcpy: _memcpy, stackAlloc: stackAlloc, setThrew: setThrew, _free: _free, stackRestore: stackRestore, stackSave: stackSave, runPostSets: runPostSets };
})
// EMSCRIPTEN_END_ASM

if (!ENVIRONMENT_IS_BROWSIX) {
  asm = asmModule(Module.asmGlobalArg, Module.asmLibraryArg, buffer);
}
function initReceiving () {
var real__malloc = asm["_malloc"]; asm["_malloc"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__malloc.apply(null, arguments);
};

var real_getTempRet0 = asm["getTempRet0"]; asm["getTempRet0"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_getTempRet0.apply(null, arguments);
};

var real__fflush = asm["_fflush"]; asm["_fflush"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__fflush.apply(null, arguments);
};

var real__main = asm["_main"]; asm["_main"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__main.apply(null, arguments);
};

var real_setTempRet0 = asm["setTempRet0"]; asm["setTempRet0"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_setTempRet0.apply(null, arguments);
};

var real_establishStackSpace = asm["establishStackSpace"]; asm["establishStackSpace"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_establishStackSpace.apply(null, arguments);
};

var real____emscripten_pthread_data_constructor = asm["___emscripten_pthread_data_constructor"]; asm["___emscripten_pthread_data_constructor"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real____emscripten_pthread_data_constructor.apply(null, arguments);
};

var real_stackSave = asm["stackSave"]; asm["stackSave"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_stackSave.apply(null, arguments);
};

var real__sbrk = asm["_sbrk"]; asm["_sbrk"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__sbrk.apply(null, arguments);
};

var real__emscripten_get_global_libc = asm["_emscripten_get_global_libc"]; asm["_emscripten_get_global_libc"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__emscripten_get_global_libc.apply(null, arguments);
};

var real_stackAlloc = asm["stackAlloc"]; asm["stackAlloc"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_stackAlloc.apply(null, arguments);
};

var real_setThrew = asm["setThrew"]; asm["setThrew"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_setThrew.apply(null, arguments);
};

var real__free = asm["_free"]; asm["_free"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__free.apply(null, arguments);
};

var real_stackRestore = asm["stackRestore"]; asm["stackRestore"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_stackRestore.apply(null, arguments);
};

var real____errno_location = asm["___errno_location"]; asm["___errno_location"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real____errno_location.apply(null, arguments);
};
_malloc = Module["_malloc"] = asm["_malloc"];
getTempRet0 = Module["getTempRet0"] = asm["getTempRet0"];
_fflush = Module["_fflush"] = asm["_fflush"];
_main = Module["_main"] = asm["_main"];
setTempRet0 = Module["setTempRet0"] = asm["setTempRet0"];
establishStackSpace = Module["establishStackSpace"] = asm["establishStackSpace"];
___emscripten_pthread_data_constructor = Module["___emscripten_pthread_data_constructor"] = asm["___emscripten_pthread_data_constructor"];
stackSave = Module["stackSave"] = asm["stackSave"];
_memset = Module["_memset"] = asm["_memset"];
_sbrk = Module["_sbrk"] = asm["_sbrk"];
_emscripten_get_global_libc = Module["_emscripten_get_global_libc"] = asm["_emscripten_get_global_libc"];
_memcpy = Module["_memcpy"] = asm["_memcpy"];
stackAlloc = Module["stackAlloc"] = asm["stackAlloc"];
setThrew = Module["setThrew"] = asm["setThrew"];
_free = Module["_free"] = asm["_free"];
stackRestore = Module["stackRestore"] = asm["stackRestore"];
___errno_location = Module["___errno_location"] = asm["___errno_location"];
runPostSets = Module["runPostSets"] = asm["runPostSets"];
dynCall_ii = Module["dynCall_ii"] = asm["dynCall_ii"];
dynCall_iiii = Module["dynCall_iiii"] = asm["dynCall_iiii"];

} if (!ENVIRONMENT_IS_BROWSIX)
    initReceiving();;
function initRuntimeFuncs () {
Runtime.stackAlloc = Module['stackAlloc'];
Runtime.stackSave = Module['stackSave'];
Runtime.stackRestore = Module['stackRestore'];
Runtime.establishStackSpace = Module['establishStackSpace'];
Runtime.setTempRet0 = Module['setTempRet0'];
Runtime.getTempRet0 = Module['getTempRet0'];
} if (!ENVIRONMENT_IS_BROWSIX)
    initRuntimeFuncs();


// === Auto-generated postamble setup entry stuff ===

Module['asm'] = asm;







/**
 * @constructor
 * @extends {Error}
 */
function ExitStatus(status) {
  this.name = "ExitStatus";
  this.message = "Program terminated with exit(" + status + ")";
  this.status = status;
};
ExitStatus.prototype = new Error();
ExitStatus.prototype.constructor = ExitStatus;

var initialStackTop;
var preloadStartTime = null;
var calledMain = false;

dependenciesFulfilled = function runCaller() {
  // If run has never been called, and we should call run (INVOKE_RUN is true, and Module.noInitialRun is not false)
  if (!Module['calledRun']) run(Module['arguments']);
  if (!Module['calledRun']) dependenciesFulfilled = runCaller; // try this again later, after new deps are fulfilled
}

Module['callMain'] = Module.callMain = function callMain(args) {
  assert(runDependencies == 0, 'cannot call main when async dependencies remain! (listen on __ATMAIN__)');
  assert(__ATPRERUN__.length == 0, 'cannot call main when preRun functions remain to be called');

  args = args || [];

  ensureInitRuntime();

  var argc = args.length+1;
  function pad() {
    for (var i = 0; i < 4-1; i++) {
      argv.push(0);
    }
  }
  var argv = [allocate(intArrayFromString(Module['thisProgram']), 'i8', ALLOC_NORMAL) ];
  pad();
  for (var i = 0; i < argc-1; i = i + 1) {
    argv.push(allocate(intArrayFromString(args[i]), 'i8', ALLOC_NORMAL));
    pad();
  }
  argv.push(0);
  argv = allocate(argv, 'i32', ALLOC_NORMAL);


  try {

    if (Module['__browsix_start'] == undefined)
      var ret = Module['_main'](argc, argv, 0);
    else
      var ret = Module['__browsix_start'](argc, argv, 0);


    // if we're not running an evented main loop, it's time to exit
    exit(ret, /* implicit = */ true);
  }
  catch(e) {
    if (e instanceof ExitStatus) {
      // exit() throws this once it's done to make sure execution
      // has been stopped completely
      return;
    } else if (e == 'SimulateInfiniteLoop') {
      // running an evented main loop, don't immediately exit
      Module['noExitRuntime'] = true;
      return;
    } else {
      var toLog = e;
      if (e && typeof e === 'object' && e.stack) {
        toLog = [e, e.stack];
      }
      Module.printErr('exception thrown: ' + toLog);
      Module['quit'](1, e);
    }
  } finally {
    calledMain = true;
  }
}




/** @type {function(Array=)} */
function run(args) {
  args = args || Module['arguments'];

  if (preloadStartTime === null) preloadStartTime = Date.now();

  if (runDependencies > 0) {
    return;
  }

  writeStackCookie();

  preRun();

  if (runDependencies > 0) return; // a preRun added a dependency, run will be called later
  if (Module['calledRun']) return; // run may have just been called through dependencies being fulfilled just in this very frame

  function doRun() {
    if (Module['calledRun']) return; // run may have just been called while the async setStatus time below was happening
    Module['calledRun'] = true;

    if (ABORT) return;

    ensureInitRuntime();

    preMain();

    if (ENVIRONMENT_IS_WEB && preloadStartTime !== null) {
      Module.printErr('pre-main prep time: ' + (Date.now() - preloadStartTime) + ' ms');
    }

    if (Module['onRuntimeInitialized']) Module['onRuntimeInitialized']();

    if (Module['_main'] && shouldRunNow) Module['callMain'](args);

    postRun();
  }

  if (Module['setStatus']) {
    Module['setStatus']('Running...');
    setTimeout(function() {
      setTimeout(function() {
        Module['setStatus']('');
      }, 1);
      doRun();
    }, 1);
  } else {
    doRun();
  }
  checkStackCookie();
}
Module['run'] = Module.run = run;

function exit(status, implicit) {
  if (implicit && Module['noExitRuntime']) {
    Module.printErr('exit(' + status + ') implicitly called by end of main(), but noExitRuntime, so not exiting the runtime (you can use emscripten_force_exit, if you want to force a true shutdown)');
    return;
  }

  // we don't care about noExitRuntime for explicit exit calls in Browsix()
  if (ENVIRONMENT_IS_BROWSIX) {
    EXITSTATUS = status;
    Runtime.process.exit(status);
    var ua = navigator.appVersion;
    if (ua.includes('Safari/') && !ua.includes('Chrom')) {
      // WebKit doesn't like ExitStatus being thrown, but this
      // infinite loop severly hurts perf on non-webkit browsers.
      for (;;) {}
    } else {
      // this will terminate the worker's execution as an uncaught
      // Exception, which is what we want.
      throw new ExitStatus(status);
    }
  }

  if (Module['noExitRuntime']) {
    Module.printErr('exit(' + status + ') called, but noExitRuntime, so halting execution but not exiting the runtime or preventing further async execution (you can use emscripten_force_exit, if you want to force a true shutdown)');
  } else {

    ABORT = true;
    EXITSTATUS = status;
    STACKTOP = initialStackTop;

    exitRuntime();

    if (Module['onExit']) Module['onExit'](status);
  }

  if (ENVIRONMENT_IS_NODE) {
    process['exit'](status);
  }
  Module['quit'](status, new ExitStatus(status));
}
Module['exit'] = Module.exit = exit;

var abortDecorators = [];

function abort(what) {
  if (Module['onAbort']) {
    Module['onAbort'](what);
  }

  if (what !== undefined) {
    Module.print(what);
    Module.printErr(what);
    what = JSON.stringify(what)
  } else {
    what = '';
  }

  ABORT = true;
  EXITSTATUS = 1;

  var extra = '';

  var output = 'abort(' + what + ') at ' + stackTrace() + extra;
  if (abortDecorators) {
    abortDecorators.forEach(function(decorator) {
      output = decorator(output, what);
    });
  }
  throw output;
}
Module['abort'] = Module.abort = abort;

// {{PRE_RUN_ADDITIONS}}

if (Module['preInit']) {
  if (typeof Module['preInit'] == 'function') Module['preInit'] = [Module['preInit']];
  while (Module['preInit'].length > 0) {
    Module['preInit'].pop()();
  }
}

// shouldRunNow refers to calling main(), not run().
var shouldRunNow = true;
if (Module['noInitialRun']) {
  shouldRunNow = false;
}


if (ENVIRONMENT_IS_BROWSIX) {
  self.onmessage = BROWSIX.browsix.syscall.resultHandler.bind(BROWSIX.browsix.syscall);
  Runtime.process.once('ready', function() {
    Module['thisProgram'] = Runtime.process.argv[0];
    for (var k in Runtime.process.env) {
      if (!Runtime.process.env.hasOwnProperty(k))
        continue;
      ENV[k] = Runtime.process.env[k];
    }
    ENV = Runtime.process.env;
    ENV['_'] = Runtime.process.argv[0];

    if (Runtime.process.pid) {
      abort('TODO: sync post-fork?');
    } else {
      var args = Runtime.process.argv.slice(2);
      Module['arguments'] = args;
      run(args);
    }
  });
} else if (typeof ENVIRONMENT_IS_PTHREAD === 'undefined' || !ENVIRONMENT_IS_PTHREAD) {
  run();
}

// {{POST_RUN_ADDITIONS}}





// {{MODULE_ADDITIONS}}



