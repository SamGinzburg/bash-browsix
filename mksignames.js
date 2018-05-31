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






// === Body ===

var ASM_CONSTS = [];




STATIC_BASE = Runtime.GLOBAL_BASE;

STATICTOP = STATIC_BASE + 13008;
/* global initializers */  __ATINIT__.push({ func: function() { ___emscripten_pthread_data_constructor() } });


/* memory initializer */ allocate([12,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,3,0,0,0,40,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,140,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,3,0,0,0,48,19,0,0,156,31,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,255,255,255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,140,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,47,42,32,84,104,105,115,32,102,105,108,101,32,119,97,115,32,97,117,116,111,109,97,116,105,99,97,108,108,121,32,99,114,101,97,116,101,100,32,98,121,32,37,115,46,10,0,32,32,32,68,111,32,110,111,116,32,101,100,105,116,46,32,32,69,100,105,116,32,115,117,112,112,111,114,116,47,109,107,115,105,103,110,97,109,101,115,46,99,32,105,110,115,116,101,97,100,46,32,42,47,10,10,0,47,42,32,65,32,116,114,97,110,115,108,97,116,105,111,110,32,108,105,115,116,32,115,111,32,119,101,32,99,97,110,32,98,101,32,112,111,108,105,116,101,32,116,111,32,111,117,114,32,117,115,101,114,115,46,32,42,47,10,0,99,104,97,114,32,42,115,105,103,110,97,108,95,110,97,109,101,115,91,78,83,73,71,32,43,32,52,93,32,61,32,123,10,0,32,32,32,32,34,37,115,34,44,10,0,32,32,32,32,40,99,104,97,114,32,42,41,48,120,48,10,0,125,59,10,10,0,35,100,101,102,105,110,101,32,105,110,105,116,105,97,108,105,122,101,95,115,105,103,110,97,109,101,115,40,41,10,10,0,115,116,100,111,117,116,0,119,0,85,115,97,103,101,58,32,37,115,32,91,111,117,116,112,117,116,45,102,105,108,101,93,10,0,37,115,58,32,37,115,58,32,99,97,110,110,111,116,32,111,112,101,110,32,102,111,114,32,119,114,105,116,105,110,103,10,0,69,88,73,84,0,83,73,71,82,84,77,73,78,0,83,73,71,82,84,77,65,88,0,37,115,58,32,101,114,114,111,114,58,32,109,111,114,101,32,116,104,97,110,32,37,100,32,114,101,97,108,32,116,105,109,101,32,115,105,103,110,97,108,115,44,32,102,105,120,32,96,37,115,39,10,0,83,73,71,82,84,77,73,78,43,37,100,0,83,73,71,82,84,77,65,88,45,37,100,0,83,73,71,80,87,82,0,83,73,71,80,79,76,76,0,83,73,71,83,84,75,70,76,84,0,83,73,71,72,85,80,0,83,73,71,73,78,84,0,83,73,71,81,85,73,84,0,83,73,71,73,76,76,0,83,73,71,84,82,65,80,0,83,73,71,73,79,84,0,83,73,71,65,66,82,84,0,83,73,71,70,80,69,0,83,73,71,75,73,76,76,0,83,73,71,66,85,83,0,83,73,71,83,69,71,86,0,83,73,71,83,89,83,0,83,73,71,80,73,80,69,0,83,73,71,65,76,82,77,0,83,73,71,84,69,82,77,0,83,73,71,85,82,71,0,83,73,71,83,84,79,80,0,83,73,71,84,83,84,80,0,83,73,71,67,79,78,84,0,83,73,71,67,72,76,68,0,83,73,71,84,84,73,78,0,83,73,71,84,84,79,85,0,83,73,71,73,79,0,83,73,71,88,67,80,85,0,83,73,71,88,70,83,90,0,83,73,71,86,84,65,76,82,77,0,83,73,71,80,82,79,70,0,83,73,71,87,73,78,67,72,0,83,73,71,85,83,82,49,0,83,73,71,85,83,82,50,0,83,73,71,74,85,78,75,40,37,100,41,0,68,69,66,85,71,0,69,82,82,0,82,69,84,85,82,78,0,17,0,10,0,17,17,17,0,0,0,0,5,0,0,0,0,0,0,9,0,0,0,0,11,0,0,0,0,0,0,0,0,17,0,15,10,17,17,17,3,10,7,0,1,19,9,11,11,0,0,9,6,11,0,0,11,0,6,17,0,0,0,17,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,17,0,10,10,17,17,17,0,10,0,0,2,0,9,11,0,0,0,9,0,11,0,0,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,12,0,0,0,0,9,12,0,0,0,0,0,12,0,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0,0,0,0,13,0,0,0,4,13,0,0,0,0,9,14,0,0,0,0,0,14,0,0,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,15,0,0,0,0,15,0,0,0,0,9,16,0,0,0,0,0,16,0,0,16,0,0,18,0,0,0,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18,0,0,0,18,18,18,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,10,0,0,0,0,9,11,0,0,0,0,0,11,0,0,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0,12,0,0,0,0,9,12,0,0,0,0,0,12,0,0,12,0,0,45,43,32,32,32,48,88,48,120,0,40,110,117,108,108,41,0,45,48,88,43,48,88,32,48,88,45,48,120,43,48,120,32,48,120,0,105,110,102,0,73,78,70,0,110,97,110,0,78,65,78,0,48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70,46,0,84,33,34,25,13,1,2,3,17,75,28,12,16,4,11,29,18,30,39,104,110,111,112,113,98,32,5,6,15,19,20,21,26,8,22,7,40,36,23,24,9,10,14,27,31,37,35,131,130,125,38,42,43,60,61,62,63,67,71,74,77,88,89,90,91,92,93,94,95,96,97,99,100,101,102,103,105,106,107,108,114,115,116,121,122,123,124,0,73,108,108,101,103,97,108,32,98,121,116,101,32,115,101,113,117,101,110,99,101,0,68,111,109,97,105,110,32,101,114,114,111,114,0,82,101,115,117,108,116,32,110,111,116,32,114,101,112,114,101,115,101,110,116,97,98,108,101,0,78,111,116,32,97,32,116,116,121,0,80,101,114,109,105,115,115,105,111,110,32,100,101,110,105,101,100,0,79,112,101,114,97,116,105,111,110,32,110,111,116,32,112,101,114,109,105,116,116,101,100,0,78,111,32,115,117,99,104,32,102,105,108,101,32,111,114,32,100,105,114,101,99,116,111,114,121,0,78,111,32,115,117,99,104,32,112,114,111,99,101,115,115,0,70,105,108,101,32,101,120,105,115,116,115,0,86,97,108,117,101,32,116,111,111,32,108,97,114,103,101,32,102,111,114,32,100,97,116,97,32,116,121,112,101,0,78,111,32,115,112,97,99,101,32,108,101,102,116,32,111,110,32,100,101,118,105,99,101,0,79,117,116,32,111,102,32,109,101,109,111,114,121,0,82,101,115,111,117,114,99,101,32,98,117,115,121,0,73,110,116,101,114,114,117,112,116,101,100,32,115,121,115,116,101,109,32,99,97,108,108,0,82,101,115,111,117,114,99,101,32,116,101,109,112,111,114,97,114,105,108,121,32,117,110,97,118,97,105,108,97,98,108,101,0,73,110,118,97,108,105,100,32,115,101,101,107,0,67,114,111,115,115,45,100,101,118,105,99,101,32,108,105,110,107,0,82,101,97,100,45,111,110,108,121,32,102,105,108,101,32,115,121,115,116,101,109,0,68,105,114,101,99,116,111,114,121,32,110,111,116,32,101,109,112,116,121,0,67,111,110,110,101,99,116,105,111,110,32,114,101,115,101,116,32,98,121,32,112,101,101,114,0,79,112,101,114,97,116,105,111,110,32,116,105,109,101,100,32,111,117,116,0,67,111,110,110,101,99,116,105,111,110,32,114,101,102,117,115,101,100,0,72,111,115,116,32,105,115,32,100,111,119,110,0,72,111,115,116,32,105,115,32,117,110,114,101,97,99,104,97,98,108,101,0,65,100,100,114,101,115,115,32,105,110,32,117,115,101,0,66,114,111,107,101,110,32,112,105,112,101,0,73,47,79,32,101,114,114,111,114,0,78,111,32,115,117,99,104,32,100,101,118,105,99,101,32,111,114,32,97,100,100,114,101,115,115,0,66,108,111,99,107,32,100,101,118,105,99,101,32,114,101,113,117,105,114,101,100,0,78,111,32,115,117,99,104,32,100,101,118,105,99,101,0,78,111,116,32,97,32,100,105,114,101,99,116,111,114,121,0,73,115,32,97,32,100,105,114,101,99,116,111,114,121,0,84,101,120,116,32,102,105,108,101,32,98,117,115,121,0,69,120,101,99,32,102,111,114,109,97,116,32,101,114,114,111,114,0,73,110,118,97,108,105,100,32,97,114,103,117,109,101,110,116,0,65,114,103,117,109,101,110,116,32,108,105,115,116,32,116,111,111,32,108,111,110,103,0,83,121,109,98,111,108,105,99,32,108,105,110,107,32,108,111,111,112,0,70,105,108,101,110,97,109,101,32,116,111,111,32,108,111,110,103,0,84,111,111,32,109,97,110,121,32,111,112,101,110,32,102,105,108,101,115,32,105,110,32,115,121,115,116,101,109,0,78,111,32,102,105,108,101,32,100,101,115,99,114,105,112,116,111,114,115,32,97,118,97,105,108,97,98,108,101,0,66,97,100,32,102,105,108,101,32,100,101,115,99,114,105,112,116,111,114,0,78,111,32,99,104,105,108,100,32,112,114,111,99,101,115,115,0,66,97,100,32,97,100,100,114,101,115,115,0,70,105,108,101,32,116,111,111,32,108,97,114,103,101,0,84,111,111,32,109,97,110,121,32,108,105,110,107,115,0,78,111,32,108,111,99,107,115,32,97,118,97,105,108,97,98,108,101,0,82,101,115,111,117,114,99,101,32,100,101,97,100,108,111,99,107,32,119,111,117,108,100,32,111,99,99,117,114,0,83,116,97,116,101,32,110,111,116,32,114,101,99,111,118,101,114,97,98,108,101,0,80,114,101,118,105,111,117,115,32,111,119,110,101,114,32,100,105,101,100,0,79,112,101,114,97,116,105,111,110,32,99,97,110,99,101,108,101,100,0,70,117,110,99,116,105,111,110,32,110,111,116,32,105,109,112,108,101,109,101,110,116,101,100,0,78,111,32,109,101,115,115,97,103,101,32,111,102,32,100,101,115,105,114,101,100,32,116,121,112,101,0,73,100,101,110,116,105,102,105,101,114,32,114,101,109,111,118,101,100,0,68,101,118,105,99,101,32,110,111,116,32,97,32,115,116,114,101,97,109,0,78,111,32,100,97,116,97,32,97,118,97,105,108,97,98,108,101,0,68,101,118,105,99,101,32,116,105,109,101,111,117,116,0,79,117,116,32,111,102,32,115,116,114,101,97,109,115,32,114,101,115,111,117,114,99,101,115,0,76,105,110,107,32,104,97,115,32,98,101,101,110,32,115,101,118,101,114,101,100,0,80,114,111,116,111,99,111,108,32,101,114,114,111,114,0,66,97,100,32,109,101,115,115,97,103,101,0,70,105,108,101,32,100,101,115,99,114,105,112,116,111,114,32,105,110,32,98,97,100,32,115,116,97,116,101,0,78,111,116,32,97,32,115,111,99,107,101,116,0,68,101,115,116,105,110,97,116,105,111,110,32,97,100,100,114,101,115,115,32,114,101,113,117,105,114,101,100,0,77,101,115,115,97,103,101,32,116,111,111,32,108,97,114,103,101,0,80,114,111,116,111,99,111,108,32,119,114,111,110,103,32,116,121,112,101,32,102,111,114,32,115,111,99,107,101,116,0,80,114,111,116,111,99,111,108,32,110,111,116,32,97,118,97,105,108,97,98,108,101,0,80,114,111,116,111,99,111,108,32,110,111,116,32,115,117,112,112,111,114,116,101,100,0,83,111,99,107,101,116,32,116,121,112,101,32,110,111,116,32,115,117,112,112,111,114,116,101,100,0,78,111,116,32,115,117,112,112,111,114,116,101,100,0,80,114,111,116,111,99,111,108,32,102,97,109,105,108,121,32,110,111,116,32,115,117,112,112,111,114,116,101,100,0,65,100,100,114,101,115,115,32,102,97,109,105,108,121,32,110,111,116,32,115,117,112,112,111,114,116,101,100,32,98,121,32,112,114,111,116,111,99,111,108,0,65,100,100,114,101,115,115,32,110,111,116,32,97,118,97,105,108,97,98,108,101,0,78,101,116,119,111,114,107,32,105,115,32,100,111,119,110,0,78,101,116,119,111,114,107,32,117,110,114,101,97,99,104,97,98,108,101,0,67,111,110,110,101,99,116,105,111,110,32,114,101,115,101,116,32,98,121,32,110,101,116,119,111,114,107,0,67,111,110,110,101,99,116,105,111,110,32,97,98,111,114,116,101,100,0,78,111,32,98,117,102,102,101,114,32,115,112,97,99,101,32,97,118,97,105,108,97,98,108,101,0,83,111,99,107,101,116,32,105,115,32,99,111,110,110,101,99,116,101,100,0,83,111,99,107,101,116,32,110,111,116,32,99,111,110,110,101,99,116,101,100,0,67,97,110,110,111,116,32,115,101,110,100,32,97,102,116,101,114,32,115,111,99,107,101,116,32,115,104,117,116,100,111,119,110,0,79,112,101,114,97,116,105,111,110,32,97,108,114,101,97,100,121,32,105,110,32,112,114,111,103,114,101,115,115,0,79,112,101,114,97,116,105,111,110,32,105,110,32,112,114,111,103,114,101,115,115,0,83,116,97,108,101,32,102,105,108,101,32,104,97,110,100,108,101,0,82,101,109,111,116,101,32,73,47,79,32,101,114,114,111,114,0,81,117,111,116,97,32,101,120,99,101,101,100,101,100,0,78,111,32,109,101,100,105,117,109,32,102,111,117,110,100,0,87,114,111,110,103,32,109,101,100,105,117,109,32,116,121,112,101,0,78,111,32,101,114,114,111,114,32,105,110,102,111,114,109,97,116,105,111,110,0,0,114,119,97,0], "i8", ALLOC_NONE, Runtime.GLOBAL_BASE);





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


   

   

  function ___libc_current_sigrtmin() {
      Module.printErr('Calling stub instead of __libc_current_sigrtmin');
      return 0;
    }

  function ___libc_current_sigrtmax() {
      Module.printErr('Calling stub instead of __libc_current_sigrtmax');
      return 0;
    }

   

   

   

  
  
  
  var ERRNO_CODES={EPERM:1,ENOENT:2,ESRCH:3,EINTR:4,EIO:5,ENXIO:6,E2BIG:7,ENOEXEC:8,EBADF:9,ECHILD:10,EAGAIN:11,EWOULDBLOCK:11,ENOMEM:12,EACCES:13,EFAULT:14,ENOTBLK:15,EBUSY:16,EEXIST:17,EXDEV:18,ENODEV:19,ENOTDIR:20,EISDIR:21,EINVAL:22,ENFILE:23,EMFILE:24,ENOTTY:25,ETXTBSY:26,EFBIG:27,ENOSPC:28,ESPIPE:29,EROFS:30,EMLINK:31,EPIPE:32,EDOM:33,ERANGE:34,ENOMSG:42,EIDRM:43,ECHRNG:44,EL2NSYNC:45,EL3HLT:46,EL3RST:47,ELNRNG:48,EUNATCH:49,ENOCSI:50,EL2HLT:51,EDEADLK:35,ENOLCK:37,EBADE:52,EBADR:53,EXFULL:54,ENOANO:55,EBADRQC:56,EBADSLT:57,EDEADLOCK:35,EBFONT:59,ENOSTR:60,ENODATA:61,ETIME:62,ENOSR:63,ENONET:64,ENOPKG:65,EREMOTE:66,ENOLINK:67,EADV:68,ESRMNT:69,ECOMM:70,EPROTO:71,EMULTIHOP:72,EDOTDOT:73,EBADMSG:74,ENOTUNIQ:76,EBADFD:77,EREMCHG:78,ELIBACC:79,ELIBBAD:80,ELIBSCN:81,ELIBMAX:82,ELIBEXEC:83,ENOSYS:38,ENOTEMPTY:39,ENAMETOOLONG:36,ELOOP:40,EOPNOTSUPP:95,EPFNOSUPPORT:96,ECONNRESET:104,ENOBUFS:105,EAFNOSUPPORT:97,EPROTOTYPE:91,ENOTSOCK:88,ENOPROTOOPT:92,ESHUTDOWN:108,ECONNREFUSED:111,EADDRINUSE:98,ECONNABORTED:103,ENETUNREACH:101,ENETDOWN:100,ETIMEDOUT:110,EHOSTDOWN:112,EHOSTUNREACH:113,EINPROGRESS:115,EALREADY:114,EDESTADDRREQ:89,EMSGSIZE:90,EPROTONOSUPPORT:93,ESOCKTNOSUPPORT:94,EADDRNOTAVAIL:99,ENETRESET:102,EISCONN:106,ENOTCONN:107,ETOOMANYREFS:109,EUSERS:87,EDQUOT:122,ESTALE:116,ENOTSUP:95,ENOMEDIUM:123,EILSEQ:84,EOVERFLOW:75,ECANCELED:125,ENOTRECOVERABLE:131,EOWNERDEAD:130,ESTRPIPE:86};
  
  var ERRNO_MESSAGES={0:"Success",1:"Not super-user",2:"No such file or directory",3:"No such process",4:"Interrupted system call",5:"I/O error",6:"No such device or address",7:"Arg list too long",8:"Exec format error",9:"Bad file number",10:"No children",11:"No more processes",12:"Not enough core",13:"Permission denied",14:"Bad address",15:"Block device required",16:"Mount device busy",17:"File exists",18:"Cross-device link",19:"No such device",20:"Not a directory",21:"Is a directory",22:"Invalid argument",23:"Too many open files in system",24:"Too many open files",25:"Not a typewriter",26:"Text file busy",27:"File too large",28:"No space left on device",29:"Illegal seek",30:"Read only file system",31:"Too many links",32:"Broken pipe",33:"Math arg out of domain of func",34:"Math result not representable",35:"File locking deadlock error",36:"File or path name too long",37:"No record locks available",38:"Function not implemented",39:"Directory not empty",40:"Too many symbolic links",42:"No message of desired type",43:"Identifier removed",44:"Channel number out of range",45:"Level 2 not synchronized",46:"Level 3 halted",47:"Level 3 reset",48:"Link number out of range",49:"Protocol driver not attached",50:"No CSI structure available",51:"Level 2 halted",52:"Invalid exchange",53:"Invalid request descriptor",54:"Exchange full",55:"No anode",56:"Invalid request code",57:"Invalid slot",59:"Bad font file fmt",60:"Device not a stream",61:"No data (for no delay io)",62:"Timer expired",63:"Out of streams resources",64:"Machine is not on the network",65:"Package not installed",66:"The object is remote",67:"The link has been severed",68:"Advertise error",69:"Srmount error",70:"Communication error on send",71:"Protocol error",72:"Multihop attempted",73:"Cross mount point (not really error)",74:"Trying to read unreadable message",75:"Value too large for defined data type",76:"Given log. name not unique",77:"f.d. invalid for this operation",78:"Remote address changed",79:"Can   access a needed shared lib",80:"Accessing a corrupted shared lib",81:".lib section in a.out corrupted",82:"Attempting to link in too many libs",83:"Attempting to exec a shared library",84:"Illegal byte sequence",86:"Streams pipe error",87:"Too many users",88:"Socket operation on non-socket",89:"Destination address required",90:"Message too long",91:"Protocol wrong type for socket",92:"Protocol not available",93:"Unknown protocol",94:"Socket type not supported",95:"Not supported",96:"Protocol family not supported",97:"Address family not supported by protocol family",98:"Address already in use",99:"Address not available",100:"Network interface is not configured",101:"Network is unreachable",102:"Connection reset by network",103:"Connection aborted",104:"Connection reset by peer",105:"No buffer space available",106:"Socket is already connected",107:"Socket is not connected",108:"Can't send after socket shutdown",109:"Too many references",110:"Connection timed out",111:"Connection refused",112:"Host is down",113:"Host is unreachable",114:"Socket already connected",115:"Connection already in progress",116:"Stale file handle",122:"Quota exceeded",123:"No medium (in tape drive)",125:"Operation canceled",130:"Previous owner died",131:"State not recoverable"};
  
  function ___setErrNo(value) {
      if (Module['___errno_location']) HEAP32[((Module['___errno_location']())>>2)]=value;
      else Module.printErr('failed to set errno from JS');
      return value;
    }
  
  var PATH={splitPath:function (filename) {
        var splitPathRe = /^(\/?|)([\s\S]*?)((?:\.{1,2}|[^\/]+?|)(\.[^.\/]*|))(?:[\/]*)$/;
        return splitPathRe.exec(filename).slice(1);
      },normalizeArray:function (parts, allowAboveRoot) {
        // if the path tries to go above the root, `up` ends up > 0
        var up = 0;
        for (var i = parts.length - 1; i >= 0; i--) {
          var last = parts[i];
          if (last === '.') {
            parts.splice(i, 1);
          } else if (last === '..') {
            parts.splice(i, 1);
            up++;
          } else if (up) {
            parts.splice(i, 1);
            up--;
          }
        }
        // if the path is allowed to go above the root, restore leading ..s
        if (allowAboveRoot) {
          for (; up; up--) {
            parts.unshift('..');
          }
        }
        return parts;
      },normalize:function (path) {
        var isAbsolute = path.charAt(0) === '/',
            trailingSlash = path.substr(-1) === '/';
        // Normalize the path
        path = PATH.normalizeArray(path.split('/').filter(function(p) {
          return !!p;
        }), !isAbsolute).join('/');
        if (!path && !isAbsolute) {
          path = '.';
        }
        if (path && trailingSlash) {
          path += '/';
        }
        return (isAbsolute ? '/' : '') + path;
      },dirname:function (path) {
        var result = PATH.splitPath(path),
            root = result[0],
            dir = result[1];
        if (!root && !dir) {
          // No dirname whatsoever
          return '.';
        }
        if (dir) {
          // It has a dirname, strip trailing slash
          dir = dir.substr(0, dir.length - 1);
        }
        return root + dir;
      },basename:function (path) {
        // EMSCRIPTEN return '/'' for '/', not an empty string
        if (path === '/') return '/';
        var lastSlash = path.lastIndexOf('/');
        if (lastSlash === -1) return path;
        return path.substr(lastSlash+1);
      },extname:function (path) {
        return PATH.splitPath(path)[3];
      },join:function () {
        var paths = Array.prototype.slice.call(arguments, 0);
        return PATH.normalize(paths.join('/'));
      },join2:function (l, r) {
        return PATH.normalize(l + '/' + r);
      },resolve:function () {
        var resolvedPath = '',
          resolvedAbsolute = false;
        for (var i = arguments.length - 1; i >= -1 && !resolvedAbsolute; i--) {
          var path = (i >= 0) ? arguments[i] : FS.cwd();
          // Skip empty and invalid entries
          if (typeof path !== 'string') {
            throw new TypeError('Arguments to path.resolve must be strings');
          } else if (!path) {
            return ''; // an invalid portion invalidates the whole thing
          }
          resolvedPath = path + '/' + resolvedPath;
          resolvedAbsolute = path.charAt(0) === '/';
        }
        // At this point the path should be resolved to a full absolute path, but
        // handle relative paths to be safe (might happen when process.cwd() fails)
        resolvedPath = PATH.normalizeArray(resolvedPath.split('/').filter(function(p) {
          return !!p;
        }), !resolvedAbsolute).join('/');
        return ((resolvedAbsolute ? '/' : '') + resolvedPath) || '.';
      },relative:function (from, to) {
        from = PATH.resolve(from).substr(1);
        to = PATH.resolve(to).substr(1);
        function trim(arr) {
          var start = 0;
          for (; start < arr.length; start++) {
            if (arr[start] !== '') break;
          }
          var end = arr.length - 1;
          for (; end >= 0; end--) {
            if (arr[end] !== '') break;
          }
          if (start > end) return [];
          return arr.slice(start, end - start + 1);
        }
        var fromParts = trim(from.split('/'));
        var toParts = trim(to.split('/'));
        var length = Math.min(fromParts.length, toParts.length);
        var samePartsLength = length;
        for (var i = 0; i < length; i++) {
          if (fromParts[i] !== toParts[i]) {
            samePartsLength = i;
            break;
          }
        }
        var outputParts = [];
        for (var i = samePartsLength; i < fromParts.length; i++) {
          outputParts.push('..');
        }
        outputParts = outputParts.concat(toParts.slice(samePartsLength));
        return outputParts.join('/');
      }};
  
  var TTY={ttys:[],init:function () {
        // https://github.com/kripken/emscripten/pull/1555
        // if (ENVIRONMENT_IS_NODE) {
        //   // currently, FS.init does not distinguish if process.stdin is a file or TTY
        //   // device, it always assumes it's a TTY device. because of this, we're forcing
        //   // process.stdin to UTF8 encoding to at least make stdin reading compatible
        //   // with text files until FS.init can be refactored.
        //   process['stdin']['setEncoding']('utf8');
        // }
      },shutdown:function () {
        // https://github.com/kripken/emscripten/pull/1555
        // if (ENVIRONMENT_IS_NODE) {
        //   // inolen: any idea as to why node -e 'process.stdin.read()' wouldn't exit immediately (with process.stdin being a tty)?
        //   // isaacs: because now it's reading from the stream, you've expressed interest in it, so that read() kicks off a _read() which creates a ReadReq operation
        //   // inolen: I thought read() in that case was a synchronous operation that just grabbed some amount of buffered data if it exists?
        //   // isaacs: it is. but it also triggers a _read() call, which calls readStart() on the handle
        //   // isaacs: do process.stdin.pause() and i'd think it'd probably close the pending call
        //   process['stdin']['pause']();
        // }
      },register:function (dev, ops) {
        TTY.ttys[dev] = { input: [], output: [], ops: ops };
        FS.registerDevice(dev, TTY.stream_ops);
      },stream_ops:{open:function (stream) {
          var tty = TTY.ttys[stream.node.rdev];
          if (!tty) {
            throw new FS.ErrnoError(ERRNO_CODES.ENODEV);
          }
          stream.tty = tty;
          stream.seekable = false;
        },close:function (stream) {
          // flush any pending line data
          stream.tty.ops.flush(stream.tty);
        },flush:function (stream) {
          stream.tty.ops.flush(stream.tty);
        },read:function (stream, buffer, offset, length, pos /* ignored */) {
          if (!stream.tty || !stream.tty.ops.get_char) {
            throw new FS.ErrnoError(ERRNO_CODES.ENXIO);
          }
          var bytesRead = 0;
          for (var i = 0; i < length; i++) {
            var result;
            try {
              result = stream.tty.ops.get_char(stream.tty);
            } catch (e) {
              throw new FS.ErrnoError(ERRNO_CODES.EIO);
            }
            if (result === undefined && bytesRead === 0) {
              throw new FS.ErrnoError(ERRNO_CODES.EAGAIN);
            }
            if (result === null || result === undefined) break;
            bytesRead++;
            buffer[offset+i] = result;
          }
          if (bytesRead) {
            stream.node.timestamp = Date.now();
          }
          return bytesRead;
        },write:function (stream, buffer, offset, length, pos) {
          if (!stream.tty || !stream.tty.ops.put_char) {
            throw new FS.ErrnoError(ERRNO_CODES.ENXIO);
          }
          for (var i = 0; i < length; i++) {
            try {
              stream.tty.ops.put_char(stream.tty, buffer[offset+i]);
            } catch (e) {
              throw new FS.ErrnoError(ERRNO_CODES.EIO);
            }
          }
          if (length) {
            stream.node.timestamp = Date.now();
          }
          return i;
        }},default_tty_ops:{get_char:function (tty) {
          if (!tty.input.length) {
            var result = null;
            if (ENVIRONMENT_IS_NODE) {
              // we will read data by chunks of BUFSIZE
              var BUFSIZE = 256;
              var buf = new Buffer(BUFSIZE);
              var bytesRead = 0;
  
              var isPosixPlatform = (process.platform != 'win32'); // Node doesn't offer a direct check, so test by exclusion
  
              var fd = process.stdin.fd;
              if (isPosixPlatform) {
                // Linux and Mac cannot use process.stdin.fd (which isn't set up as sync)
                var usingDevice = false;
                try {
                  fd = fs.openSync('/dev/stdin', 'r');
                  usingDevice = true;
                } catch (e) {}
              }
  
              try {
                bytesRead = fs.readSync(fd, buf, 0, BUFSIZE, null);
              } catch(e) {
                // Cross-platform differences: on Windows, reading EOF throws an exception, but on other OSes,
                // reading EOF returns 0. Uniformize behavior by treating the EOF exception to return 0.
                if (e.toString().indexOf('EOF') != -1) bytesRead = 0;
                else throw e;
              }
  
              if (usingDevice) { fs.closeSync(fd); }
              if (bytesRead > 0) {
                result = buf.slice(0, bytesRead).toString('utf-8');
              } else {
                result = null;
              }
  
            } else if (typeof window != 'undefined' &&
              typeof window.prompt == 'function') {
              // Browser.
              result = window.prompt('Input: ');  // returns null on cancel
              if (result !== null) {
                result += '\n';
              }
            } else if (typeof readline == 'function') {
              // Command line.
              result = readline();
              if (result !== null) {
                result += '\n';
              }
            }
            if (!result) {
              return null;
            }
            tty.input = intArrayFromString(result, true);
          }
          return tty.input.shift();
        },put_char:function (tty, val) {
          if (val === null || val === 10) {
            Module['print'](UTF8ArrayToString(tty.output, 0));
            tty.output = [];
          } else {
            if (val != 0) tty.output.push(val); // val == 0 would cut text output off in the middle.
          }
        },flush:function (tty) {
          if (tty.output && tty.output.length > 0) {
            Module['print'](UTF8ArrayToString(tty.output, 0));
            tty.output = [];
          }
        }},default_tty1_ops:{put_char:function (tty, val) {
          if (val === null || val === 10) {
            Module['printErr'](UTF8ArrayToString(tty.output, 0));
            tty.output = [];
          } else {
            if (val != 0) tty.output.push(val);
          }
        },flush:function (tty) {
          if (tty.output && tty.output.length > 0) {
            Module['printErr'](UTF8ArrayToString(tty.output, 0));
            tty.output = [];
          }
        }}};
  
  var MEMFS={ops_table:null,mount:function (mount) {
        return MEMFS.createNode(null, '/', 16384 | 511 /* 0777 */, 0);
      },createNode:function (parent, name, mode, dev) {
        if (FS.isBlkdev(mode) || FS.isFIFO(mode)) {
          // no supported
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        if (!MEMFS.ops_table) {
          MEMFS.ops_table = {
            dir: {
              node: {
                getattr: MEMFS.node_ops.getattr,
                setattr: MEMFS.node_ops.setattr,
                lookup: MEMFS.node_ops.lookup,
                mknod: MEMFS.node_ops.mknod,
                rename: MEMFS.node_ops.rename,
                unlink: MEMFS.node_ops.unlink,
                rmdir: MEMFS.node_ops.rmdir,
                readdir: MEMFS.node_ops.readdir,
                symlink: MEMFS.node_ops.symlink
              },
              stream: {
                llseek: MEMFS.stream_ops.llseek
              }
            },
            file: {
              node: {
                getattr: MEMFS.node_ops.getattr,
                setattr: MEMFS.node_ops.setattr
              },
              stream: {
                llseek: MEMFS.stream_ops.llseek,
                read: MEMFS.stream_ops.read,
                write: MEMFS.stream_ops.write,
                allocate: MEMFS.stream_ops.allocate,
                mmap: MEMFS.stream_ops.mmap,
                msync: MEMFS.stream_ops.msync
              }
            },
            link: {
              node: {
                getattr: MEMFS.node_ops.getattr,
                setattr: MEMFS.node_ops.setattr,
                readlink: MEMFS.node_ops.readlink
              },
              stream: {}
            },
            chrdev: {
              node: {
                getattr: MEMFS.node_ops.getattr,
                setattr: MEMFS.node_ops.setattr
              },
              stream: FS.chrdev_stream_ops
            }
          };
        }
        var node = FS.createNode(parent, name, mode, dev);
        if (FS.isDir(node.mode)) {
          node.node_ops = MEMFS.ops_table.dir.node;
          node.stream_ops = MEMFS.ops_table.dir.stream;
          node.contents = {};
        } else if (FS.isFile(node.mode)) {
          node.node_ops = MEMFS.ops_table.file.node;
          node.stream_ops = MEMFS.ops_table.file.stream;
          node.usedBytes = 0; // The actual number of bytes used in the typed array, as opposed to contents.length which gives the whole capacity.
          // When the byte data of the file is populated, this will point to either a typed array, or a normal JS array. Typed arrays are preferred
          // for performance, and used by default. However, typed arrays are not resizable like normal JS arrays are, so there is a small disk size
          // penalty involved for appending file writes that continuously grow a file similar to std::vector capacity vs used -scheme.
          node.contents = null; 
        } else if (FS.isLink(node.mode)) {
          node.node_ops = MEMFS.ops_table.link.node;
          node.stream_ops = MEMFS.ops_table.link.stream;
        } else if (FS.isChrdev(node.mode)) {
          node.node_ops = MEMFS.ops_table.chrdev.node;
          node.stream_ops = MEMFS.ops_table.chrdev.stream;
        }
        node.timestamp = Date.now();
        // add the new node to the parent
        if (parent) {
          parent.contents[name] = node;
        }
        return node;
      },getFileDataAsRegularArray:function (node) {
        if (node.contents && node.contents.subarray) {
          var arr = [];
          for (var i = 0; i < node.usedBytes; ++i) arr.push(node.contents[i]);
          return arr; // Returns a copy of the original data.
        }
        return node.contents; // No-op, the file contents are already in a JS array. Return as-is.
      },getFileDataAsTypedArray:function (node) {
        if (!node.contents) return new Uint8Array;
        if (node.contents.subarray) return node.contents.subarray(0, node.usedBytes); // Make sure to not return excess unused bytes.
        return new Uint8Array(node.contents);
      },expandFileStorage:function (node, newCapacity) {
        // If we are asked to expand the size of a file that already exists, revert to using a standard JS array to store the file
        // instead of a typed array. This makes resizing the array more flexible because we can just .push() elements at the back to
        // increase the size.
        if (node.contents && node.contents.subarray && newCapacity > node.contents.length) {
          node.contents = MEMFS.getFileDataAsRegularArray(node);
          node.usedBytes = node.contents.length; // We might be writing to a lazy-loaded file which had overridden this property, so force-reset it.
        }
  
        if (!node.contents || node.contents.subarray) { // Keep using a typed array if creating a new storage, or if old one was a typed array as well.
          var prevCapacity = node.contents ? node.contents.length : 0;
          if (prevCapacity >= newCapacity) return; // No need to expand, the storage was already large enough.
          // Don't expand strictly to the given requested limit if it's only a very small increase, but instead geometrically grow capacity.
          // For small filesizes (<1MB), perform size*2 geometric increase, but for large sizes, do a much more conservative size*1.125 increase to
          // avoid overshooting the allocation cap by a very large margin.
          var CAPACITY_DOUBLING_MAX = 1024 * 1024;
          newCapacity = Math.max(newCapacity, (prevCapacity * (prevCapacity < CAPACITY_DOUBLING_MAX ? 2.0 : 1.125)) | 0);
          if (prevCapacity != 0) newCapacity = Math.max(newCapacity, 256); // At minimum allocate 256b for each file when expanding.
          var oldContents = node.contents;
          node.contents = new Uint8Array(newCapacity); // Allocate new storage.
          if (node.usedBytes > 0) node.contents.set(oldContents.subarray(0, node.usedBytes), 0); // Copy old data over to the new storage.
          return;
        }
        // Not using a typed array to back the file storage. Use a standard JS array instead.
        if (!node.contents && newCapacity > 0) node.contents = [];
        while (node.contents.length < newCapacity) node.contents.push(0);
      },resizeFileStorage:function (node, newSize) {
        if (node.usedBytes == newSize) return;
        if (newSize == 0) {
          node.contents = null; // Fully decommit when requesting a resize to zero.
          node.usedBytes = 0;
          return;
        }
        if (!node.contents || node.contents.subarray) { // Resize a typed array if that is being used as the backing store.
          var oldContents = node.contents;
          node.contents = new Uint8Array(new ArrayBuffer(newSize)); // Allocate new storage.
          if (oldContents) {
            node.contents.set(oldContents.subarray(0, Math.min(newSize, node.usedBytes))); // Copy old data over to the new storage.
          }
          node.usedBytes = newSize;
          return;
        }
        // Backing with a JS array.
        if (!node.contents) node.contents = [];
        if (node.contents.length > newSize) node.contents.length = newSize;
        else while (node.contents.length < newSize) node.contents.push(0);
        node.usedBytes = newSize;
      },node_ops:{getattr:function (node) {
          var attr = {};
          // device numbers reuse inode numbers.
          attr.dev = FS.isChrdev(node.mode) ? node.id : 1;
          attr.ino = node.id;
          attr.mode = node.mode;
          attr.nlink = 1;
          attr.uid = 0;
          attr.gid = 0;
          attr.rdev = node.rdev;
          if (FS.isDir(node.mode)) {
            attr.size = 4096;
          } else if (FS.isFile(node.mode)) {
            attr.size = node.usedBytes;
          } else if (FS.isLink(node.mode)) {
            attr.size = node.link.length;
          } else {
            attr.size = 0;
          }
          attr.atime = new Date(node.timestamp);
          attr.mtime = new Date(node.timestamp);
          attr.ctime = new Date(node.timestamp);
          // NOTE: In our implementation, st_blocks = Math.ceil(st_size/st_blksize),
          //       but this is not required by the standard.
          attr.blksize = 4096;
          attr.blocks = Math.ceil(attr.size / attr.blksize);
          return attr;
        },setattr:function (node, attr) {
          if (attr.mode !== undefined) {
            node.mode = attr.mode;
          }
          if (attr.timestamp !== undefined) {
            node.timestamp = attr.timestamp;
          }
          if (attr.size !== undefined) {
            MEMFS.resizeFileStorage(node, attr.size);
          }
        },lookup:function (parent, name) {
          throw FS.genericErrors[ERRNO_CODES.ENOENT];
        },mknod:function (parent, name, mode, dev) {
          return MEMFS.createNode(parent, name, mode, dev);
        },rename:function (old_node, new_dir, new_name) {
          // if we're overwriting a directory at new_name, make sure it's empty.
          if (FS.isDir(old_node.mode)) {
            var new_node;
            try {
              new_node = FS.lookupNode(new_dir, new_name);
            } catch (e) {
            }
            if (new_node) {
              for (var i in new_node.contents) {
                throw new FS.ErrnoError(ERRNO_CODES.ENOTEMPTY);
              }
            }
          }
          // do the internal rewiring
          delete old_node.parent.contents[old_node.name];
          old_node.name = new_name;
          new_dir.contents[new_name] = old_node;
          old_node.parent = new_dir;
        },unlink:function (parent, name) {
          delete parent.contents[name];
        },rmdir:function (parent, name) {
          var node = FS.lookupNode(parent, name);
          for (var i in node.contents) {
            throw new FS.ErrnoError(ERRNO_CODES.ENOTEMPTY);
          }
          delete parent.contents[name];
        },readdir:function (node) {
          var entries = ['.', '..']
          for (var key in node.contents) {
            if (!node.contents.hasOwnProperty(key)) {
              continue;
            }
            entries.push(key);
          }
          return entries;
        },symlink:function (parent, newname, oldpath) {
          var node = MEMFS.createNode(parent, newname, 511 /* 0777 */ | 40960, 0);
          node.link = oldpath;
          return node;
        },readlink:function (node) {
          if (!FS.isLink(node.mode)) {
            throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
          }
          return node.link;
        }},stream_ops:{read:function (stream, buffer, offset, length, position) {
          var contents = stream.node.contents;
          if (position >= stream.node.usedBytes) return 0;
          var size = Math.min(stream.node.usedBytes - position, length);
          assert(size >= 0);
          if (size > 8 && contents.subarray) { // non-trivial, and typed array
            buffer.set(contents.subarray(position, position + size), offset);
          } else {
            for (var i = 0; i < size; i++) buffer[offset + i] = contents[position + i];
          }
          return size;
        },write:function (stream, buffer, offset, length, position, canOwn) {
          if (!length) return 0;
          var node = stream.node;
          node.timestamp = Date.now();
  
          if (buffer.subarray && (!node.contents || node.contents.subarray)) { // This write is from a typed array to a typed array?
            if (canOwn) {
              assert(position === 0, 'canOwn must imply no weird position inside the file');
              node.contents = buffer.subarray(offset, offset + length);
              node.usedBytes = length;
              return length;
            } else if (node.usedBytes === 0 && position === 0) { // If this is a simple first write to an empty file, do a fast set since we don't need to care about old data.
              node.contents = new Uint8Array(buffer.subarray(offset, offset + length));
              node.usedBytes = length;
              return length;
            } else if (position + length <= node.usedBytes) { // Writing to an already allocated and used subrange of the file?
              node.contents.set(buffer.subarray(offset, offset + length), position);
              return length;
            }
          }
  
          // Appending to an existing file and we need to reallocate, or source data did not come as a typed array.
          MEMFS.expandFileStorage(node, position+length);
          if (node.contents.subarray && buffer.subarray) node.contents.set(buffer.subarray(offset, offset + length), position); // Use typed array write if available.
          else {
            for (var i = 0; i < length; i++) {
             node.contents[position + i] = buffer[offset + i]; // Or fall back to manual write if not.
            }
          }
          node.usedBytes = Math.max(node.usedBytes, position+length);
          return length;
        },llseek:function (stream, offset, whence) {
          var position = offset;
          if (whence === 1) {  // SEEK_CUR.
            position += stream.position;
          } else if (whence === 2) {  // SEEK_END.
            if (FS.isFile(stream.node.mode)) {
              position += stream.node.usedBytes;
            }
          }
          if (position < 0) {
            throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
          }
          return position;
        },allocate:function (stream, offset, length) {
          MEMFS.expandFileStorage(stream.node, offset + length);
          stream.node.usedBytes = Math.max(stream.node.usedBytes, offset + length);
        },mmap:function (stream, buffer, offset, length, position, prot, flags) {
          if (!FS.isFile(stream.node.mode)) {
            throw new FS.ErrnoError(ERRNO_CODES.ENODEV);
          }
          var ptr;
          var allocated;
          var contents = stream.node.contents;
          // Only make a new copy when MAP_PRIVATE is specified.
          if ( !(flags & 2) &&
                (contents.buffer === buffer || contents.buffer === buffer.buffer) ) {
            // We can't emulate MAP_SHARED when the file is not backed by the buffer
            // we're mapping to (e.g. the HEAP buffer).
            allocated = false;
            ptr = contents.byteOffset;
          } else {
            // Try to avoid unnecessary slices.
            if (position > 0 || position + length < stream.node.usedBytes) {
              if (contents.subarray) {
                contents = contents.subarray(position, position + length);
              } else {
                contents = Array.prototype.slice.call(contents, position, position + length);
              }
            }
            allocated = true;
            ptr = _malloc(length);
            if (!ptr) {
              throw new FS.ErrnoError(ERRNO_CODES.ENOMEM);
            }
            buffer.set(contents, ptr);
          }
          return { ptr: ptr, allocated: allocated };
        },msync:function (stream, buffer, offset, length, mmapFlags) {
          if (!FS.isFile(stream.node.mode)) {
            throw new FS.ErrnoError(ERRNO_CODES.ENODEV);
          }
          if (mmapFlags & 2) {
            // MAP_PRIVATE calls need not to be synced back to underlying fs
            return 0;
          }
  
          var bytesWritten = MEMFS.stream_ops.write(stream, buffer, 0, length, offset, false);
          // should we check if bytesWritten and length are the same?
          return 0;
        }}};
  
  var IDBFS={dbs:{},indexedDB:function () {
        if (typeof indexedDB !== 'undefined') return indexedDB;
        var ret = null;
        if (typeof window === 'object') ret = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB;
        assert(ret, 'IDBFS used, but indexedDB not supported');
        return ret;
      },DB_VERSION:21,DB_STORE_NAME:"FILE_DATA",mount:function (mount) {
        // reuse all of the core MEMFS functionality
        return MEMFS.mount.apply(null, arguments);
      },syncfs:function (mount, populate, callback) {
        IDBFS.getLocalSet(mount, function(err, local) {
          if (err) return callback(err);
  
          IDBFS.getRemoteSet(mount, function(err, remote) {
            if (err) return callback(err);
  
            var src = populate ? remote : local;
            var dst = populate ? local : remote;
  
            IDBFS.reconcile(src, dst, callback);
          });
        });
      },getDB:function (name, callback) {
        // check the cache first
        var db = IDBFS.dbs[name];
        if (db) {
          return callback(null, db);
        }
  
        var req;
        try {
          req = IDBFS.indexedDB().open(name, IDBFS.DB_VERSION);
        } catch (e) {
          return callback(e);
        }
        if (!req) {
          return callback("Unable to connect to IndexedDB");
        }
        req.onupgradeneeded = function(e) {
          var db = e.target.result;
          var transaction = e.target.transaction;
  
          var fileStore;
  
          if (db.objectStoreNames.contains(IDBFS.DB_STORE_NAME)) {
            fileStore = transaction.objectStore(IDBFS.DB_STORE_NAME);
          } else {
            fileStore = db.createObjectStore(IDBFS.DB_STORE_NAME);
          }
  
          if (!fileStore.indexNames.contains('timestamp')) {
            fileStore.createIndex('timestamp', 'timestamp', { unique: false });
          }
        };
        req.onsuccess = function() {
          db = req.result;
  
          // add to the cache
          IDBFS.dbs[name] = db;
          callback(null, db);
        };
        req.onerror = function(e) {
          callback(this.error);
          e.preventDefault();
        };
      },getLocalSet:function (mount, callback) {
        var entries = {};
  
        function isRealDir(p) {
          return p !== '.' && p !== '..';
        };
        function toAbsolute(root) {
          return function(p) {
            return PATH.join2(root, p);
          }
        };
  
        var check = FS.readdir(mount.mountpoint).filter(isRealDir).map(toAbsolute(mount.mountpoint));
  
        while (check.length) {
          var path = check.pop();
          var stat;
  
          try {
            stat = FS.stat(path);
          } catch (e) {
            return callback(e);
          }
  
          if (FS.isDir(stat.mode)) {
            check.push.apply(check, FS.readdir(path).filter(isRealDir).map(toAbsolute(path)));
          }
  
          entries[path] = { timestamp: stat.mtime };
        }
  
        return callback(null, { type: 'local', entries: entries });
      },getRemoteSet:function (mount, callback) {
        var entries = {};
  
        IDBFS.getDB(mount.mountpoint, function(err, db) {
          if (err) return callback(err);
  
          var transaction = db.transaction([IDBFS.DB_STORE_NAME], 'readonly');
          transaction.onerror = function(e) {
            callback(this.error);
            e.preventDefault();
          };
  
          var store = transaction.objectStore(IDBFS.DB_STORE_NAME);
          var index = store.index('timestamp');
  
          index.openKeyCursor().onsuccess = function(event) {
            var cursor = event.target.result;
  
            if (!cursor) {
              return callback(null, { type: 'remote', db: db, entries: entries });
            }
  
            entries[cursor.primaryKey] = { timestamp: cursor.key };
  
            cursor.continue();
          };
        });
      },loadLocalEntry:function (path, callback) {
        var stat, node;
  
        try {
          var lookup = FS.lookupPath(path);
          node = lookup.node;
          stat = FS.stat(path);
        } catch (e) {
          return callback(e);
        }
  
        if (FS.isDir(stat.mode)) {
          return callback(null, { timestamp: stat.mtime, mode: stat.mode });
        } else if (FS.isFile(stat.mode)) {
          // Performance consideration: storing a normal JavaScript array to a IndexedDB is much slower than storing a typed array.
          // Therefore always convert the file contents to a typed array first before writing the data to IndexedDB.
          node.contents = MEMFS.getFileDataAsTypedArray(node);
          return callback(null, { timestamp: stat.mtime, mode: stat.mode, contents: node.contents });
        } else {
          return callback(new Error('node type not supported'));
        }
      },storeLocalEntry:function (path, entry, callback) {
        try {
          if (FS.isDir(entry.mode)) {
            FS.mkdir(path, entry.mode);
          } else if (FS.isFile(entry.mode)) {
            FS.writeFile(path, entry.contents, { encoding: 'binary', canOwn: true });
          } else {
            return callback(new Error('node type not supported'));
          }
  
          FS.chmod(path, entry.mode);
          FS.utime(path, entry.timestamp, entry.timestamp);
        } catch (e) {
          return callback(e);
        }
  
        callback(null);
      },removeLocalEntry:function (path, callback) {
        try {
          var lookup = FS.lookupPath(path);
          var stat = FS.stat(path);
  
          if (FS.isDir(stat.mode)) {
            FS.rmdir(path);
          } else if (FS.isFile(stat.mode)) {
            FS.unlink(path);
          }
        } catch (e) {
          return callback(e);
        }
  
        callback(null);
      },loadRemoteEntry:function (store, path, callback) {
        var req = store.get(path);
        req.onsuccess = function(event) { callback(null, event.target.result); };
        req.onerror = function(e) {
          callback(this.error);
          e.preventDefault();
        };
      },storeRemoteEntry:function (store, path, entry, callback) {
        var req = store.put(entry, path);
        req.onsuccess = function() { callback(null); };
        req.onerror = function(e) {
          callback(this.error);
          e.preventDefault();
        };
      },removeRemoteEntry:function (store, path, callback) {
        var req = store.delete(path);
        req.onsuccess = function() { callback(null); };
        req.onerror = function(e) {
          callback(this.error);
          e.preventDefault();
        };
      },reconcile:function (src, dst, callback) {
        var total = 0;
  
        var create = [];
        Object.keys(src.entries).forEach(function (key) {
          var e = src.entries[key];
          var e2 = dst.entries[key];
          if (!e2 || e.timestamp > e2.timestamp) {
            create.push(key);
            total++;
          }
        });
  
        var remove = [];
        Object.keys(dst.entries).forEach(function (key) {
          var e = dst.entries[key];
          var e2 = src.entries[key];
          if (!e2) {
            remove.push(key);
            total++;
          }
        });
  
        if (!total) {
          return callback(null);
        }
  
        var errored = false;
        var completed = 0;
        var db = src.type === 'remote' ? src.db : dst.db;
        var transaction = db.transaction([IDBFS.DB_STORE_NAME], 'readwrite');
        var store = transaction.objectStore(IDBFS.DB_STORE_NAME);
  
        function done(err) {
          if (err) {
            if (!done.errored) {
              done.errored = true;
              return callback(err);
            }
            return;
          }
          if (++completed >= total) {
            return callback(null);
          }
        };
  
        transaction.onerror = function(e) {
          done(this.error);
          e.preventDefault();
        };
  
        // sort paths in ascending order so directory entries are created
        // before the files inside them
        create.sort().forEach(function (path) {
          if (dst.type === 'local') {
            IDBFS.loadRemoteEntry(store, path, function (err, entry) {
              if (err) return done(err);
              IDBFS.storeLocalEntry(path, entry, done);
            });
          } else {
            IDBFS.loadLocalEntry(path, function (err, entry) {
              if (err) return done(err);
              IDBFS.storeRemoteEntry(store, path, entry, done);
            });
          }
        });
  
        // sort paths in descending order so files are deleted before their
        // parent directories
        remove.sort().reverse().forEach(function(path) {
          if (dst.type === 'local') {
            IDBFS.removeLocalEntry(path, done);
          } else {
            IDBFS.removeRemoteEntry(store, path, done);
          }
        });
      }};
  
  var NODEFS={isWindows:false,staticInit:function () {
        NODEFS.isWindows = !!process.platform.match(/^win/);
      },mount:function (mount) {
        assert(ENVIRONMENT_IS_NODE);
        return NODEFS.createNode(null, '/', NODEFS.getMode(mount.opts.root), 0);
      },createNode:function (parent, name, mode, dev) {
        if (!FS.isDir(mode) && !FS.isFile(mode) && !FS.isLink(mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        var node = FS.createNode(parent, name, mode);
        node.node_ops = NODEFS.node_ops;
        node.stream_ops = NODEFS.stream_ops;
        return node;
      },getMode:function (path) {
        var stat;
        try {
          stat = fs.lstatSync(path);
          if (NODEFS.isWindows) {
            // On Windows, directories return permission bits 'rw-rw-rw-', even though they have 'rwxrwxrwx', so
            // propagate write bits to execute bits.
            stat.mode = stat.mode | ((stat.mode & 146) >> 1);
          }
        } catch (e) {
          if (!e.code) throw e;
          throw new FS.ErrnoError(ERRNO_CODES[e.code]);
        }
        return stat.mode;
      },realPath:function (node) {
        var parts = [];
        while (node.parent !== node) {
          parts.push(node.name);
          node = node.parent;
        }
        parts.push(node.mount.opts.root);
        parts.reverse();
        return PATH.join.apply(null, parts);
      },flagsToPermissionStringMap:{0:"r",1:"r+",2:"r+",64:"r",65:"r+",66:"r+",129:"rx+",193:"rx+",514:"w+",577:"w",578:"w+",705:"wx",706:"wx+",1024:"a",1025:"a",1026:"a+",1089:"a",1090:"a+",1153:"ax",1154:"ax+",1217:"ax",1218:"ax+",4096:"rs",4098:"rs+"},flagsToPermissionString:function (flags) {
        flags &= ~0x200000 /*O_PATH*/; // Ignore this flag from musl, otherwise node.js fails to open the file.
        flags &= ~0x800 /*O_NONBLOCK*/; // Ignore this flag from musl, otherwise node.js fails to open the file.
        flags &= ~0x8000 /*O_LARGEFILE*/; // Ignore this flag from musl, otherwise node.js fails to open the file.
        flags &= ~0x80000 /*O_CLOEXEC*/; // Some applications may pass it; it makes no sense for a single process.
        if (flags in NODEFS.flagsToPermissionStringMap) {
          return NODEFS.flagsToPermissionStringMap[flags];
        } else {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
      },node_ops:{getattr:function (node) {
          var path = NODEFS.realPath(node);
          var stat;
          try {
            stat = fs.lstatSync(path);
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
          // node.js v0.10.20 doesn't report blksize and blocks on Windows. Fake them with default blksize of 4096.
          // See http://support.microsoft.com/kb/140365
          if (NODEFS.isWindows && !stat.blksize) {
            stat.blksize = 4096;
          }
          if (NODEFS.isWindows && !stat.blocks) {
            stat.blocks = (stat.size+stat.blksize-1)/stat.blksize|0;
          }
          return {
            dev: stat.dev,
            ino: stat.ino,
            mode: stat.mode,
            nlink: stat.nlink,
            uid: stat.uid,
            gid: stat.gid,
            rdev: stat.rdev,
            size: stat.size,
            atime: stat.atime,
            mtime: stat.mtime,
            ctime: stat.ctime,
            blksize: stat.blksize,
            blocks: stat.blocks
          };
        },setattr:function (node, attr) {
          var path = NODEFS.realPath(node);
          try {
            if (attr.mode !== undefined) {
              fs.chmodSync(path, attr.mode);
              // update the common node structure mode as well
              node.mode = attr.mode;
            }
            if (attr.timestamp !== undefined) {
              var date = new Date(attr.timestamp);
              fs.utimesSync(path, date, date);
            }
            if (attr.size !== undefined) {
              fs.truncateSync(path, attr.size);
            }
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },lookup:function (parent, name) {
          var path = PATH.join2(NODEFS.realPath(parent), name);
          var mode = NODEFS.getMode(path);
          return NODEFS.createNode(parent, name, mode);
        },mknod:function (parent, name, mode, dev) {
          var node = NODEFS.createNode(parent, name, mode, dev);
          // create the backing node for this in the fs root as well
          var path = NODEFS.realPath(node);
          try {
            if (FS.isDir(node.mode)) {
              fs.mkdirSync(path, node.mode);
            } else {
              fs.writeFileSync(path, '', { mode: node.mode });
            }
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
          return node;
        },rename:function (oldNode, newDir, newName) {
          var oldPath = NODEFS.realPath(oldNode);
          var newPath = PATH.join2(NODEFS.realPath(newDir), newName);
          try {
            fs.renameSync(oldPath, newPath);
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },unlink:function (parent, name) {
          var path = PATH.join2(NODEFS.realPath(parent), name);
          try {
            fs.unlinkSync(path);
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },rmdir:function (parent, name) {
          var path = PATH.join2(NODEFS.realPath(parent), name);
          try {
            fs.rmdirSync(path);
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },readdir:function (node) {
          var path = NODEFS.realPath(node);
          try {
            return fs.readdirSync(path);
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },symlink:function (parent, newName, oldPath) {
          var newPath = PATH.join2(NODEFS.realPath(parent), newName);
          try {
            fs.symlinkSync(oldPath, newPath);
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },readlink:function (node) {
          var path = NODEFS.realPath(node);
          try {
            path = fs.readlinkSync(path);
            path = NODEJS_PATH.relative(NODEJS_PATH.resolve(node.mount.opts.root), path);
            return path;
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        }},stream_ops:{open:function (stream) {
          var path = NODEFS.realPath(stream.node);
          try {
            if (FS.isFile(stream.node.mode)) {
              stream.nfd = fs.openSync(path, NODEFS.flagsToPermissionString(stream.flags));
            }
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },close:function (stream) {
          try {
            if (FS.isFile(stream.node.mode) && stream.nfd) {
              fs.closeSync(stream.nfd);
            }
          } catch (e) {
            if (!e.code) throw e;
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
        },read:function (stream, buffer, offset, length, position) {
          if (length === 0) return 0; // node errors on 0 length reads
          // FIXME this is terrible.
          var nbuffer = new Buffer(length);
          var res;
          try {
            res = fs.readSync(stream.nfd, nbuffer, 0, length, position);
          } catch (e) {
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
          if (res > 0) {
            for (var i = 0; i < res; i++) {
              buffer[offset + i] = nbuffer[i];
            }
          }
          return res;
        },write:function (stream, buffer, offset, length, position) {
          // FIXME this is terrible.
          var nbuffer = new Buffer(buffer.subarray(offset, offset + length));
          var res;
          try {
            res = fs.writeSync(stream.nfd, nbuffer, 0, length, position);
          } catch (e) {
            throw new FS.ErrnoError(ERRNO_CODES[e.code]);
          }
          return res;
        },llseek:function (stream, offset, whence) {
          var position = offset;
          if (whence === 1) {  // SEEK_CUR.
            position += stream.position;
          } else if (whence === 2) {  // SEEK_END.
            if (FS.isFile(stream.node.mode)) {
              try {
                var stat = fs.fstatSync(stream.nfd);
                position += stat.size;
              } catch (e) {
                throw new FS.ErrnoError(ERRNO_CODES[e.code]);
              }
            }
          }
  
          if (position < 0) {
            throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
          }
  
          return position;
        }}};
  
  var WORKERFS={DIR_MODE:16895,FILE_MODE:33279,reader:null,mount:function (mount) {
        assert(ENVIRONMENT_IS_WORKER);
        if (!WORKERFS.reader) WORKERFS.reader = new FileReaderSync();
        var root = WORKERFS.createNode(null, '/', WORKERFS.DIR_MODE, 0);
        var createdParents = {};
        function ensureParent(path) {
          // return the parent node, creating subdirs as necessary
          var parts = path.split('/');
          var parent = root;
          for (var i = 0; i < parts.length-1; i++) {
            var curr = parts.slice(0, i+1).join('/');
            // Issue 4254: Using curr as a node name will prevent the node
            // from being found in FS.nameTable when FS.open is called on
            // a path which holds a child of this node,
            // given that all FS functions assume node names
            // are just their corresponding parts within their given path,
            // rather than incremental aggregates which include their parent's
            // directories.
            if (!createdParents[curr]) {
              createdParents[curr] = WORKERFS.createNode(parent, parts[i], WORKERFS.DIR_MODE, 0);
            }
            parent = createdParents[curr];
          }
          return parent;
        }
        function base(path) {
          var parts = path.split('/');
          return parts[parts.length-1];
        }
        // We also accept FileList here, by using Array.prototype
        Array.prototype.forEach.call(mount.opts["files"] || [], function(file) {
          WORKERFS.createNode(ensureParent(file.name), base(file.name), WORKERFS.FILE_MODE, 0, file, file.lastModifiedDate);
        });
        (mount.opts["blobs"] || []).forEach(function(obj) {
          WORKERFS.createNode(ensureParent(obj["name"]), base(obj["name"]), WORKERFS.FILE_MODE, 0, obj["data"]);
        });
        (mount.opts["packages"] || []).forEach(function(pack) {
          pack['metadata'].files.forEach(function(file) {
            var name = file.filename.substr(1); // remove initial slash
            WORKERFS.createNode(ensureParent(name), base(name), WORKERFS.FILE_MODE, 0, pack['blob'].slice(file.start, file.end));
          });
        });
        return root;
      },createNode:function (parent, name, mode, dev, contents, mtime) {
        var node = FS.createNode(parent, name, mode);
        node.mode = mode;
        node.node_ops = WORKERFS.node_ops;
        node.stream_ops = WORKERFS.stream_ops;
        node.timestamp = (mtime || new Date).getTime();
        assert(WORKERFS.FILE_MODE !== WORKERFS.DIR_MODE);
        if (mode === WORKERFS.FILE_MODE) {
          node.size = contents.size;
          node.contents = contents;
        } else {
          node.size = 4096;
          node.contents = {};
        }
        if (parent) {
          parent.contents[name] = node;
        }
        return node;
      },node_ops:{getattr:function (node) {
          return {
            dev: 1,
            ino: undefined,
            mode: node.mode,
            nlink: 1,
            uid: 0,
            gid: 0,
            rdev: undefined,
            size: node.size,
            atime: new Date(node.timestamp),
            mtime: new Date(node.timestamp),
            ctime: new Date(node.timestamp),
            blksize: 4096,
            blocks: Math.ceil(node.size / 4096),
          };
        },setattr:function (node, attr) {
          if (attr.mode !== undefined) {
            node.mode = attr.mode;
          }
          if (attr.timestamp !== undefined) {
            node.timestamp = attr.timestamp;
          }
        },lookup:function (parent, name) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        },mknod:function (parent, name, mode, dev) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        },rename:function (oldNode, newDir, newName) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        },unlink:function (parent, name) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        },rmdir:function (parent, name) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        },readdir:function (node) {
          var entries = ['.', '..'];
          for (var key in node.contents) {
            if (!node.contents.hasOwnProperty(key)) {
              continue;
            }
            entries.push(key);
          }
          return entries;
        },symlink:function (parent, newName, oldPath) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        },readlink:function (node) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }},stream_ops:{read:function (stream, buffer, offset, length, position) {
          if (position >= stream.node.size) return 0;
          var chunk = stream.node.contents.slice(position, position + length);
          var ab = WORKERFS.reader.readAsArrayBuffer(chunk);
          buffer.set(new Uint8Array(ab), offset);
          return chunk.size;
        },write:function (stream, buffer, offset, length, position) {
          throw new FS.ErrnoError(ERRNO_CODES.EIO);
        },llseek:function (stream, offset, whence) {
          var position = offset;
          if (whence === 1) {  // SEEK_CUR.
            position += stream.position;
          } else if (whence === 2) {  // SEEK_END.
            if (FS.isFile(stream.node.mode)) {
              position += stream.node.size;
            }
          }
          if (position < 0) {
            throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
          }
          return position;
        }}};
  
  var _stdin=STATICTOP; STATICTOP += 16;;
  
  var _stdout=STATICTOP; STATICTOP += 16;;
  
  var _stderr=STATICTOP; STATICTOP += 16;;var FS={root:null,mounts:[],devices:[null],streams:[],nextInode:1,nameTable:null,currentPath:"/",initialized:false,ignorePermissions:true,trackingDelegate:{},tracking:{openFlags:{READ:1,WRITE:2}},ErrnoError:null,genericErrors:{},filesystems:null,syncFSRequests:0,handleFSError:function (e) {
        if (!(e instanceof FS.ErrnoError)) throw e + ' : ' + stackTrace();
        return ___setErrNo(e.errno);
      },lookupPath:function (path, opts) {
        path = PATH.resolve(FS.cwd(), path);
        opts = opts || {};
  
        if (!path) return { path: '', node: null };
  
        var defaults = {
          follow_mount: true,
          recurse_count: 0
        };
        for (var key in defaults) {
          if (opts[key] === undefined) {
            opts[key] = defaults[key];
          }
        }
  
        if (opts.recurse_count > 8) {  // max recursive lookup of 8
          throw new FS.ErrnoError(ERRNO_CODES.ELOOP);
        }
  
        // split the path
        var parts = PATH.normalizeArray(path.split('/').filter(function(p) {
          return !!p;
        }), false);
  
        // start at the root
        var current = FS.root;
        var current_path = '/';
  
        for (var i = 0; i < parts.length; i++) {
          var islast = (i === parts.length-1);
          if (islast && opts.parent) {
            // stop resolving
            break;
          }
  
          current = FS.lookupNode(current, parts[i]);
          current_path = PATH.join2(current_path, parts[i]);
  
          // jump to the mount's root node if this is a mountpoint
          if (FS.isMountpoint(current)) {
            if (!islast || (islast && opts.follow_mount)) {
              current = current.mounted.root;
            }
          }
  
          // by default, lookupPath will not follow a symlink if it is the final path component.
          // setting opts.follow = true will override this behavior.
          if (!islast || opts.follow) {
            var count = 0;
            while (FS.isLink(current.mode)) {
              var link = FS.readlink(current_path);
              current_path = PATH.resolve(PATH.dirname(current_path), link);
  
              var lookup = FS.lookupPath(current_path, { recurse_count: opts.recurse_count });
              current = lookup.node;
  
              if (count++ > 40) {  // limit max consecutive symlinks to 40 (SYMLOOP_MAX).
                throw new FS.ErrnoError(ERRNO_CODES.ELOOP);
              }
            }
          }
        }
  
        return { path: current_path, node: current };
      },getPath:function (node) {
        var path;
        while (true) {
          if (FS.isRoot(node)) {
            var mount = node.mount.mountpoint;
            if (!path) return mount;
            return mount[mount.length-1] !== '/' ? mount + '/' + path : mount + path;
          }
          path = path ? node.name + '/' + path : node.name;
          node = node.parent;
        }
      },hashName:function (parentid, name) {
        var hash = 0;
  
  
        for (var i = 0; i < name.length; i++) {
          hash = ((hash << 5) - hash + name.charCodeAt(i)) | 0;
        }
        return ((parentid + hash) >>> 0) % FS.nameTable.length;
      },hashAddNode:function (node) {
        var hash = FS.hashName(node.parent.id, node.name);
        node.name_next = FS.nameTable[hash];
        FS.nameTable[hash] = node;
      },hashRemoveNode:function (node) {
        var hash = FS.hashName(node.parent.id, node.name);
        if (FS.nameTable[hash] === node) {
          FS.nameTable[hash] = node.name_next;
        } else {
          var current = FS.nameTable[hash];
          while (current) {
            if (current.name_next === node) {
              current.name_next = node.name_next;
              break;
            }
            current = current.name_next;
          }
        }
      },lookupNode:function (parent, name) {
        var err = FS.mayLookup(parent);
        if (err) {
          throw new FS.ErrnoError(err, parent);
        }
        var hash = FS.hashName(parent.id, name);
        for (var node = FS.nameTable[hash]; node; node = node.name_next) {
          var nodeName = node.name;
          if (node.parent.id === parent.id && nodeName === name) {
            return node;
          }
        }
        // if we failed to find it in the cache, call into the VFS
        return FS.lookup(parent, name);
      },createNode:function (parent, name, mode, rdev) {
        if (!FS.FSNode) {
          FS.FSNode = function(parent, name, mode, rdev) {
            if (!parent) {
              parent = this;  // root node sets parent to itself
            }
            this.parent = parent;
            this.mount = parent.mount;
            this.mounted = null;
            this.id = FS.nextInode++;
            this.name = name;
            this.mode = mode;
            this.node_ops = {};
            this.stream_ops = {};
            this.rdev = rdev;
          };
  
          FS.FSNode.prototype = {};
  
          // compatibility
          var readMode = 292 | 73;
          var writeMode = 146;
  
          // NOTE we must use Object.defineProperties instead of individual calls to
          // Object.defineProperty in order to make closure compiler happy
          Object.defineProperties(FS.FSNode.prototype, {
            read: {
              get: function() { return (this.mode & readMode) === readMode; },
              set: function(val) { val ? this.mode |= readMode : this.mode &= ~readMode; }
            },
            write: {
              get: function() { return (this.mode & writeMode) === writeMode; },
              set: function(val) { val ? this.mode |= writeMode : this.mode &= ~writeMode; }
            },
            isFolder: {
              get: function() { return FS.isDir(this.mode); }
            },
            isDevice: {
              get: function() { return FS.isChrdev(this.mode); }
            }
          });
        }
  
        var node = new FS.FSNode(parent, name, mode, rdev);
  
        FS.hashAddNode(node);
  
        return node;
      },destroyNode:function (node) {
        FS.hashRemoveNode(node);
      },isRoot:function (node) {
        return node === node.parent;
      },isMountpoint:function (node) {
        return !!node.mounted;
      },isFile:function (mode) {
        return (mode & 61440) === 32768;
      },isDir:function (mode) {
        return (mode & 61440) === 16384;
      },isLink:function (mode) {
        return (mode & 61440) === 40960;
      },isChrdev:function (mode) {
        return (mode & 61440) === 8192;
      },isBlkdev:function (mode) {
        return (mode & 61440) === 24576;
      },isFIFO:function (mode) {
        return (mode & 61440) === 4096;
      },isSocket:function (mode) {
        return (mode & 49152) === 49152;
      },flagModes:{"r":0,"rs":1052672,"r+":2,"w":577,"wx":705,"xw":705,"w+":578,"wx+":706,"xw+":706,"a":1089,"ax":1217,"xa":1217,"a+":1090,"ax+":1218,"xa+":1218},modeStringToFlags:function (str) {
        var flags = FS.flagModes[str];
        if (typeof flags === 'undefined') {
          throw new Error('Unknown file open mode: ' + str);
        }
        return flags;
      },flagsToPermissionString:function (flag) {
        var perms = ['r', 'w', 'rw'][flag & 3];
        if ((flag & 512)) {
          perms += 'w';
        }
        return perms;
      },nodePermissions:function (node, perms) {
        if (FS.ignorePermissions) {
          return 0;
        }
        // return 0 if any user, group or owner bits are set.
        if (perms.indexOf('r') !== -1 && !(node.mode & 292)) {
          return ERRNO_CODES.EACCES;
        } else if (perms.indexOf('w') !== -1 && !(node.mode & 146)) {
          return ERRNO_CODES.EACCES;
        } else if (perms.indexOf('x') !== -1 && !(node.mode & 73)) {
          return ERRNO_CODES.EACCES;
        }
        return 0;
      },mayLookup:function (dir) {
        var err = FS.nodePermissions(dir, 'x');
        if (err) return err;
        if (!dir.node_ops.lookup) return ERRNO_CODES.EACCES;
        return 0;
      },mayCreate:function (dir, name) {
        try {
          var node = FS.lookupNode(dir, name);
          return ERRNO_CODES.EEXIST;
        } catch (e) {
        }
        return FS.nodePermissions(dir, 'wx');
      },mayDelete:function (dir, name, isdir) {
        var node;
        try {
          node = FS.lookupNode(dir, name);
        } catch (e) {
          return e.errno;
        }
        var err = FS.nodePermissions(dir, 'wx');
        if (err) {
          return err;
        }
        if (isdir) {
          if (!FS.isDir(node.mode)) {
            return ERRNO_CODES.ENOTDIR;
          }
          if (FS.isRoot(node) || FS.getPath(node) === FS.cwd()) {
            return ERRNO_CODES.EBUSY;
          }
        } else {
          if (FS.isDir(node.mode)) {
            return ERRNO_CODES.EISDIR;
          }
        }
        return 0;
      },mayOpen:function (node, flags) {
        if (!node) {
          return ERRNO_CODES.ENOENT;
        }
        if (FS.isLink(node.mode)) {
          return ERRNO_CODES.ELOOP;
        } else if (FS.isDir(node.mode)) {
          if (FS.flagsToPermissionString(flags) !== 'r' || // opening for write
              (flags & 512)) { // TODO: check for O_SEARCH? (== search for dir only)
            return ERRNO_CODES.EISDIR;
          }
        }
        return FS.nodePermissions(node, FS.flagsToPermissionString(flags));
      },MAX_OPEN_FDS:4096,nextfd:function (fd_start, fd_end) {
        fd_start = fd_start || 0;
        fd_end = fd_end || FS.MAX_OPEN_FDS;
        for (var fd = fd_start; fd <= fd_end; fd++) {
          if (!FS.streams[fd]) {
            return fd;
          }
        }
        throw new FS.ErrnoError(ERRNO_CODES.EMFILE);
      },getStream:function (fd) {
        return FS.streams[fd];
      },createStream:function (stream, fd_start, fd_end) {
        if (!FS.FSStream) {
          FS.FSStream = function(){};
          FS.FSStream.prototype = {};
          // compatibility
          Object.defineProperties(FS.FSStream.prototype, {
            object: {
              get: function() { return this.node; },
              set: function(val) { this.node = val; }
            },
            isRead: {
              get: function() { return (this.flags & 2097155) !== 1; }
            },
            isWrite: {
              get: function() { return (this.flags & 2097155) !== 0; }
            },
            isAppend: {
              get: function() { return (this.flags & 1024); }
            }
          });
        }
        // clone it, so we can return an instance of FSStream
        var newStream = new FS.FSStream();
        for (var p in stream) {
          newStream[p] = stream[p];
        }
        stream = newStream;
        var fd = FS.nextfd(fd_start, fd_end);
        stream.fd = fd;
        FS.streams[fd] = stream;
        return stream;
      },closeStream:function (fd) {
        FS.streams[fd] = null;
      },chrdev_stream_ops:{open:function (stream) {
          var device = FS.getDevice(stream.node.rdev);
          // override node's stream ops with the device's
          stream.stream_ops = device.stream_ops;
          // forward the open call
          if (stream.stream_ops.open) {
            stream.stream_ops.open(stream);
          }
        },llseek:function () {
          throw new FS.ErrnoError(ERRNO_CODES.ESPIPE);
        }},major:function (dev) {
        return ((dev) >> 8);
      },minor:function (dev) {
        return ((dev) & 0xff);
      },makedev:function (ma, mi) {
        return ((ma) << 8 | (mi));
      },registerDevice:function (dev, ops) {
        FS.devices[dev] = { stream_ops: ops };
      },getDevice:function (dev) {
        return FS.devices[dev];
      },getMounts:function (mount) {
        var mounts = [];
        var check = [mount];
  
        while (check.length) {
          var m = check.pop();
  
          mounts.push(m);
  
          check.push.apply(check, m.mounts);
        }
  
        return mounts;
      },syncfs:function (populate, callback) {
        if (typeof(populate) === 'function') {
          callback = populate;
          populate = false;
        }
  
        FS.syncFSRequests++;
  
        if (FS.syncFSRequests > 1) {
          console.log('warning: ' + FS.syncFSRequests + ' FS.syncfs operations in flight at once, probably just doing extra work');
        }
  
        var mounts = FS.getMounts(FS.root.mount);
        var completed = 0;
  
        function doCallback(err) {
          assert(FS.syncFSRequests > 0);
          FS.syncFSRequests--;
          return callback(err);
        }
  
        function done(err) {
          if (err) {
            if (!done.errored) {
              done.errored = true;
              return doCallback(err);
            }
            return;
          }
          if (++completed >= mounts.length) {
            doCallback(null);
          }
        };
  
        // sync all mounts
        mounts.forEach(function (mount) {
          if (!mount.type.syncfs) {
            return done(null);
          }
          mount.type.syncfs(mount, populate, done);
        });
      },mount:function (type, opts, mountpoint) {
        var root = mountpoint === '/';
        var pseudo = !mountpoint;
        var node;
  
        if (root && FS.root) {
          throw new FS.ErrnoError(ERRNO_CODES.EBUSY);
        } else if (!root && !pseudo) {
          var lookup = FS.lookupPath(mountpoint, { follow_mount: false });
  
          mountpoint = lookup.path;  // use the absolute path
          node = lookup.node;
  
          if (FS.isMountpoint(node)) {
            throw new FS.ErrnoError(ERRNO_CODES.EBUSY);
          }
  
          if (!FS.isDir(node.mode)) {
            throw new FS.ErrnoError(ERRNO_CODES.ENOTDIR);
          }
        }
  
        var mount = {
          type: type,
          opts: opts,
          mountpoint: mountpoint,
          mounts: []
        };
  
        // create a root node for the fs
        var mountRoot = type.mount(mount);
        mountRoot.mount = mount;
        mount.root = mountRoot;
  
        if (root) {
          FS.root = mountRoot;
        } else if (node) {
          // set as a mountpoint
          node.mounted = mount;
  
          // add the new mount to the current mount's children
          if (node.mount) {
            node.mount.mounts.push(mount);
          }
        }
  
        return mountRoot;
      },unmount:function (mountpoint) {
        var lookup = FS.lookupPath(mountpoint, { follow_mount: false });
  
        if (!FS.isMountpoint(lookup.node)) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
  
        // destroy the nodes for this mount, and all its child mounts
        var node = lookup.node;
        var mount = node.mounted;
        var mounts = FS.getMounts(mount);
  
        Object.keys(FS.nameTable).forEach(function (hash) {
          var current = FS.nameTable[hash];
  
          while (current) {
            var next = current.name_next;
  
            if (mounts.indexOf(current.mount) !== -1) {
              FS.destroyNode(current);
            }
  
            current = next;
          }
        });
  
        // no longer a mountpoint
        node.mounted = null;
  
        // remove this mount from the child mounts
        var idx = node.mount.mounts.indexOf(mount);
        assert(idx !== -1);
        node.mount.mounts.splice(idx, 1);
      },lookup:function (parent, name) {
        return parent.node_ops.lookup(parent, name);
      },mknod:function (path, mode, dev) {
        var lookup = FS.lookupPath(path, { parent: true });
        var parent = lookup.node;
        var name = PATH.basename(path);
        if (!name || name === '.' || name === '..') {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        var err = FS.mayCreate(parent, name);
        if (err) {
          throw new FS.ErrnoError(err);
        }
        if (!parent.node_ops.mknod) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        return parent.node_ops.mknod(parent, name, mode, dev);
      },create:function (path, mode) {
        mode = mode !== undefined ? mode : 438 /* 0666 */;
        mode &= 4095;
        mode |= 32768;
        return FS.mknod(path, mode, 0);
      },mkdir:function (path, mode) {
        mode = mode !== undefined ? mode : 511 /* 0777 */;
        mode &= 511 | 512;
        mode |= 16384;
        return FS.mknod(path, mode, 0);
      },mkdirTree:function (path, mode) {
        var dirs = path.split('/');
        var d = '';
        for (var i = 0; i < dirs.length; ++i) {
          if (!dirs[i]) continue;
          d += '/' + dirs[i];
          try {
            FS.mkdir(d, mode);
          } catch(e) {
            if (e.errno != ERRNO_CODES.EEXIST) throw e;
          }
        }
      },mkdev:function (path, mode, dev) {
        if (typeof(dev) === 'undefined') {
          dev = mode;
          mode = 438 /* 0666 */;
        }
        mode |= 8192;
        return FS.mknod(path, mode, dev);
      },symlink:function (oldpath, newpath) {
        if (!PATH.resolve(oldpath)) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        var lookup = FS.lookupPath(newpath, { parent: true });
        var parent = lookup.node;
        if (!parent) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        var newname = PATH.basename(newpath);
        var err = FS.mayCreate(parent, newname);
        if (err) {
          throw new FS.ErrnoError(err);
        }
        if (!parent.node_ops.symlink) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        return parent.node_ops.symlink(parent, newname, oldpath);
      },rename:function (old_path, new_path) {
        var old_dirname = PATH.dirname(old_path);
        var new_dirname = PATH.dirname(new_path);
        var old_name = PATH.basename(old_path);
        var new_name = PATH.basename(new_path);
        // parents must exist
        var lookup, old_dir, new_dir;
        try {
          lookup = FS.lookupPath(old_path, { parent: true });
          old_dir = lookup.node;
          lookup = FS.lookupPath(new_path, { parent: true });
          new_dir = lookup.node;
        } catch (e) {
          throw new FS.ErrnoError(ERRNO_CODES.EBUSY);
        }
        if (!old_dir || !new_dir) throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        // need to be part of the same mount
        if (old_dir.mount !== new_dir.mount) {
          throw new FS.ErrnoError(ERRNO_CODES.EXDEV);
        }
        // source must exist
        var old_node = FS.lookupNode(old_dir, old_name);
        // old path should not be an ancestor of the new path
        var relative = PATH.relative(old_path, new_dirname);
        if (relative.charAt(0) !== '.') {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        // new path should not be an ancestor of the old path
        relative = PATH.relative(new_path, old_dirname);
        if (relative.charAt(0) !== '.') {
          throw new FS.ErrnoError(ERRNO_CODES.ENOTEMPTY);
        }
        // see if the new path already exists
        var new_node;
        try {
          new_node = FS.lookupNode(new_dir, new_name);
        } catch (e) {
          // not fatal
        }
        // early out if nothing needs to change
        if (old_node === new_node) {
          return;
        }
        // we'll need to delete the old entry
        var isdir = FS.isDir(old_node.mode);
        var err = FS.mayDelete(old_dir, old_name, isdir);
        if (err) {
          throw new FS.ErrnoError(err);
        }
        // need delete permissions if we'll be overwriting.
        // need create permissions if new doesn't already exist.
        err = new_node ?
          FS.mayDelete(new_dir, new_name, isdir) :
          FS.mayCreate(new_dir, new_name);
        if (err) {
          throw new FS.ErrnoError(err);
        }
        if (!old_dir.node_ops.rename) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        if (FS.isMountpoint(old_node) || (new_node && FS.isMountpoint(new_node))) {
          throw new FS.ErrnoError(ERRNO_CODES.EBUSY);
        }
        // if we are going to change the parent, check write permissions
        if (new_dir !== old_dir) {
          err = FS.nodePermissions(old_dir, 'w');
          if (err) {
            throw new FS.ErrnoError(err);
          }
        }
        try {
          if (FS.trackingDelegate['willMovePath']) {
            FS.trackingDelegate['willMovePath'](old_path, new_path);
          }
        } catch(e) {
          console.log("FS.trackingDelegate['willMovePath']('"+old_path+"', '"+new_path+"') threw an exception: " + e.message);
        }
        // remove the node from the lookup hash
        FS.hashRemoveNode(old_node);
        // do the underlying fs rename
        try {
          old_dir.node_ops.rename(old_node, new_dir, new_name);
        } catch (e) {
          throw e;
        } finally {
          // add the node back to the hash (in case node_ops.rename
          // changed its name)
          FS.hashAddNode(old_node);
        }
        try {
          if (FS.trackingDelegate['onMovePath']) FS.trackingDelegate['onMovePath'](old_path, new_path);
        } catch(e) {
          console.log("FS.trackingDelegate['onMovePath']('"+old_path+"', '"+new_path+"') threw an exception: " + e.message);
        }
      },rmdir:function (path) {
        var lookup = FS.lookupPath(path, { parent: true });
        var parent = lookup.node;
        var name = PATH.basename(path);
        var node = FS.lookupNode(parent, name);
        var err = FS.mayDelete(parent, name, true);
        if (err) {
          throw new FS.ErrnoError(err);
        }
        if (!parent.node_ops.rmdir) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        if (FS.isMountpoint(node)) {
          throw new FS.ErrnoError(ERRNO_CODES.EBUSY);
        }
        try {
          if (FS.trackingDelegate['willDeletePath']) {
            FS.trackingDelegate['willDeletePath'](path);
          }
        } catch(e) {
          console.log("FS.trackingDelegate['willDeletePath']('"+path+"') threw an exception: " + e.message);
        }
        parent.node_ops.rmdir(parent, name);
        FS.destroyNode(node);
        try {
          if (FS.trackingDelegate['onDeletePath']) FS.trackingDelegate['onDeletePath'](path);
        } catch(e) {
          console.log("FS.trackingDelegate['onDeletePath']('"+path+"') threw an exception: " + e.message);
        }
      },readdir:function (path) {
        var lookup = FS.lookupPath(path, { follow: true });
        var node = lookup.node;
        if (!node.node_ops.readdir) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOTDIR);
        }
        return node.node_ops.readdir(node);
      },unlink:function (path) {
        var lookup = FS.lookupPath(path, { parent: true });
        var parent = lookup.node;
        var name = PATH.basename(path);
        var node = FS.lookupNode(parent, name);
        var err = FS.mayDelete(parent, name, false);
        if (err) {
          // According to POSIX, we should map EISDIR to EPERM, but
          // we instead do what Linux does (and we must, as we use
          // the musl linux libc).
          throw new FS.ErrnoError(err);
        }
        if (!parent.node_ops.unlink) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        if (FS.isMountpoint(node)) {
          throw new FS.ErrnoError(ERRNO_CODES.EBUSY);
        }
        try {
          if (FS.trackingDelegate['willDeletePath']) {
            FS.trackingDelegate['willDeletePath'](path);
          }
        } catch(e) {
          console.log("FS.trackingDelegate['willDeletePath']('"+path+"') threw an exception: " + e.message);
        }
        parent.node_ops.unlink(parent, name);
        FS.destroyNode(node);
        try {
          if (FS.trackingDelegate['onDeletePath']) FS.trackingDelegate['onDeletePath'](path);
        } catch(e) {
          console.log("FS.trackingDelegate['onDeletePath']('"+path+"') threw an exception: " + e.message);
        }
      },readlink:function (path) {
        var lookup = FS.lookupPath(path);
        var link = lookup.node;
        if (!link) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        if (!link.node_ops.readlink) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        return PATH.resolve(FS.getPath(link.parent), link.node_ops.readlink(link));
      },stat:function (path, dontFollow) {
        var lookup = FS.lookupPath(path, { follow: !dontFollow });
        var node = lookup.node;
        if (!node) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        if (!node.node_ops.getattr) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        return node.node_ops.getattr(node);
      },lstat:function (path) {
        return FS.stat(path, true);
      },chmod:function (path, mode, dontFollow) {
        var node;
        if (typeof path === 'string') {
          var lookup = FS.lookupPath(path, { follow: !dontFollow });
          node = lookup.node;
        } else {
          node = path;
        }
        if (!node.node_ops.setattr) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        node.node_ops.setattr(node, {
          mode: (mode & 4095) | (node.mode & ~4095),
          timestamp: Date.now()
        });
      },lchmod:function (path, mode) {
        FS.chmod(path, mode, true);
      },fchmod:function (fd, mode) {
        var stream = FS.getStream(fd);
        if (!stream) {
          throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        }
        FS.chmod(stream.node, mode);
      },chown:function (path, uid, gid, dontFollow) {
        var node;
        if (typeof path === 'string') {
          var lookup = FS.lookupPath(path, { follow: !dontFollow });
          node = lookup.node;
        } else {
          node = path;
        }
        if (!node.node_ops.setattr) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        node.node_ops.setattr(node, {
          timestamp: Date.now()
          // we ignore the uid / gid for now
        });
      },lchown:function (path, uid, gid) {
        FS.chown(path, uid, gid, true);
      },fchown:function (fd, uid, gid) {
        var stream = FS.getStream(fd);
        if (!stream) {
          throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        }
        FS.chown(stream.node, uid, gid);
      },truncate:function (path, len) {
        if (len < 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        var node;
        if (typeof path === 'string') {
          var lookup = FS.lookupPath(path, { follow: true });
          node = lookup.node;
        } else {
          node = path;
        }
        if (!node.node_ops.setattr) {
          throw new FS.ErrnoError(ERRNO_CODES.EPERM);
        }
        if (FS.isDir(node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.EISDIR);
        }
        if (!FS.isFile(node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        var err = FS.nodePermissions(node, 'w');
        if (err) {
          throw new FS.ErrnoError(err);
        }
        node.node_ops.setattr(node, {
          size: len,
          timestamp: Date.now()
        });
      },ftruncate:function (fd, len) {
        var stream = FS.getStream(fd);
        if (!stream) {
          throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        }
        if ((stream.flags & 2097155) === 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        FS.truncate(stream.node, len);
      },utime:function (path, atime, mtime) {
        var lookup = FS.lookupPath(path, { follow: true });
        var node = lookup.node;
        node.node_ops.setattr(node, {
          timestamp: Math.max(atime, mtime)
        });
      },open:function (path, flags, mode, fd_start, fd_end) {
        if (path === "") {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        flags = typeof flags === 'string' ? FS.modeStringToFlags(flags) : flags;
        mode = typeof mode === 'undefined' ? 438 /* 0666 */ : mode;
        if ((flags & 64)) {
          mode = (mode & 4095) | 32768;
        } else {
          mode = 0;
        }
        var node;
        if (typeof path === 'object') {
          node = path;
        } else {
          path = PATH.normalize(path);
          try {
            var lookup = FS.lookupPath(path, {
              follow: !(flags & 131072)
            });
            node = lookup.node;
          } catch (e) {
            // ignore
          }
        }
        // perhaps we need to create the node
        var created = false;
        if ((flags & 64)) {
          if (node) {
            // if O_CREAT and O_EXCL are set, error out if the node already exists
            if ((flags & 128)) {
              throw new FS.ErrnoError(ERRNO_CODES.EEXIST);
            }
          } else {
            // node doesn't exist, try to create it
            node = FS.mknod(path, mode, 0);
            created = true;
          }
        }
        if (!node) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        // can't truncate a device
        if (FS.isChrdev(node.mode)) {
          flags &= ~512;
        }
        // if asked only for a directory, then this must be one
        if ((flags & 65536) && !FS.isDir(node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOTDIR);
        }
        // check permissions, if this is not a file we just created now (it is ok to
        // create and write to a file with read-only permissions; it is read-only
        // for later use)
        if (!created) {
          var err = FS.mayOpen(node, flags);
          if (err) {
            throw new FS.ErrnoError(err);
          }
        }
        // do truncation if necessary
        if ((flags & 512)) {
          FS.truncate(node, 0);
        }
        // we've already handled these, don't pass down to the underlying vfs
        flags &= ~(128 | 512);
  
        // register the stream with the filesystem
        var stream = FS.createStream({
          node: node,
          path: FS.getPath(node),  // we want the absolute path to the node
          flags: flags,
          seekable: true,
          position: 0,
          stream_ops: node.stream_ops,
          // used by the file family libc calls (fopen, fwrite, ferror, etc.)
          ungotten: [],
          error: false
        }, fd_start, fd_end);
        // call the new stream's open function
        if (stream.stream_ops.open) {
          stream.stream_ops.open(stream);
        }
        if (Module['logReadFiles'] && !(flags & 1)) {
          if (!FS.readFiles) FS.readFiles = {};
          if (!(path in FS.readFiles)) {
            FS.readFiles[path] = 1;
            Module['printErr']('read file: ' + path);
          }
        }
        try {
          if (FS.trackingDelegate['onOpenFile']) {
            var trackingFlags = 0;
            if ((flags & 2097155) !== 1) {
              trackingFlags |= FS.tracking.openFlags.READ;
            }
            if ((flags & 2097155) !== 0) {
              trackingFlags |= FS.tracking.openFlags.WRITE;
            }
            FS.trackingDelegate['onOpenFile'](path, trackingFlags);
          }
        } catch(e) {
          console.log("FS.trackingDelegate['onOpenFile']('"+path+"', flags) threw an exception: " + e.message);
        }
        return stream;
      },close:function (stream) {
        if (stream.getdents) stream.getdents = null; // free readdir state
        try {
          if (stream.stream_ops.close) {
            stream.stream_ops.close(stream);
          }
        } catch (e) {
          throw e;
        } finally {
          FS.closeStream(stream.fd);
        }
      },llseek:function (stream, offset, whence) {
        if (!stream.seekable || !stream.stream_ops.llseek) {
          throw new FS.ErrnoError(ERRNO_CODES.ESPIPE);
        }
        stream.position = stream.stream_ops.llseek(stream, offset, whence);
        stream.ungotten = [];
        return stream.position;
      },read:function (stream, buffer, offset, length, position) {
        if (length < 0 || position < 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        if ((stream.flags & 2097155) === 1) {
          throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        }
        if (FS.isDir(stream.node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.EISDIR);
        }
        if (!stream.stream_ops.read) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        var seeking = true;
        if (typeof position === 'undefined') {
          position = stream.position;
          seeking = false;
        } else if (!stream.seekable) {
          throw new FS.ErrnoError(ERRNO_CODES.ESPIPE);
        }
        var bytesRead = stream.stream_ops.read(stream, buffer, offset, length, position);
        if (!seeking) stream.position += bytesRead;
        return bytesRead;
      },write:function (stream, buffer, offset, length, position, canOwn) {
        if (length < 0 || position < 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        if ((stream.flags & 2097155) === 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        }
        if (FS.isDir(stream.node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.EISDIR);
        }
        if (!stream.stream_ops.write) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        if (stream.flags & 1024) {
          // seek to the end before writing in append mode
          FS.llseek(stream, 0, 2);
        }
        var seeking = true;
        if (typeof position === 'undefined') {
          position = stream.position;
          seeking = false;
        } else if (!stream.seekable) {
          throw new FS.ErrnoError(ERRNO_CODES.ESPIPE);
        }
        var bytesWritten = stream.stream_ops.write(stream, buffer, offset, length, position, canOwn);
        if (!seeking) stream.position += bytesWritten;
        try {
          if (stream.path && FS.trackingDelegate['onWriteToFile']) FS.trackingDelegate['onWriteToFile'](stream.path);
        } catch(e) {
          console.log("FS.trackingDelegate['onWriteToFile']('"+path+"') threw an exception: " + e.message);
        }
        return bytesWritten;
      },allocate:function (stream, offset, length) {
        if (offset < 0 || length <= 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EINVAL);
        }
        if ((stream.flags & 2097155) === 0) {
          throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        }
        if (!FS.isFile(stream.node.mode) && !FS.isDir(stream.node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.ENODEV);
        }
        if (!stream.stream_ops.allocate) {
          throw new FS.ErrnoError(ERRNO_CODES.EOPNOTSUPP);
        }
        stream.stream_ops.allocate(stream, offset, length);
      },mmap:function (stream, buffer, offset, length, position, prot, flags) {
        // TODO if PROT is PROT_WRITE, make sure we have write access
        if ((stream.flags & 2097155) === 1) {
          throw new FS.ErrnoError(ERRNO_CODES.EACCES);
        }
        if (!stream.stream_ops.mmap) {
          throw new FS.ErrnoError(ERRNO_CODES.ENODEV);
        }
        return stream.stream_ops.mmap(stream, buffer, offset, length, position, prot, flags);
      },msync:function (stream, buffer, offset, length, mmapFlags) {
        if (!stream || !stream.stream_ops.msync) {
          return 0;
        }
        return stream.stream_ops.msync(stream, buffer, offset, length, mmapFlags);
      },munmap:function (stream) {
        return 0;
      },ioctl:function (stream, cmd, arg) {
        if (!stream.stream_ops.ioctl) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOTTY);
        }
        return stream.stream_ops.ioctl(stream, cmd, arg);
      },readFile:function (path, opts) {
        opts = opts || {};
        opts.flags = opts.flags || 'r';
        opts.encoding = opts.encoding || 'binary';
        if (opts.encoding !== 'utf8' && opts.encoding !== 'binary') {
          throw new Error('Invalid encoding type "' + opts.encoding + '"');
        }
        var ret;
        var stream = FS.open(path, opts.flags);
        var stat = FS.stat(path);
        var length = stat.size;
        var buf = new Uint8Array(length);
        FS.read(stream, buf, 0, length, 0);
        if (opts.encoding === 'utf8') {
          ret = UTF8ArrayToString(buf, 0);
        } else if (opts.encoding === 'binary') {
          ret = buf;
        }
        FS.close(stream);
        return ret;
      },writeFile:function (path, data, opts) {
        opts = opts || {};
        opts.flags = opts.flags || 'w';
        opts.encoding = opts.encoding || 'utf8';
        if (opts.encoding !== 'utf8' && opts.encoding !== 'binary') {
          throw new Error('Invalid encoding type "' + opts.encoding + '"');
        }
        var stream = FS.open(path, opts.flags, opts.mode);
        if (opts.encoding === 'utf8') {
          var buf = new Uint8Array(lengthBytesUTF8(data)+1);
          var actualNumBytes = stringToUTF8Array(data, buf, 0, buf.length);
          FS.write(stream, buf, 0, actualNumBytes, 0, opts.canOwn);
        } else if (opts.encoding === 'binary') {
          FS.write(stream, data, 0, data.length, 0, opts.canOwn);
        }
        FS.close(stream);
      },cwd:function () {
        return FS.currentPath;
      },chdir:function (path) {
        var lookup = FS.lookupPath(path, { follow: true });
        if (lookup.node === null) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOENT);
        }
        if (!FS.isDir(lookup.node.mode)) {
          throw new FS.ErrnoError(ERRNO_CODES.ENOTDIR);
        }
        var err = FS.nodePermissions(lookup.node, 'x');
        if (err) {
          throw new FS.ErrnoError(err);
        }
        FS.currentPath = lookup.path;
      },createDefaultDirectories:function () {
        FS.mkdir('/tmp');
        FS.mkdir('/home');
        FS.mkdir('/home/web_user');
      },createDefaultDevices:function () {
        // create /dev
        FS.mkdir('/dev');
        // setup /dev/null
        FS.registerDevice(FS.makedev(1, 3), {
          read: function() { return 0; },
          write: function(stream, buffer, offset, length, pos) { return length; }
        });
        FS.mkdev('/dev/null', FS.makedev(1, 3));
        // setup /dev/tty and /dev/tty1
        // stderr needs to print output using Module['printErr']
        // so we register a second tty just for it.
        TTY.register(FS.makedev(5, 0), TTY.default_tty_ops);
        TTY.register(FS.makedev(6, 0), TTY.default_tty1_ops);
        FS.mkdev('/dev/tty', FS.makedev(5, 0));
        FS.mkdev('/dev/tty1', FS.makedev(6, 0));
        // setup /dev/[u]random
        var random_device;
        if (typeof crypto !== 'undefined') {
          // for modern web browsers
          var randomBuffer = new Uint8Array(1);
          random_device = function() { crypto.getRandomValues(randomBuffer); return randomBuffer[0]; };
        } else if (ENVIRONMENT_IS_NODE) {
          // for nodejs
          random_device = function() { return require('crypto').randomBytes(1)[0]; };
        } else {
          // default for ES5 platforms
          random_device = function() { return (Math.random()*256)|0; };
        }
        FS.createDevice('/dev', 'random', random_device);
        FS.createDevice('/dev', 'urandom', random_device);
        // we're not going to emulate the actual shm device,
        // just create the tmp dirs that reside in it commonly
        FS.mkdir('/dev/shm');
        FS.mkdir('/dev/shm/tmp');
      },createSpecialDirectories:function () {
        // create /proc/self/fd which allows /proc/self/fd/6 => readlink gives the name of the stream for fd 6 (see test_unistd_ttyname)
        FS.mkdir('/proc');
        FS.mkdir('/proc/self');
        FS.mkdir('/proc/self/fd');
        FS.mount({
          mount: function() {
            var node = FS.createNode('/proc/self', 'fd', 16384 | 511 /* 0777 */, 73);
            node.node_ops = {
              lookup: function(parent, name) {
                var fd = +name;
                var stream = FS.getStream(fd);
                if (!stream) throw new FS.ErrnoError(ERRNO_CODES.EBADF);
                var ret = {
                  parent: null,
                  mount: { mountpoint: 'fake' },
                  node_ops: { readlink: function() { return stream.path } }
                };
                ret.parent = ret; // make it look like a simple root node
                return ret;
              }
            };
            return node;
          }
        }, {}, '/proc/self/fd');
      },createStandardStreams:function () {
        // TODO deprecate the old functionality of a single
        // input / output callback and that utilizes FS.createDevice
        // and instead require a unique set of stream ops
  
        // by default, we symlink the standard streams to the
        // default tty devices. however, if the standard streams
        // have been overwritten we create a unique device for
        // them instead.
        if (Module['stdin']) {
          FS.createDevice('/dev', 'stdin', Module['stdin']);
        } else {
          FS.symlink('/dev/tty', '/dev/stdin');
        }
        if (Module['stdout']) {
          FS.createDevice('/dev', 'stdout', null, Module['stdout']);
        } else {
          FS.symlink('/dev/tty', '/dev/stdout');
        }
        if (Module['stderr']) {
          FS.createDevice('/dev', 'stderr', null, Module['stderr']);
        } else {
          FS.symlink('/dev/tty1', '/dev/stderr');
        }
  
        // open default streams for the stdin, stdout and stderr devices
        var stdin = FS.open('/dev/stdin', 'r');
        assert(stdin.fd === 0, 'invalid handle for stdin (' + stdin.fd + ')');
  
        var stdout = FS.open('/dev/stdout', 'w');
        assert(stdout.fd === 1, 'invalid handle for stdout (' + stdout.fd + ')');
  
        var stderr = FS.open('/dev/stderr', 'w');
        assert(stderr.fd === 2, 'invalid handle for stderr (' + stderr.fd + ')');
      },ensureErrnoError:function () {
        if (FS.ErrnoError) return;
        FS.ErrnoError = function ErrnoError(errno, node) {
          //Module.printErr(stackTrace()); // useful for debugging
          this.node = node;
          this.setErrno = function(errno) {
            this.errno = errno;
            for (var key in ERRNO_CODES) {
              if (ERRNO_CODES[key] === errno) {
                this.code = key;
                break;
              }
            }
          };
          this.setErrno(errno);
          this.message = ERRNO_MESSAGES[errno];
          if (this.stack) this.stack = demangleAll(this.stack);
        };
        FS.ErrnoError.prototype = new Error();
        FS.ErrnoError.prototype.constructor = FS.ErrnoError;
        // Some errors may happen quite a bit, to avoid overhead we reuse them (and suffer a lack of stack info)
        [ERRNO_CODES.ENOENT].forEach(function(code) {
          FS.genericErrors[code] = new FS.ErrnoError(code);
          FS.genericErrors[code].stack = '<generic error, no stack>';
        });
      },staticInit:function () {
        if (ENVIRONMENT_IS_BROWSIX) {
          Module["noFSInit"] = true;
          return;
        }
  
        FS.ensureErrnoError();
  
        FS.nameTable = new Array(4096);
  
        FS.mount(MEMFS, {}, '/');
  
        FS.createDefaultDirectories();
        FS.createDefaultDevices();
        FS.createSpecialDirectories();
  
        FS.filesystems = {
          'MEMFS': MEMFS,
          'IDBFS': IDBFS,
          'NODEFS': NODEFS,
          'WORKERFS': WORKERFS,
        };
      },init:function (input, output, error) {
        assert(!FS.init.initialized, 'FS.init was previously called. If you want to initialize later with custom parameters, remove any earlier calls (note that one is automatically added to the generated code)');
        FS.init.initialized = true;
  
        FS.ensureErrnoError();
  
        // Allow Module.stdin etc. to provide defaults, if none explicitly passed to us here
        Module['stdin'] = input || Module['stdin'];
        Module['stdout'] = output || Module['stdout'];
        Module['stderr'] = error || Module['stderr'];
  
        FS.createStandardStreams();
      },quit:function () {
        FS.init.initialized = false;
        // force-flush all streams, so we get musl std streams printed out
        var fflush = Module['_fflush'];
        if (fflush) fflush(0);
        // close all of our streams
        for (var i = 0; i < FS.streams.length; i++) {
          var stream = FS.streams[i];
          if (!stream) {
            continue;
          }
          FS.close(stream);
        }
      },getMode:function (canRead, canWrite) {
        var mode = 0;
        if (canRead) mode |= 292 | 73;
        if (canWrite) mode |= 146;
        return mode;
      },joinPath:function (parts, forceRelative) {
        var path = PATH.join.apply(null, parts);
        if (forceRelative && path[0] == '/') path = path.substr(1);
        return path;
      },absolutePath:function (relative, base) {
        return PATH.resolve(base, relative);
      },standardizePath:function (path) {
        return PATH.normalize(path);
      },findObject:function (path, dontResolveLastLink) {
        var ret = FS.analyzePath(path, dontResolveLastLink);
        if (ret.exists) {
          return ret.object;
        } else {
          ___setErrNo(ret.error);
          return null;
        }
      },analyzePath:function (path, dontResolveLastLink) {
        // operate from within the context of the symlink's target
        try {
          var lookup = FS.lookupPath(path, { follow: !dontResolveLastLink });
          path = lookup.path;
        } catch (e) {
        }
        var ret = {
          isRoot: false, exists: false, error: 0, name: null, path: null, object: null,
          parentExists: false, parentPath: null, parentObject: null
        };
        try {
          var lookup = FS.lookupPath(path, { parent: true });
          ret.parentExists = true;
          ret.parentPath = lookup.path;
          ret.parentObject = lookup.node;
          ret.name = PATH.basename(path);
          lookup = FS.lookupPath(path, { follow: !dontResolveLastLink });
          ret.exists = true;
          ret.path = lookup.path;
          ret.object = lookup.node;
          ret.name = lookup.node.name;
          ret.isRoot = lookup.path === '/';
        } catch (e) {
          ret.error = e.errno;
        };
        return ret;
      },createFolder:function (parent, name, canRead, canWrite) {
        var path = PATH.join2(typeof parent === 'string' ? parent : FS.getPath(parent), name);
        var mode = FS.getMode(canRead, canWrite);
        return FS.mkdir(path, mode);
      },createPath:function (parent, path, canRead, canWrite) {
        parent = typeof parent === 'string' ? parent : FS.getPath(parent);
        var parts = path.split('/').reverse();
        while (parts.length) {
          var part = parts.pop();
          if (!part) continue;
          var current = PATH.join2(parent, part);
          try {
            FS.mkdir(current);
          } catch (e) {
            // ignore EEXIST
          }
          parent = current;
        }
        return current;
      },createFile:function (parent, name, properties, canRead, canWrite) {
        var path = PATH.join2(typeof parent === 'string' ? parent : FS.getPath(parent), name);
        var mode = FS.getMode(canRead, canWrite);
        return FS.create(path, mode);
      },createDataFile:function (parent, name, data, canRead, canWrite, canOwn) {
        var path = name ? PATH.join2(typeof parent === 'string' ? parent : FS.getPath(parent), name) : parent;
        var mode = FS.getMode(canRead, canWrite);
        var node = FS.create(path, mode);
        if (data) {
          if (typeof data === 'string') {
            var arr = new Array(data.length);
            for (var i = 0, len = data.length; i < len; ++i) arr[i] = data.charCodeAt(i);
            data = arr;
          }
          // make sure we can write to the file
          FS.chmod(node, mode | 146);
          var stream = FS.open(node, 'w');
          FS.write(stream, data, 0, data.length, 0, canOwn);
          FS.close(stream);
          FS.chmod(node, mode);
        }
        return node;
      },createDevice:function (parent, name, input, output) {
        var path = PATH.join2(typeof parent === 'string' ? parent : FS.getPath(parent), name);
        var mode = FS.getMode(!!input, !!output);
        if (!FS.createDevice.major) FS.createDevice.major = 64;
        var dev = FS.makedev(FS.createDevice.major++, 0);
        // Create a fake device that a set of stream ops to emulate
        // the old behavior.
        FS.registerDevice(dev, {
          open: function(stream) {
            stream.seekable = false;
          },
          close: function(stream) {
            // flush any pending line data
            if (output && output.buffer && output.buffer.length) {
              output(10);
            }
          },
          read: function(stream, buffer, offset, length, pos /* ignored */) {
            var bytesRead = 0;
            for (var i = 0; i < length; i++) {
              var result;
              try {
                result = input();
              } catch (e) {
                throw new FS.ErrnoError(ERRNO_CODES.EIO);
              }
              if (result === undefined && bytesRead === 0) {
                throw new FS.ErrnoError(ERRNO_CODES.EAGAIN);
              }
              if (result === null || result === undefined) break;
              bytesRead++;
              buffer[offset+i] = result;
            }
            if (bytesRead) {
              stream.node.timestamp = Date.now();
            }
            return bytesRead;
          },
          write: function(stream, buffer, offset, length, pos) {
            for (var i = 0; i < length; i++) {
              try {
                output(buffer[offset+i]);
              } catch (e) {
                throw new FS.ErrnoError(ERRNO_CODES.EIO);
              }
            }
            if (length) {
              stream.node.timestamp = Date.now();
            }
            return i;
          }
        });
        return FS.mkdev(path, mode, dev);
      },createLink:function (parent, name, target, canRead, canWrite) {
        var path = PATH.join2(typeof parent === 'string' ? parent : FS.getPath(parent), name);
        return FS.symlink(target, path);
      },forceLoadFile:function (obj) {
        if (obj.isDevice || obj.isFolder || obj.link || obj.contents) return true;
        var success = true;
        if (typeof XMLHttpRequest !== 'undefined') {
          throw new Error("Lazy loading should have been performed (contents set) in createLazyFile, but it was not. Lazy loading only works in web workers. Use --embed-file or --preload-file in emcc on the main thread.");
        } else if (Module['read']) {
          // Command-line.
          try {
            // WARNING: Can't read binary files in V8's d8 or tracemonkey's js, as
            //          read() will try to parse UTF8.
            obj.contents = intArrayFromString(Module['read'](obj.url), true);
            obj.usedBytes = obj.contents.length;
          } catch (e) {
            success = false;
          }
        } else {
          throw new Error('Cannot load without read() or XMLHttpRequest.');
        }
        if (!success) ___setErrNo(ERRNO_CODES.EIO);
        return success;
      },createLazyFile:function (parent, name, url, canRead, canWrite) {
        // Lazy chunked Uint8Array (implements get and length from Uint8Array). Actual getting is abstracted away for eventual reuse.
        function LazyUint8Array() {
          this.lengthKnown = false;
          this.chunks = []; // Loaded chunks. Index is the chunk number
        }
        LazyUint8Array.prototype.get = function LazyUint8Array_get(idx) {
          if (idx > this.length-1 || idx < 0) {
            return undefined;
          }
          var chunkOffset = idx % this.chunkSize;
          var chunkNum = (idx / this.chunkSize)|0;
          return this.getter(chunkNum)[chunkOffset];
        }
        LazyUint8Array.prototype.setDataGetter = function LazyUint8Array_setDataGetter(getter) {
          this.getter = getter;
        }
        LazyUint8Array.prototype.cacheLength = function LazyUint8Array_cacheLength() {
          // Find length
          var xhr = new XMLHttpRequest();
          xhr.open('HEAD', url, false);
          xhr.send(null);
          if (!(xhr.status >= 200 && xhr.status < 300 || xhr.status === 304)) throw new Error("Couldn't load " + url + ". Status: " + xhr.status);
          var datalength = Number(xhr.getResponseHeader("Content-length"));
          var header;
          var hasByteServing = (header = xhr.getResponseHeader("Accept-Ranges")) && header === "bytes";
          var usesGzip = (header = xhr.getResponseHeader("Content-Encoding")) && header === "gzip";
  
          var chunkSize = 1024*1024; // Chunk size in bytes
  
          if (!hasByteServing) chunkSize = datalength;
  
          // Function to get a range from the remote URL.
          var doXHR = (function(from, to) {
            if (from > to) throw new Error("invalid range (" + from + ", " + to + ") or no bytes requested!");
            if (to > datalength-1) throw new Error("only " + datalength + " bytes available! programmer error!");
  
            // TODO: Use mozResponseArrayBuffer, responseStream, etc. if available.
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, false);
            if (datalength !== chunkSize) xhr.setRequestHeader("Range", "bytes=" + from + "-" + to);
  
            // Some hints to the browser that we want binary data.
            if (typeof Uint8Array != 'undefined') xhr.responseType = 'arraybuffer';
            if (xhr.overrideMimeType) {
              xhr.overrideMimeType('text/plain; charset=x-user-defined');
            }
  
            xhr.send(null);
            if (!(xhr.status >= 200 && xhr.status < 300 || xhr.status === 304)) throw new Error("Couldn't load " + url + ". Status: " + xhr.status);
            if (xhr.response !== undefined) {
              return new Uint8Array(xhr.response || []);
            } else {
              return intArrayFromString(xhr.responseText || '', true);
            }
          });
          var lazyArray = this;
          lazyArray.setDataGetter(function(chunkNum) {
            var start = chunkNum * chunkSize;
            var end = (chunkNum+1) * chunkSize - 1; // including this byte
            end = Math.min(end, datalength-1); // if datalength-1 is selected, this is the last block
            if (typeof(lazyArray.chunks[chunkNum]) === "undefined") {
              lazyArray.chunks[chunkNum] = doXHR(start, end);
            }
            if (typeof(lazyArray.chunks[chunkNum]) === "undefined") throw new Error("doXHR failed!");
            return lazyArray.chunks[chunkNum];
          });
  
          if (usesGzip || !datalength) {
            // if the server uses gzip or doesn't supply the length, we have to download the whole file to get the (uncompressed) length
            chunkSize = datalength = 1; // this will force getter(0)/doXHR do download the whole file
            datalength = this.getter(0).length;
            chunkSize = datalength;
            console.log("LazyFiles on gzip forces download of the whole file when length is accessed");
          }
  
          this._length = datalength;
          this._chunkSize = chunkSize;
          this.lengthKnown = true;
        }
        if (typeof XMLHttpRequest !== 'undefined') {
          if (!ENVIRONMENT_IS_WORKER) throw 'Cannot do synchronous binary XHRs outside webworkers in modern browsers. Use --embed-file or --preload-file in emcc';
          var lazyArray = new LazyUint8Array();
          Object.defineProperties(lazyArray, {
            length: {
              get: function() {
                if(!this.lengthKnown) {
                  this.cacheLength();
                }
                return this._length;
              }
            },
            chunkSize: {
              get: function() {
                if(!this.lengthKnown) {
                  this.cacheLength();
                }
                return this._chunkSize;
              }
            }
          });
  
          var properties = { isDevice: false, contents: lazyArray };
        } else {
          var properties = { isDevice: false, url: url };
        }
  
        var node = FS.createFile(parent, name, properties, canRead, canWrite);
        // This is a total hack, but I want to get this lazy file code out of the
        // core of MEMFS. If we want to keep this lazy file concept I feel it should
        // be its own thin LAZYFS proxying calls to MEMFS.
        if (properties.contents) {
          node.contents = properties.contents;
        } else if (properties.url) {
          node.contents = null;
          node.url = properties.url;
        }
        // Add a function that defers querying the file size until it is asked the first time.
        Object.defineProperties(node, {
          usedBytes: {
            get: function() { return this.contents.length; }
          }
        });
        // override each stream op with one that tries to force load the lazy file first
        var stream_ops = {};
        var keys = Object.keys(node.stream_ops);
        keys.forEach(function(key) {
          var fn = node.stream_ops[key];
          stream_ops[key] = function forceLoadLazyFile() {
            if (!FS.forceLoadFile(node)) {
              throw new FS.ErrnoError(ERRNO_CODES.EIO);
            }
            return fn.apply(null, arguments);
          };
        });
        // use a custom read function
        stream_ops.read = function stream_ops_read(stream, buffer, offset, length, position) {
          if (!FS.forceLoadFile(node)) {
            throw new FS.ErrnoError(ERRNO_CODES.EIO);
          }
          var contents = stream.node.contents;
          if (position >= contents.length)
            return 0;
          var size = Math.min(contents.length - position, length);
          assert(size >= 0);
          if (contents.slice) { // normal array
            for (var i = 0; i < size; i++) {
              buffer[offset + i] = contents[position + i];
            }
          } else {
            for (var i = 0; i < size; i++) { // LazyUint8Array from sync binary XHR
              buffer[offset + i] = contents.get(position + i);
            }
          }
          return size;
        };
        node.stream_ops = stream_ops;
        return node;
      },createPreloadedFile:function (parent, name, url, canRead, canWrite, onload, onerror, dontCreateFile, canOwn, preFinish) {
        Browser.init(); // XXX perhaps this method should move onto Browser?
        // TODO we should allow people to just pass in a complete filename instead
        // of parent and name being that we just join them anyways
        var fullname = name ? PATH.resolve(PATH.join2(parent, name)) : parent;
        var dep = getUniqueRunDependency('cp ' + fullname); // might have several active requests for the same fullname
        function processData(byteArray) {
          function finish(byteArray) {
            if (preFinish) preFinish();
            if (!dontCreateFile) {
              FS.createDataFile(parent, name, byteArray, canRead, canWrite, canOwn);
            }
            if (onload) onload();
            removeRunDependency(dep);
          }
          var handled = false;
          Module['preloadPlugins'].forEach(function(plugin) {
            if (handled) return;
            if (plugin['canHandle'](fullname)) {
              plugin['handle'](byteArray, fullname, finish, function() {
                if (onerror) onerror();
                removeRunDependency(dep);
              });
              handled = true;
            }
          });
          if (!handled) finish(byteArray);
        }
        addRunDependency(dep);
        if (typeof url == 'string') {
          Browser.asyncLoad(url, function(byteArray) {
            processData(byteArray);
          }, onerror);
        } else {
          processData(url);
        }
      },indexedDB:function () {
        return window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB;
      },DB_NAME:function () {
        return 'EM_FS_' + window.location.pathname;
      },DB_VERSION:20,DB_STORE_NAME:"FILE_DATA",saveFilesToDB:function (paths, onload, onerror) {
        onload = onload || function(){};
        onerror = onerror || function(){};
        var indexedDB = FS.indexedDB();
        try {
          var openRequest = indexedDB.open(FS.DB_NAME(), FS.DB_VERSION);
        } catch (e) {
          return onerror(e);
        }
        openRequest.onupgradeneeded = function openRequest_onupgradeneeded() {
          console.log('creating db');
          var db = openRequest.result;
          db.createObjectStore(FS.DB_STORE_NAME);
        };
        openRequest.onsuccess = function openRequest_onsuccess() {
          var db = openRequest.result;
          var transaction = db.transaction([FS.DB_STORE_NAME], 'readwrite');
          var files = transaction.objectStore(FS.DB_STORE_NAME);
          var ok = 0, fail = 0, total = paths.length;
          function finish() {
            if (fail == 0) onload(); else onerror();
          }
          paths.forEach(function(path) {
            var putRequest = files.put(FS.analyzePath(path).object.contents, path);
            putRequest.onsuccess = function putRequest_onsuccess() { ok++; if (ok + fail == total) finish() };
            putRequest.onerror = function putRequest_onerror() { fail++; if (ok + fail == total) finish() };
          });
          transaction.onerror = onerror;
        };
        openRequest.onerror = onerror;
      },loadFilesFromDB:function (paths, onload, onerror) {
        onload = onload || function(){};
        onerror = onerror || function(){};
        var indexedDB = FS.indexedDB();
        try {
          var openRequest = indexedDB.open(FS.DB_NAME(), FS.DB_VERSION);
        } catch (e) {
          return onerror(e);
        }
        openRequest.onupgradeneeded = onerror; // no database to load from
        openRequest.onsuccess = function openRequest_onsuccess() {
          var db = openRequest.result;
          try {
            var transaction = db.transaction([FS.DB_STORE_NAME], 'readonly');
          } catch(e) {
            onerror(e);
            return;
          }
          var files = transaction.objectStore(FS.DB_STORE_NAME);
          var ok = 0, fail = 0, total = paths.length;
          function finish() {
            if (fail == 0) onload(); else onerror();
          }
          paths.forEach(function(path) {
            var getRequest = files.get(path);
            getRequest.onsuccess = function getRequest_onsuccess() {
              if (FS.analyzePath(path).exists) {
                FS.unlink(path);
              }
              FS.createDataFile(PATH.dirname(path), PATH.basename(path), getRequest.result, true, true, true);
              ok++;
              if (ok + fail == total) finish();
            };
            getRequest.onerror = function getRequest_onerror() { fail++; if (ok + fail == total) finish() };
          });
          transaction.onerror = onerror;
        };
        openRequest.onerror = onerror;
      }};
  
  
  
  
  
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
          let pathp = SYSCALLS.get(), bufp = SYSCALLS.get(), size = SYSCALLS.get(), err = 0;
          let shm_pathp = BROWSIX.browsix.putShmString(BROWSIX.browsix.SHM_OFF, pathp);
          let shm_bufp = BROWSIX.browsix.getShmAt(bufp, size);
          BROWSIX.browsix.copyFromUser(shm_bufp, bufp);
          err = BROWSIX.browsix.syscall.sync(185, shm_pathp, shm_bufp);
          BROWSIX.browsix.copyToUser(bufp, shm_bufp, shm_bufp.length);
          return err;
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
  	  }}};var SYSCALLS={DEFAULT_POLLMASK:5,mappings:{},umask:511,calculateAt:function (dirfd, path) {
        if (path[0] !== '/') {
          // relative path
          var dir;
          if (dirfd === -100) {
            dir = FS.cwd();
          } else {
            var dirstream = FS.getStream(dirfd);
            if (!dirstream) throw new FS.ErrnoError(ERRNO_CODES.EBADF);
            dir = dirstream.path;
          }
          path = PATH.join2(dir, path);
        }
        return path;
      },doStat:function (func, path, buf) {
        try {
          var stat = func(path);
        } catch (e) {
          if (e && e.node && PATH.normalize(path) !== PATH.normalize(FS.getPath(e.node))) {
            // an error occurred while trying to look up the path; we should just report ENOTDIR
            return -ERRNO_CODES.ENOTDIR;
          }
          throw e;
        }
        HEAP32[((buf)>>2)]=stat.dev;
        HEAP32[(((buf)+(4))>>2)]=0;
        HEAP32[(((buf)+(8))>>2)]=stat.ino;
        HEAP32[(((buf)+(12))>>2)]=stat.mode;
        HEAP32[(((buf)+(16))>>2)]=stat.nlink;
        HEAP32[(((buf)+(20))>>2)]=stat.uid;
        HEAP32[(((buf)+(24))>>2)]=stat.gid;
        HEAP32[(((buf)+(28))>>2)]=stat.rdev;
        HEAP32[(((buf)+(32))>>2)]=0;
        HEAP32[(((buf)+(36))>>2)]=stat.size;
        HEAP32[(((buf)+(40))>>2)]=4096;
        HEAP32[(((buf)+(44))>>2)]=stat.blocks;
        HEAP32[(((buf)+(48))>>2)]=(stat.atime.getTime() / 1000)|0;
        HEAP32[(((buf)+(52))>>2)]=0;
        HEAP32[(((buf)+(56))>>2)]=(stat.mtime.getTime() / 1000)|0;
        HEAP32[(((buf)+(60))>>2)]=0;
        HEAP32[(((buf)+(64))>>2)]=(stat.ctime.getTime() / 1000)|0;
        HEAP32[(((buf)+(68))>>2)]=0;
        HEAP32[(((buf)+(72))>>2)]=stat.ino;
        return 0;
      },doMsync:function (addr, stream, len, flags) {
        var buffer = new Uint8Array(HEAPU8.subarray(addr, addr + len));
        FS.msync(stream, buffer, 0, len, flags);
      },doMkdir:function (path, mode) {
        // remove a trailing slash, if one - /a/b/ has basename of '', but
        // we want to create b in the context of this function
        path = PATH.normalize(path);
        if (path[path.length-1] === '/') path = path.substr(0, path.length-1);
        FS.mkdir(path, mode, 0);
        return 0;
      },doMknod:function (path, mode, dev) {
        // we don't want this in the JS API as it uses mknod to create all nodes.
        switch (mode & 61440) {
          case 32768:
          case 8192:
          case 24576:
          case 4096:
          case 49152:
            break;
          default: return -ERRNO_CODES.EINVAL;
        }
        FS.mknod(path, mode, dev);
        return 0;
      },doReadlink:function (path, buf, bufsize) {
        if (bufsize <= 0) return -ERRNO_CODES.EINVAL;
        var ret = FS.readlink(path);
  
        var len = Math.min(bufsize, lengthBytesUTF8(ret));
        var endChar = HEAP8[buf+len];
        stringToUTF8(ret, buf, bufsize+1);
        // readlink is one of the rare functions that write out a C string, but does never append a null to the output buffer(!)
        // stringToUTF8() always appends a null byte, so restore the character under the null byte after the write.
        HEAP8[buf+len] = endChar;
  
        return len;
      },doAccess:function (path, amode) {
        if (amode & ~7) {
          // need a valid mode
          return -ERRNO_CODES.EINVAL;
        }
        var node;
        var lookup = FS.lookupPath(path, { follow: true });
        node = lookup.node;
        var perms = '';
        if (amode & 4) perms += 'r';
        if (amode & 2) perms += 'w';
        if (amode & 1) perms += 'x';
        if (perms /* otherwise, they've just passed F_OK */ && FS.nodePermissions(node, perms)) {
          return -ERRNO_CODES.EACCES;
        }
        return 0;
      },doDup:function (path, flags, suggestFD) {
        var suggest = FS.getStream(suggestFD);
        if (suggest) FS.close(suggest);
        return FS.open(path, flags, 0, suggestFD, suggestFD).fd;
      },doReadv:function (stream, iov, iovcnt, offset) {
        var ret = 0;
        for (var i = 0; i < iovcnt; i++) {
          var ptr = HEAP32[(((iov)+(i*8))>>2)];
          var len = HEAP32[(((iov)+(i*8 + 4))>>2)];
          var curr = FS.read(stream, HEAP8,ptr, len, offset);
          if (curr < 0) return -1;
          ret += curr;
          if (curr < len) break; // nothing more to read
        }
        return ret;
      },doWritev:function (stream, iov, iovcnt, offset) {
        var ret = 0;
        for (var i = 0; i < iovcnt; i++) {
          var ptr = HEAP32[(((iov)+(i*8))>>2)];
          var len = HEAP32[(((iov)+(i*8 + 4))>>2)];
          var curr = FS.write(stream, HEAP8,ptr, len, offset);
          if (curr < 0) return -1;
          ret += curr;
        }
        return ret;
      },varargs:0,get:function (varargs) {
        SYSCALLS.varargs += 4;
        var ret = HEAP32[(((SYSCALLS.varargs)-(4))>>2)];
        return ret;
      },getStr:function () {
        var ret = Pointer_stringify(SYSCALLS.get());
        return ret;
      },getStreamFromFD:function () {
        var stream = FS.getStream(SYSCALLS.get());
        if (!stream) throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        return stream;
      },getSocketFromFD:function () {
        var socket = SOCKFS.getSocket(SYSCALLS.get());
        if (!socket) throw new FS.ErrnoError(ERRNO_CODES.EBADF);
        return socket;
      },getSocketAddress:function (allowNull) {
        var addrp = SYSCALLS.get(), addrlen = SYSCALLS.get();
        if (allowNull && addrp === 0) return null;
        var info = __read_sockaddr(addrp, addrlen);
        if (info.errno) throw new FS.ErrnoError(info.errno);
        info.addr = DNS.lookup_addr(info.addr) || info.addr;
        return info;
      },get64:function () {
        var low = SYSCALLS.get(), high = SYSCALLS.get();
        if (low >= 0) assert(high === 0);
        else assert(high === -1);
        return low;
      },getZero:function () {
        assert(SYSCALLS.get() === 0);
      }};function ___syscall5(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // open
      var pathname = SYSCALLS.getStr(), flags = SYSCALLS.get(), mode = SYSCALLS.get() // optional TODO
      var stream = FS.open(pathname, flags, mode);
      return stream.fd;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___lock() {}

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

  
  
  var cttz_i8 = allocate([8,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,5,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,6,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,5,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,7,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,5,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,6,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,5,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0,4,0,1,0,2,0,1,0,3,0,1,0,2,0,1,0], "i8", ALLOC_STATIC);   

   

   

  
  function _emscripten_memcpy_big(dest, src, num) {
      HEAPU8.set(HEAPU8.subarray(src, src+num), dest);
      return dest;
    } 

  
  function __exit(status) {
      // void _exit(int status);
      // http://pubs.opengroup.org/onlinepubs/000095399/functions/exit.html
      Module['exit'](status);
    }function _exit(status) {
      __exit(status);
    }

  function ___syscall140(which, varargs) {SYSCALLS.varargs = varargs;
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
      var stream = SYSCALLS.getStreamFromFD(), iov = SYSCALLS.get(), iovcnt = SYSCALLS.get();
      return SYSCALLS.doWritev(stream, iov, iovcnt);
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall54(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // ioctl
      var stream = SYSCALLS.getStreamFromFD(), op = SYSCALLS.get();
      switch (op) {
        case 21505: {
          if (!stream.tty) return -ERRNO_CODES.ENOTTY;
          return 0;
        }
        case 21506: {
          if (!stream.tty) return -ERRNO_CODES.ENOTTY;
          return 0; // no-op, not actually adjusting terminal settings
        }
        case 21519: {
          if (!stream.tty) return -ERRNO_CODES.ENOTTY;
          var argp = SYSCALLS.get();
          HEAP32[((argp)>>2)]=0;
          return 0;
        }
        case 21520: {
          if (!stream.tty) return -ERRNO_CODES.ENOTTY;
          return -ERRNO_CODES.EINVAL; // not supported
        }
        case 21531: {
          var argp = SYSCALLS.get();
          return FS.ioctl(stream, op, argp);
        }
        case 21523: {
          // TODO: in theory we should write to the winsize struct that gets
          // passed in, but for now musl doesn't read anything on it
          if (!stream.tty) return -ERRNO_CODES.ENOTTY;
          return 0;
        }
        default: abort('bad ioctl syscall ' + op);
      }
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall221(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // fcntl64
      var stream = SYSCALLS.getStreamFromFD(), cmd = SYSCALLS.get();
      switch (cmd) {
        case 0: {
          var arg = SYSCALLS.get();
          if (arg < 0) {
            return -ERRNO_CODES.EINVAL;
          }
          var newStream;
          newStream = FS.open(stream.path, stream.flags, 0, arg);
          return newStream.fd;
        }
        case 1:
        case 2:
          return 0;  // FD_CLOEXEC makes no sense for a single process.
        case 3:
          return stream.flags;
        case 4: {
          var arg = SYSCALLS.get();
          stream.flags |= arg;
          return 0;
        }
        case 12:
        case 12: {
          var arg = SYSCALLS.get();
          var offset = 0;
          // We're always unlocked.
          HEAP16[(((arg)+(offset))>>1)]=2;
          return 0;
        }
        case 13:
        case 14:
        case 13:
        case 14:
          return 0; // Pretend that the locking is successful.
        case 16:
        case 8:
          return -ERRNO_CODES.EINVAL; // These are for sockets. We don't have them fully implemented yet.
        case 9:
          // musl trusts getown return values, due to a bug where they must be, as they overlap with errors. just return -1 here, so fnctl() returns that, and we set errno ourselves.
          ___setErrNo(ERRNO_CODES.EINVAL);
          return -1;
        default: {
          return -ERRNO_CODES.EINVAL;
        }
      }
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall145(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // readv
      var stream = SYSCALLS.getStreamFromFD(), iov = SYSCALLS.get(), iovcnt = SYSCALLS.get();
      return SYSCALLS.doReadv(stream, iov, iovcnt);
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }
FS.staticInit();__ATINIT__.unshift(function() { if (!Module["noFSInit"] && !FS.init.initialized) FS.init() });__ATMAIN__.push(function() { FS.ignorePermissions = false });__ATEXIT__.push(function() { FS.quit() });Module["FS_createFolder"] = FS.createFolder;Module["FS_createPath"] = FS.createPath;Module["FS_createDataFile"] = FS.createDataFile;Module["FS_createPreloadedFile"] = FS.createPreloadedFile;Module["FS_createLazyFile"] = FS.createLazyFile;Module["FS_createLink"] = FS.createLink;Module["FS_createDevice"] = FS.createDevice;Module["FS_unlink"] = FS.unlink;;
__ATINIT__.unshift(function() { TTY.init() });__ATEXIT__.push(function() { TTY.shutdown() });;
if (ENVIRONMENT_IS_NODE) { var fs = require("fs"); var NODEJS_PATH = require("path"); NODEFS.staticInit(); };
if (!ENVIRONMENT_IS_BROWSIX) ___buildEnvironment(ENV);;
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

Module.asmLibraryArg = { "abort": abort, "assert": assert, "enlargeMemory": enlargeMemory, "getTotalMemory": getTotalMemory, "abortOnCannotGrowMemory": abortOnCannotGrowMemory, "abortStackOverflow": abortStackOverflow, "nullFunc_ii": nullFunc_ii, "nullFunc_iiii": nullFunc_iiii, "invoke_ii": invoke_ii, "invoke_iiii": invoke_iiii, "___syscall221": ___syscall221, "___buildEnvironment": ___buildEnvironment, "___lock": ___lock, "___syscall6": ___syscall6, "___setErrNo": ___setErrNo, "___syscall140": ___syscall140, "___syscall5": ___syscall5, "_emscripten_memcpy_big": _emscripten_memcpy_big, "___syscall54": ___syscall54, "___unlock": ___unlock, "_exit": _exit, "___libc_current_sigrtmax": ___libc_current_sigrtmax, "__exit": __exit, "___syscall145": ___syscall145, "___syscall146": ___syscall146, "___libc_current_sigrtmin": ___libc_current_sigrtmin, "DYNAMICTOP_PTR": DYNAMICTOP_PTR, "tempDoublePtr": tempDoublePtr, "ABORT": ABORT, "STACKTOP": STACKTOP, "STACK_MAX": STACK_MAX, "cttz_i8": cttz_i8 };

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
  var cttz_i8=env.cttz_i8|0;

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
  var ___syscall221=env.___syscall221;
  var ___buildEnvironment=env.___buildEnvironment;
  var ___lock=env.___lock;
  var ___syscall6=env.___syscall6;
  var ___setErrNo=env.___setErrNo;
  var ___syscall140=env.___syscall140;
  var ___syscall5=env.___syscall5;
  var _emscripten_memcpy_big=env._emscripten_memcpy_big;
  var ___syscall54=env.___syscall54;
  var ___unlock=env.___unlock;
  var _exit=env._exit;
  var ___libc_current_sigrtmax=env.___libc_current_sigrtmax;
  var __exit=env.__exit;
  var ___syscall145=env.___syscall145;
  var ___syscall146=env.___syscall146;
  var ___libc_current_sigrtmin=env.___libc_current_sigrtmin;
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

function _write_signames($stream) {
 $stream = $stream|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $arrayidx = 0, $cmp = 0, $i = 0, $inc = 0, $stream$addr = 0, $vararg_buffer = 0, $vararg_buffer1 = 0, $vararg_buffer10 = 0;
 var $vararg_buffer12 = 0, $vararg_buffer14 = 0, $vararg_buffer3 = 0, $vararg_buffer5 = 0, $vararg_buffer7 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 80|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(80|0);
 $vararg_buffer14 = sp + 56|0;
 $vararg_buffer12 = sp + 48|0;
 $vararg_buffer10 = sp + 40|0;
 $vararg_buffer7 = sp + 32|0;
 $vararg_buffer5 = sp + 24|0;
 $vararg_buffer3 = sp + 16|0;
 $vararg_buffer1 = sp + 8|0;
 $vararg_buffer = sp;
 $stream$addr = $stream;
 $0 = $stream$addr;
 $1 = HEAP32[885]|0;
 HEAP32[$vararg_buffer>>2] = $1;
 (_fprintf($0,392,$vararg_buffer)|0);
 $2 = $stream$addr;
 (_fprintf($2,439,$vararg_buffer1)|0);
 $3 = $stream$addr;
 (_fprintf($3,496,$vararg_buffer3)|0);
 $4 = $stream$addr;
 (_fprintf($4,556,$vararg_buffer5)|0);
 $i = 0;
 while(1) {
  $5 = $i;
  $cmp = ($5|0)<=(67);
  $6 = $stream$addr;
  if (!($cmp)) {
   break;
  }
  $7 = $i;
  $arrayidx = (3544 + ($7<<2)|0);
  $8 = HEAP32[$arrayidx>>2]|0;
  HEAP32[$vararg_buffer7>>2] = $8;
  (_fprintf($6,590,$vararg_buffer7)|0);
  $9 = $i;
  $inc = (($9) + 1)|0;
  $i = $inc;
 }
 (_fprintf($6,601,$vararg_buffer10)|0);
 $10 = $stream$addr;
 (_fprintf($10,618,$vararg_buffer12)|0);
 $11 = $stream$addr;
 (_fprintf($11,623,$vararg_buffer14)|0);
 STACKTOP = sp;return;
}
function _main($argc,$argv) {
 $argc = $argc|0;
 $argv = $argv|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $argc$addr = 0, $argv$addr = 0, $arrayidx3 = 0, $call = 0, $cmp = 0;
 var $cmp1 = 0, $retval = 0, $stream = 0, $stream_name = 0, $tobool = 0, $vararg_buffer = 0, $vararg_buffer1 = 0, $vararg_ptr4 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 48|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(48|0);
 $vararg_buffer1 = sp + 8|0;
 $vararg_buffer = sp;
 $retval = 0;
 $argc$addr = $argc;
 $argv$addr = $argv;
 $0 = $argv$addr;
 $1 = HEAP32[$0>>2]|0;
 HEAP32[885] = $1;
 $2 = $argc$addr;
 $cmp = ($2|0)==(1);
 do {
  if ($cmp) {
   $stream_name = 655;
   $3 = HEAP32[34]|0;
   $stream = $3;
  } else {
   $4 = $argc$addr;
   $cmp1 = ($4|0)==(2);
   if ($cmp1) {
    $5 = $argv$addr;
    $arrayidx3 = ((($5)) + 4|0);
    $6 = HEAP32[$arrayidx3>>2]|0;
    $stream_name = $6;
    $7 = $stream_name;
    $call = (_fopen($7,662)|0);
    $stream = $call;
    break;
   } else {
    $8 = HEAP32[2]|0;
    $9 = HEAP32[885]|0;
    HEAP32[$vararg_buffer>>2] = $9;
    (_fprintf($8,664,$vararg_buffer)|0);
    _exit(1);
    // unreachable;
   }
  }
 } while(0);
 $10 = $stream;
 $tobool = ($10|0)!=(0|0);
 if ($tobool) {
  _initialize_signames();
  $14 = $stream;
  _write_signames($14);
  _exit(0);
  // unreachable;
 } else {
  $11 = HEAP32[2]|0;
  $12 = HEAP32[885]|0;
  $13 = $stream_name;
  HEAP32[$vararg_buffer1>>2] = $12;
  $vararg_ptr4 = ((($vararg_buffer1)) + 4|0);
  HEAP32[$vararg_ptr4>>2] = $13;
  (_fprintf($11,689,$vararg_buffer1)|0);
  _exit(2);
  // unreachable;
 }
 return (0)|0;
}
function _initialize_signames() {
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0;
 var $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0, $50 = 0, $51 = 0, $52 = 0, $53 = 0, $54 = 0, $55 = 0, $56 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add = 0, $add14 = 0, $add17 = 0;
 var $add41 = 0, $add42 = 0, $add44 = 0, $add45 = 0, $add49 = 0, $add50 = 0, $add52 = 0, $arrayidx = 0, $arrayidx1 = 0, $arrayidx13 = 0, $arrayidx15 = 0, $arrayidx18 = 0, $arrayidx23 = 0, $arrayidx25 = 0, $arrayidx29 = 0, $arrayidx3 = 0, $arrayidx43 = 0, $arrayidx46 = 0, $arrayidx51 = 0, $arrayidx60 = 0;
 var $arrayidx64 = 0, $arrayidx65 = 0, $arrayidx68 = 0, $call = 0, $call12 = 0, $call2 = 0, $call21 = 0, $call40 = 0, $call63 = 0, $cmp = 0, $cmp10 = 0, $cmp35 = 0, $cmp38 = 0, $cmp4 = 0, $cmp58 = 0, $cmp6 = 0, $cmp61 = 0, $div = 0, $div37 = 0, $i = 0;
 var $inc = 0, $inc33 = 0, $inc73 = 0, $rtcnt = 0, $rtmax = 0, $rtmin = 0, $sub = 0, $sub22 = 0, $sub24 = 0, $sub28 = 0, $sub36 = 0, $sub5 = 0, $tobool = 0, $tobool26 = 0, $tobool47 = 0, $tobool66 = 0, $vararg_buffer = 0, $vararg_buffer12 = 0, $vararg_buffer3 = 0, $vararg_buffer6 = 0;
 var $vararg_buffer9 = 0, $vararg_ptr1 = 0, $vararg_ptr2 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 64|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(64|0);
 $vararg_buffer12 = sp + 40|0;
 $vararg_buffer9 = sp + 32|0;
 $vararg_buffer6 = sp + 24|0;
 $vararg_buffer3 = sp + 16|0;
 $vararg_buffer = sp;
 $i = 1;
 while(1) {
  $0 = $i;
  $cmp = ($0>>>0)<(134);
  if (!($cmp)) {
   break;
  }
  $1 = $i;
  $arrayidx = (3544 + ($1<<2)|0);
  HEAP32[$arrayidx>>2] = 0;
  $2 = $i;
  $inc = (($2) + 1)|0;
  $i = $inc;
 }
 HEAP32[886] = 722;
 $call = (___libc_current_sigrtmin()|0);
 $rtmin = $call;
 $3 = $rtmin;
 $arrayidx1 = (3544 + ($3<<2)|0);
 HEAP32[$arrayidx1>>2] = 727;
 $call2 = (___libc_current_sigrtmax()|0);
 $rtmax = $call2;
 $4 = $rtmax;
 $arrayidx3 = (3544 + ($4<<2)|0);
 HEAP32[$arrayidx3>>2] = 736;
 $5 = $rtmax;
 $6 = $rtmin;
 $cmp4 = ($5|0)>($6|0);
 if ($cmp4) {
  $7 = $rtmax;
  $8 = $rtmin;
  $sub = (($7) - ($8))|0;
  $sub5 = (($sub) - 1)|0;
  $div = (($sub5|0) / 2)&-1;
  $rtcnt = $div;
  $9 = $rtcnt;
  $cmp6 = ($9|0)>=(128);
  if ($cmp6) {
   $rtcnt = 127;
   $10 = HEAP32[2]|0;
   $11 = HEAP32[885]|0;
   $12 = HEAP32[885]|0;
   HEAP32[$vararg_buffer>>2] = $11;
   $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
   HEAP32[$vararg_ptr1>>2] = 256;
   $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
   HEAP32[$vararg_ptr2>>2] = $12;
   (_fprintf($10,745,$vararg_buffer)|0);
  }
  $i = 1;
  while(1) {
   $13 = $i;
   $14 = $rtcnt;
   $cmp10 = ($13|0)<=($14|0);
   if (!($cmp10)) {
    break;
   }
   $call12 = (_malloc(14)|0);
   $15 = $rtmin;
   $16 = $i;
   $add = (($15) + ($16))|0;
   $arrayidx13 = (3544 + ($add<<2)|0);
   HEAP32[$arrayidx13>>2] = $call12;
   $17 = $rtmin;
   $18 = $i;
   $add14 = (($17) + ($18))|0;
   $arrayidx15 = (3544 + ($add14<<2)|0);
   $19 = HEAP32[$arrayidx15>>2]|0;
   $tobool = ($19|0)!=(0|0);
   if ($tobool) {
    $20 = $rtmin;
    $21 = $i;
    $add17 = (($20) + ($21))|0;
    $arrayidx18 = (3544 + ($add17<<2)|0);
    $22 = HEAP32[$arrayidx18>>2]|0;
    $23 = $i;
    HEAP32[$vararg_buffer3>>2] = $23;
    (_sprintf($22,798,$vararg_buffer3)|0);
   }
   $call21 = (_malloc(14)|0);
   $24 = $rtmax;
   $25 = $i;
   $sub22 = (($24) - ($25))|0;
   $arrayidx23 = (3544 + ($sub22<<2)|0);
   HEAP32[$arrayidx23>>2] = $call21;
   $26 = $rtmax;
   $27 = $i;
   $sub24 = (($26) - ($27))|0;
   $arrayidx25 = (3544 + ($sub24<<2)|0);
   $28 = HEAP32[$arrayidx25>>2]|0;
   $tobool26 = ($28|0)!=(0|0);
   if ($tobool26) {
    $29 = $rtmax;
    $30 = $i;
    $sub28 = (($29) - ($30))|0;
    $arrayidx29 = (3544 + ($sub28<<2)|0);
    $31 = HEAP32[$arrayidx29>>2]|0;
    $32 = $i;
    HEAP32[$vararg_buffer6>>2] = $32;
    (_sprintf($31,810,$vararg_buffer6)|0);
   }
   $33 = $i;
   $inc33 = (($33) + 1)|0;
   $i = $inc33;
  }
  $34 = $rtcnt;
  $cmp35 = ($34|0)<(127);
  if ($cmp35) {
   $35 = $rtcnt;
   $36 = $rtmax;
   $37 = $rtmin;
   $sub36 = (($36) - ($37))|0;
   $div37 = (($sub36|0) / 2)&-1;
   $cmp38 = ($35|0)!=($div37|0);
   if ($cmp38) {
    $call40 = (_malloc(14)|0);
    $38 = $rtmin;
    $39 = $rtcnt;
    $add41 = (($38) + ($39))|0;
    $add42 = (($add41) + 1)|0;
    $arrayidx43 = (3544 + ($add42<<2)|0);
    HEAP32[$arrayidx43>>2] = $call40;
    $40 = $rtmin;
    $41 = $rtcnt;
    $add44 = (($40) + ($41))|0;
    $add45 = (($add44) + 1)|0;
    $arrayidx46 = (3544 + ($add45<<2)|0);
    $42 = HEAP32[$arrayidx46>>2]|0;
    $tobool47 = ($42|0)!=(0|0);
    if ($tobool47) {
     $43 = $rtmin;
     $44 = $rtcnt;
     $add49 = (($43) + ($44))|0;
     $add50 = (($add49) + 1)|0;
     $arrayidx51 = (3544 + ($add50<<2)|0);
     $45 = HEAP32[$arrayidx51>>2]|0;
     $46 = $rtcnt;
     $add52 = (($46) + 1)|0;
     HEAP32[$vararg_buffer9>>2] = $add52;
     (_sprintf($45,798,$vararg_buffer9)|0);
    }
   }
  }
 }
 HEAP32[(3664)>>2] = 822;
 HEAP32[(3660)>>2] = 829;
 HEAP32[(3608)>>2] = 837;
 HEAP32[(3548)>>2] = 847;
 HEAP32[(3552)>>2] = 854;
 HEAP32[(3556)>>2] = 861;
 HEAP32[(3560)>>2] = 869;
 HEAP32[(3564)>>2] = 876;
 HEAP32[(3568)>>2] = 884;
 HEAP32[(3568)>>2] = 891;
 HEAP32[(3576)>>2] = 899;
 HEAP32[(3580)>>2] = 906;
 HEAP32[(3572)>>2] = 914;
 HEAP32[(3588)>>2] = 921;
 HEAP32[(3668)>>2] = 929;
 HEAP32[(3596)>>2] = 936;
 HEAP32[(3600)>>2] = 944;
 HEAP32[(3604)>>2] = 952;
 HEAP32[(3636)>>2] = 960;
 HEAP32[(3620)>>2] = 967;
 HEAP32[(3624)>>2] = 975;
 HEAP32[(3616)>>2] = 983;
 HEAP32[(3612)>>2] = 991;
 HEAP32[(3628)>>2] = 999;
 HEAP32[(3632)>>2] = 1007;
 HEAP32[(3660)>>2] = 1015;
 HEAP32[(3640)>>2] = 1021;
 HEAP32[(3644)>>2] = 1029;
 HEAP32[(3648)>>2] = 1037;
 HEAP32[(3652)>>2] = 1047;
 HEAP32[(3656)>>2] = 1055;
 HEAP32[(3584)>>2] = 1064;
 HEAP32[(3592)>>2] = 1072;
 $i = 0;
 while(1) {
  $47 = $i;
  $cmp58 = ($47|0)<(65);
  if (!($cmp58)) {
   break;
  }
  $48 = $i;
  $arrayidx60 = (3544 + ($48<<2)|0);
  $49 = HEAP32[$arrayidx60>>2]|0;
  $cmp61 = ($49|0)==(0|0);
  if ($cmp61) {
   $call63 = (_malloc(18)|0);
   $50 = $i;
   $arrayidx64 = (3544 + ($50<<2)|0);
   HEAP32[$arrayidx64>>2] = $call63;
   $51 = $i;
   $arrayidx65 = (3544 + ($51<<2)|0);
   $52 = HEAP32[$arrayidx65>>2]|0;
   $tobool66 = ($52|0)!=(0|0);
   if ($tobool66) {
    $53 = $i;
    $arrayidx68 = (3544 + ($53<<2)|0);
    $54 = HEAP32[$arrayidx68>>2]|0;
    $55 = $i;
    HEAP32[$vararg_buffer12>>2] = $55;
    (_sprintf($54,1080,$vararg_buffer12)|0);
   }
  }
  $56 = $i;
  $inc73 = (($56) + 1)|0;
  $i = $inc73;
 }
 HEAP32[(3804)>>2] = 1092;
 HEAP32[(3808)>>2] = 1098;
 HEAP32[(3812)>>2] = 1102;
 STACKTOP = sp;return;
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
   $0 = HEAP32[1020]|0;
   $shr3 = $0 >>> $shr;
   $and4 = $shr3 & 3;
   $cmp5 = ($and4|0)==(0);
   if (!($cmp5)) {
    $neg = $shr3 & 1;
    $and7 = $neg ^ 1;
    $add8 = (($and7) + ($shr))|0;
    $shl = $add8 << 1;
    $arrayidx = (4120 + ($shl<<2)|0);
    $1 = ((($arrayidx)) + 8|0);
    $2 = HEAP32[$1>>2]|0;
    $fd9 = ((($2)) + 8|0);
    $3 = HEAP32[$fd9>>2]|0;
    $cmp10 = ($arrayidx|0)==($3|0);
    if ($cmp10) {
     $shl12 = 1 << $add8;
     $neg13 = $shl12 ^ -1;
     $and14 = $0 & $neg13;
     HEAP32[1020] = $and14;
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
   $5 = HEAP32[(4088)>>2]|0;
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
     $arrayidx66 = (4120 + ($shl65<<2)|0);
     $6 = ((($arrayidx66)) + 8|0);
     $7 = HEAP32[$6>>2]|0;
     $fd69 = ((($7)) + 8|0);
     $8 = HEAP32[$fd69>>2]|0;
     $cmp70 = ($arrayidx66|0)==($8|0);
     if ($cmp70) {
      $shl72 = 1 << $add64;
      $neg73 = $shl72 ^ -1;
      $and74 = $0 & $neg73;
      HEAP32[1020] = $and74;
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
      $9 = HEAP32[(4100)>>2]|0;
      $shr101 = $5 >>> 3;
      $shl102 = $shr101 << 1;
      $arrayidx103 = (4120 + ($shl102<<2)|0);
      $shl105 = 1 << $shr101;
      $and106 = $10 & $shl105;
      $tobool107 = ($and106|0)==(0);
      if ($tobool107) {
       $or110 = $10 | $shl105;
       HEAP32[1020] = $or110;
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
     HEAP32[(4088)>>2] = $sub91;
     HEAP32[(4100)>>2] = $add$ptr95;
     $retval$0 = $fd69;
     STACKTOP = sp;return ($retval$0|0);
    }
    $13 = HEAP32[(4084)>>2]|0;
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
     $arrayidx$i = (4384 + ($add20$i<<2)|0);
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
        $arrayidx94$i = (4384 + ($29<<2)|0);
        $30 = HEAP32[$arrayidx94$i>>2]|0;
        $cmp95$i = ($v$0$lcssa$i|0)==($30|0);
        if ($cmp95$i) {
         HEAP32[$arrayidx94$i>>2] = $R$3$i;
         $cond$i = ($R$3$i|0)==(0|0);
         if ($cond$i) {
          $shl$i = 1 << $29;
          $neg$i = $shl$i ^ -1;
          $and103$i = $13 & $neg$i;
          HEAP32[(4084)>>2] = $and103$i;
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
        $35 = HEAP32[(4100)>>2]|0;
        $shr194$i = $5 >>> 3;
        $shl195$i = $shr194$i << 1;
        $arrayidx196$i = (4120 + ($shl195$i<<2)|0);
        $shl198$i = 1 << $shr194$i;
        $and199$i = $0 & $shl198$i;
        $tobool200$i = ($and199$i|0)==(0);
        if ($tobool200$i) {
         $or204$i = $0 | $shl198$i;
         HEAP32[1020] = $or204$i;
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
       HEAP32[(4088)>>2] = $rsize$0$lcssa$i;
       HEAP32[(4100)>>2] = $add$ptr$i;
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
    $38 = HEAP32[(4084)>>2]|0;
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
     $arrayidx$i157 = (4384 + ($idx$0$i<<2)|0);
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
       $arrayidx94$i165 = (4384 + ($add92$i<<2)|0);
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
      $47 = HEAP32[(4088)>>2]|0;
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
         $arrayidx184$i = (4384 + ($55<<2)|0);
         $56 = HEAP32[$arrayidx184$i>>2]|0;
         $cmp185$i = ($v$4$lcssa$i|0)==($56|0);
         if ($cmp185$i) {
          HEAP32[$arrayidx184$i>>2] = $R$3$i179;
          $cond2$i = ($R$3$i179|0)==(0|0);
          if ($cond2$i) {
           $shl192$i = 1 << $55;
           $neg$i181 = $shl192$i ^ -1;
           $and194$i182 = $38 & $neg$i181;
           HEAP32[(4084)>>2] = $and194$i182;
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
          $arrayidx289$i = (4120 + ($shl288$i<<2)|0);
          $61 = HEAP32[1020]|0;
          $shl291$i = 1 << $shr283$i;
          $and292$i = $61 & $shl291$i;
          $tobool293$i = ($and292$i|0)==(0);
          if ($tobool293$i) {
           $or297$i = $61 | $shl291$i;
           HEAP32[1020] = $or297$i;
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
         $arrayidx355$i = (4384 + ($I316$0$i<<2)|0);
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
          HEAP32[(4084)>>2] = $or368$i;
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
 $69 = HEAP32[(4088)>>2]|0;
 $cmp156 = ($69>>>0)<($nb$0>>>0);
 if (!($cmp156)) {
  $sub160 = (($69) - ($nb$0))|0;
  $70 = HEAP32[(4100)>>2]|0;
  $cmp162 = ($sub160>>>0)>(15);
  if ($cmp162) {
   $add$ptr166 = (($70) + ($nb$0)|0);
   HEAP32[(4100)>>2] = $add$ptr166;
   HEAP32[(4088)>>2] = $sub160;
   $or167 = $sub160 | 1;
   $head168 = ((($add$ptr166)) + 4|0);
   HEAP32[$head168>>2] = $or167;
   $add$ptr169 = (($add$ptr166) + ($sub160)|0);
   HEAP32[$add$ptr169>>2] = $sub160;
   $or172 = $nb$0 | 3;
   $head173 = ((($70)) + 4|0);
   HEAP32[$head173>>2] = $or172;
  } else {
   HEAP32[(4088)>>2] = 0;
   HEAP32[(4100)>>2] = 0;
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
 $72 = HEAP32[(4092)>>2]|0;
 $cmp186 = ($72>>>0)>($nb$0>>>0);
 if ($cmp186) {
  $sub190 = (($72) - ($nb$0))|0;
  HEAP32[(4092)>>2] = $sub190;
  $73 = HEAP32[(4104)>>2]|0;
  $add$ptr193 = (($73) + ($nb$0)|0);
  HEAP32[(4104)>>2] = $add$ptr193;
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
 $74 = HEAP32[1138]|0;
 $cmp$i = ($74|0)==(0);
 if ($cmp$i) {
  HEAP32[(4560)>>2] = 4096;
  HEAP32[(4556)>>2] = 4096;
  HEAP32[(4564)>>2] = -1;
  HEAP32[(4568)>>2] = -1;
  HEAP32[(4572)>>2] = 0;
  HEAP32[(4524)>>2] = 0;
  $75 = $magic$i$i;
  $xor$i$i = $75 & -16;
  $and6$i$i = $xor$i$i ^ 1431655768;
  HEAP32[$magic$i$i>>2] = $and6$i$i;
  HEAP32[1138] = $and6$i$i;
  $76 = 4096;
 } else {
  $$pre$i133 = HEAP32[(4560)>>2]|0;
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
 $77 = HEAP32[(4520)>>2]|0;
 $cmp15$i = ($77|0)==(0);
 if (!($cmp15$i)) {
  $78 = HEAP32[(4512)>>2]|0;
  $add17$i = (($78) + ($and11$i))|0;
  $cmp19$i = ($add17$i>>>0)<=($78>>>0);
  $cmp21$i = ($add17$i>>>0)>($77>>>0);
  $or$cond1$i = $cmp19$i | $cmp21$i;
  if ($or$cond1$i) {
   $retval$0 = 0;
   STACKTOP = sp;return ($retval$0|0);
  }
 }
 $79 = HEAP32[(4524)>>2]|0;
 $and29$i = $79 & 4;
 $tobool30$i = ($and29$i|0)==(0);
 L167: do {
  if ($tobool30$i) {
   $80 = HEAP32[(4104)>>2]|0;
   $cmp32$i137 = ($80|0)==(0|0);
   L169: do {
    if ($cmp32$i137) {
     label = 118;
    } else {
     $sp$0$i$i = (4528);
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
      $85 = HEAP32[(4556)>>2]|0;
      $sub41$i = (($85) + -1)|0;
      $and42$i = $sub41$i & $84;
      $cmp43$i = ($and42$i|0)==(0);
      $add46$i = (($sub41$i) + ($84))|0;
      $neg48$i = (0 - ($85))|0;
      $and49$i = $add46$i & $neg48$i;
      $sub50$i = (($and49$i) - ($84))|0;
      $add51$i = $cmp43$i ? 0 : $sub50$i;
      $and11$add51$i = (($add51$i) + ($and11$i))|0;
      $86 = HEAP32[(4512)>>2]|0;
      $add54$i = (($and11$add51$i) + ($86))|0;
      $cmp55$i = ($and11$add51$i>>>0)>($nb$0>>>0);
      $cmp57$i = ($and11$add51$i>>>0)<(2147483647);
      $or$cond$i = $cmp55$i & $cmp57$i;
      if ($or$cond$i) {
       $87 = HEAP32[(4520)>>2]|0;
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
     $90 = HEAP32[(4560)>>2]|0;
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
   $91 = HEAP32[(4524)>>2]|0;
   $or$i = $91 | 4;
   HEAP32[(4524)>>2] = $or$i;
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
  $92 = HEAP32[(4512)>>2]|0;
  $add150$i = (($92) + ($tsize$791$i))|0;
  HEAP32[(4512)>>2] = $add150$i;
  $93 = HEAP32[(4516)>>2]|0;
  $cmp151$i = ($add150$i>>>0)>($93>>>0);
  if ($cmp151$i) {
   HEAP32[(4516)>>2] = $add150$i;
  }
  $94 = HEAP32[(4104)>>2]|0;
  $cmp157$i = ($94|0)==(0|0);
  do {
   if ($cmp157$i) {
    $95 = HEAP32[(4096)>>2]|0;
    $cmp159$i = ($95|0)==(0|0);
    $cmp162$i = ($tbase$792$i>>>0)<($95>>>0);
    $or$cond8$i = $cmp159$i | $cmp162$i;
    if ($or$cond8$i) {
     HEAP32[(4096)>>2] = $tbase$792$i;
    }
    HEAP32[(4528)>>2] = $tbase$792$i;
    HEAP32[(4532)>>2] = $tsize$791$i;
    HEAP32[(4540)>>2] = 0;
    $96 = HEAP32[1138]|0;
    HEAP32[(4116)>>2] = $96;
    HEAP32[(4112)>>2] = -1;
    $i$01$i$i = 0;
    while(1) {
     $shl$i49$i = $i$01$i$i << 1;
     $arrayidx$i50$i = (4120 + ($shl$i49$i<<2)|0);
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
    HEAP32[(4104)>>2] = $add$ptr4$i43$i;
    HEAP32[(4092)>>2] = $sub5$i44$i;
    $or$i45$i = $sub5$i44$i | 1;
    $head$i46$i = ((($add$ptr4$i43$i)) + 4|0);
    HEAP32[$head$i46$i>>2] = $or$i45$i;
    $add$ptr6$i47$i = (($add$ptr4$i43$i) + ($sub5$i44$i)|0);
    $head7$i48$i = ((($add$ptr6$i47$i)) + 4|0);
    HEAP32[$head7$i48$i>>2] = 40;
    $101 = HEAP32[(4568)>>2]|0;
    HEAP32[(4108)>>2] = $101;
   } else {
    $sp$0104$i = (4528);
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
       $106 = HEAP32[(4092)>>2]|0;
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
       HEAP32[(4104)>>2] = $add$ptr4$i36$i;
       HEAP32[(4092)>>2] = $sub5$i$i;
       $or$i$i = $sub5$i$i | 1;
       $head$i37$i = ((($add$ptr4$i36$i)) + 4|0);
       HEAP32[$head$i37$i>>2] = $or$i$i;
       $add$ptr6$i$i = (($add$ptr4$i36$i) + ($sub5$i$i)|0);
       $head7$i$i = ((($add$ptr6$i$i)) + 4|0);
       HEAP32[$head7$i$i>>2] = 40;
       $109 = HEAP32[(4568)>>2]|0;
       HEAP32[(4108)>>2] = $109;
       break;
      }
     }
    }
    $110 = HEAP32[(4096)>>2]|0;
    $cmp218$i = ($tbase$792$i>>>0)<($110>>>0);
    if ($cmp218$i) {
     HEAP32[(4096)>>2] = $tbase$792$i;
    }
    $add$ptr227$i = (($tbase$792$i) + ($tsize$791$i)|0);
    $sp$1103$i = (4528);
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
        $119 = HEAP32[(4092)>>2]|0;
        $add$i$i = (($119) + ($sub18$i$i))|0;
        HEAP32[(4092)>>2] = $add$i$i;
        HEAP32[(4104)>>2] = $add$ptr17$i$i;
        $or22$i$i = $add$i$i | 1;
        $head23$i$i = ((($add$ptr17$i$i)) + 4|0);
        HEAP32[$head23$i$i>>2] = $or22$i$i;
       } else {
        $120 = HEAP32[(4100)>>2]|0;
        $cmp24$i$i = ($add$ptr16$i$i|0)==($120|0);
        if ($cmp24$i$i) {
         $121 = HEAP32[(4088)>>2]|0;
         $add26$i$i = (($121) + ($sub18$i$i))|0;
         HEAP32[(4088)>>2] = $add26$i$i;
         HEAP32[(4100)>>2] = $add$ptr17$i$i;
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
            $125 = HEAP32[1020]|0;
            $and49$i$i = $125 & $neg$i$i;
            HEAP32[1020] = $and49$i$i;
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
           $arrayidx123$i$i = (4384 + ($133<<2)|0);
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
             $135 = HEAP32[(4084)>>2]|0;
             $and133$i$i = $135 & $neg132$i$i;
             HEAP32[(4084)>>2] = $and133$i$i;
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
         $arrayidx223$i$i = (4120 + ($shl222$i$i<<2)|0);
         $140 = HEAP32[1020]|0;
         $shl226$i$i = 1 << $shr214$i$i;
         $and227$i$i = $140 & $shl226$i$i;
         $tobool228$i$i = ($and227$i$i|0)==(0);
         if ($tobool228$i$i) {
          $or232$i$i = $140 | $shl226$i$i;
          HEAP32[1020] = $or232$i$i;
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
        $arrayidx287$i$i = (4384 + ($I252$0$i$i<<2)|0);
        $index288$i$i = ((($add$ptr17$i$i)) + 28|0);
        HEAP32[$index288$i$i>>2] = $I252$0$i$i;
        $child289$i$i = ((($add$ptr17$i$i)) + 16|0);
        $arrayidx290$i$i = ((($child289$i$i)) + 4|0);
        HEAP32[$arrayidx290$i$i>>2] = 0;
        HEAP32[$child289$i$i>>2] = 0;
        $143 = HEAP32[(4084)>>2]|0;
        $shl294$i$i = 1 << $I252$0$i$i;
        $and295$i$i = $143 & $shl294$i$i;
        $tobool296$i$i = ($and295$i$i|0)==(0);
        if ($tobool296$i$i) {
         $or300$i$i = $143 | $shl294$i$i;
         HEAP32[(4084)>>2] = $or300$i$i;
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
    $sp$0$i$i$i = (4528);
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
    HEAP32[(4104)>>2] = $add$ptr4$i$i$i;
    HEAP32[(4092)>>2] = $sub5$i$i$i;
    $or$i$i$i = $sub5$i$i$i | 1;
    $head$i$i$i = ((($add$ptr4$i$i$i)) + 4|0);
    HEAP32[$head$i$i$i>>2] = $or$i$i$i;
    $add$ptr6$i$i$i = (($add$ptr4$i$i$i) + ($sub5$i$i$i)|0);
    $head7$i$i$i = ((($add$ptr6$i$i$i)) + 4|0);
    HEAP32[$head7$i$i$i>>2] = 40;
    $155 = HEAP32[(4568)>>2]|0;
    HEAP32[(4108)>>2] = $155;
    $head$i$i = ((($cond13$i$i)) + 4|0);
    HEAP32[$head$i$i>>2] = 27;
    ;HEAP32[$add$ptr14$i$i>>2]=HEAP32[(4528)>>2]|0;HEAP32[$add$ptr14$i$i+4>>2]=HEAP32[(4528)+4>>2]|0;HEAP32[$add$ptr14$i$i+8>>2]=HEAP32[(4528)+8>>2]|0;HEAP32[$add$ptr14$i$i+12>>2]=HEAP32[(4528)+12>>2]|0;
    HEAP32[(4528)>>2] = $tbase$792$i;
    HEAP32[(4532)>>2] = $tsize$791$i;
    HEAP32[(4540)>>2] = 0;
    HEAP32[(4536)>>2] = $add$ptr14$i$i;
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
      $arrayidx$i$i = (4120 + ($shl$i$i<<2)|0);
      $158 = HEAP32[1020]|0;
      $shl39$i$i = 1 << $shr$i$i;
      $and40$i$i = $158 & $shl39$i$i;
      $tobool$i$i = ($and40$i$i|0)==(0);
      if ($tobool$i$i) {
       $or44$i$i = $158 | $shl39$i$i;
       HEAP32[1020] = $or44$i$i;
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
     $arrayidx91$i$i = (4384 + ($I57$0$i$i<<2)|0);
     $index$i$i = ((($94)) + 28|0);
     HEAP32[$index$i$i>>2] = $I57$0$i$i;
     $arrayidx92$i$i = ((($94)) + 20|0);
     HEAP32[$arrayidx92$i$i>>2] = 0;
     HEAP32[$add$ptr81$i$i>>2] = 0;
     $161 = HEAP32[(4084)>>2]|0;
     $shl95$i$i = 1 << $I57$0$i$i;
     $and96$i$i = $161 & $shl95$i$i;
     $tobool97$i$i = ($and96$i$i|0)==(0);
     if ($tobool97$i$i) {
      $or101$i$i = $161 | $shl95$i$i;
      HEAP32[(4084)>>2] = $or101$i$i;
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
  $166 = HEAP32[(4092)>>2]|0;
  $cmp257$i = ($166>>>0)>($nb$0>>>0);
  if ($cmp257$i) {
   $sub260$i = (($166) - ($nb$0))|0;
   HEAP32[(4092)>>2] = $sub260$i;
   $167 = HEAP32[(4104)>>2]|0;
   $add$ptr262$i = (($167) + ($nb$0)|0);
   HEAP32[(4104)>>2] = $add$ptr262$i;
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
 $0 = HEAP32[(4096)>>2]|0;
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
   $3 = HEAP32[(4100)>>2]|0;
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
    HEAP32[(4088)>>2] = $add17;
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
     $6 = HEAP32[1020]|0;
     $and46 = $6 & $neg;
     HEAP32[1020] = $and46;
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
    $arrayidx130 = (4384 + ($14<<2)|0);
    $15 = HEAP32[$arrayidx130>>2]|0;
    $cmp131 = ($add$ptr16|0)==($15|0);
    if ($cmp131) {
     HEAP32[$arrayidx130>>2] = $R$3;
     $cond255 = ($R$3|0)==(0|0);
     if ($cond255) {
      $shl138 = 1 << $14;
      $neg139 = $shl138 ^ -1;
      $16 = HEAP32[(4084)>>2]|0;
      $and140 = $16 & $neg139;
      HEAP32[(4084)>>2] = $and140;
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
  $23 = HEAP32[(4104)>>2]|0;
  $cmp243 = ($add$ptr6|0)==($23|0);
  $24 = HEAP32[(4100)>>2]|0;
  if ($cmp243) {
   $25 = HEAP32[(4092)>>2]|0;
   $add246 = (($25) + ($psize$1))|0;
   HEAP32[(4092)>>2] = $add246;
   HEAP32[(4104)>>2] = $p$1;
   $or247 = $add246 | 1;
   $head248 = ((($p$1)) + 4|0);
   HEAP32[$head248>>2] = $or247;
   $cmp249 = ($p$1|0)==($24|0);
   if (!($cmp249)) {
    return;
   }
   HEAP32[(4100)>>2] = 0;
   HEAP32[(4088)>>2] = 0;
   return;
  }
  $cmp255 = ($add$ptr6|0)==($24|0);
  if ($cmp255) {
   $26 = HEAP32[(4088)>>2]|0;
   $add258 = (($26) + ($psize$1))|0;
   HEAP32[(4088)>>2] = $add258;
   HEAP32[(4100)>>2] = $21;
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
     $29 = HEAP32[1020]|0;
     $and301 = $29 & $neg300;
     HEAP32[1020] = $and301;
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
     $arrayidx400 = (4384 + ($37<<2)|0);
     $38 = HEAP32[$arrayidx400>>2]|0;
     $cmp401 = ($add$ptr6|0)==($38|0);
     if ($cmp401) {
      HEAP32[$arrayidx400>>2] = $R332$3;
      $cond256 = ($R332$3|0)==(0|0);
      if ($cond256) {
       $shl408 = 1 << $37;
       $neg409 = $shl408 ^ -1;
       $39 = HEAP32[(4084)>>2]|0;
       $and410 = $39 & $neg409;
       HEAP32[(4084)>>2] = $and410;
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
  $43 = HEAP32[(4100)>>2]|0;
  $cmp484 = ($p$1|0)==($43|0);
  if ($cmp484) {
   HEAP32[(4088)>>2] = $add267;
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
  $arrayidx509 = (4120 + ($shl508<<2)|0);
  $44 = HEAP32[1020]|0;
  $shl511 = 1 << $shr501;
  $and512 = $44 & $shl511;
  $tobool513 = ($and512|0)==(0);
  if ($tobool513) {
   $or516 = $44 | $shl511;
   HEAP32[1020] = $or516;
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
 $arrayidx567 = (4384 + ($I534$0<<2)|0);
 $index568 = ((($p$1)) + 28|0);
 HEAP32[$index568>>2] = $I534$0;
 $child569 = ((($p$1)) + 16|0);
 $arrayidx570 = ((($p$1)) + 20|0);
 HEAP32[$arrayidx570>>2] = 0;
 HEAP32[$child569>>2] = 0;
 $47 = HEAP32[(4084)>>2]|0;
 $shl573 = 1 << $I534$0;
 $and574 = $47 & $shl573;
 $tobool575 = ($and574|0)==(0);
 do {
  if ($tobool575) {
   $or578 = $47 | $shl573;
   HEAP32[(4084)>>2] = $or578;
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
 $52 = HEAP32[(4112)>>2]|0;
 $dec = (($52) + -1)|0;
 HEAP32[(4112)>>2] = $dec;
 $cmp640 = ($dec|0)==(0);
 if ($cmp640) {
  $sp$0$in$i = (4536);
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
 HEAP32[(4112)>>2] = -1;
 return;
}
function ___emscripten_pthread_data_constructor() {
 var $call = 0, $locale = 0, label = 0, sp = 0;
 sp = STACKTOP;
 $call = (_pthread_self()|0);
 $locale = ((($call)) + 188|0);
 HEAP32[$locale>>2] = (4616);
 return;
}
function _pthread_self() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 return (4640|0);
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
function ___stdio_read($f,$buf,$len) {
 $f = $f|0;
 $buf = $buf|0;
 $len = $len|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add$ptr = 0, $and = 0, $arrayidx21 = 0, $arrayinit$element = 0;
 var $buf$addr = 0, $buf14 = 0, $buf15 = 0, $buf3 = 0, $buf_size = 0, $buf_size16 = 0, $buf_size5 = 0, $call = 0, $call6 = 0, $cmp = 0, $cmp8 = 0, $cnt = 0, $f$addr = 0, $fd = 0, $incdec$ptr = 0, $iov = 0, $iov_len = 0, $iov_len12 = 0, $iov_len4 = 0, $iov_len7 = 0;
 var $len$addr = 0, $lnot = 0, $lnot$ext = 0, $lnot1 = 0, $or = 0, $rend = 0, $retval = 0, $rpos = 0, $rpos19 = 0, $sub = 0, $sub13 = 0, $sub20 = 0, $tobool = 0, $tobool17 = 0, $vararg_buffer = 0, $vararg_ptr1 = 0, $vararg_ptr2 = 0, $xor = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 48|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(48|0);
 $vararg_buffer = sp;
 $iov = sp + 16|0;
 $f$addr = $f;
 $buf$addr = $buf;
 $len$addr = $len;
 $0 = $buf$addr;
 HEAP32[$iov>>2] = $0;
 $iov_len = ((($iov)) + 4|0);
 $1 = $len$addr;
 $2 = $f$addr;
 $buf_size = ((($2)) + 48|0);
 $3 = HEAP32[$buf_size>>2]|0;
 $tobool = ($3|0)!=(0);
 $lnot = $tobool ^ 1;
 $lnot1 = $lnot ^ 1;
 $lnot$ext = $lnot1&1;
 $sub = (($1) - ($lnot$ext))|0;
 HEAP32[$iov_len>>2] = $sub;
 $arrayinit$element = ((($iov)) + 8|0);
 $4 = $f$addr;
 $buf3 = ((($4)) + 44|0);
 $5 = HEAP32[$buf3>>2]|0;
 HEAP32[$arrayinit$element>>2] = $5;
 $iov_len4 = ((($arrayinit$element)) + 4|0);
 $6 = $f$addr;
 $buf_size5 = ((($6)) + 48|0);
 $7 = HEAP32[$buf_size5>>2]|0;
 HEAP32[$iov_len4>>2] = $7;
 $8 = $f$addr;
 $fd = ((($8)) + 60|0);
 $9 = HEAP32[$fd>>2]|0;
 $10 = $iov;
 HEAP32[$vararg_buffer>>2] = $9;
 $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
 HEAP32[$vararg_ptr1>>2] = $10;
 $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
 HEAP32[$vararg_ptr2>>2] = 2;
 $call = (___syscall145(145,($vararg_buffer|0))|0);
 $call6 = (___syscall_ret($call)|0);
 $cnt = $call6;
 $11 = $cnt;
 $cmp = ($11|0)<=(0);
 $12 = $cnt;
 if ($cmp) {
  $and = 48 & $12;
  $xor = 16 ^ $and;
  $13 = $f$addr;
  $14 = HEAP32[$13>>2]|0;
  $or = $14 | $xor;
  HEAP32[$13>>2] = $or;
  $15 = $cnt;
  $retval = $15;
  $35 = $retval;
  STACKTOP = sp;return ($35|0);
 }
 $iov_len7 = ((($iov)) + 4|0);
 $16 = HEAP32[$iov_len7>>2]|0;
 $cmp8 = ($12>>>0)<=($16>>>0);
 if ($cmp8) {
  $17 = $cnt;
  $retval = $17;
  $35 = $retval;
  STACKTOP = sp;return ($35|0);
 }
 $iov_len12 = ((($iov)) + 4|0);
 $18 = HEAP32[$iov_len12>>2]|0;
 $19 = $cnt;
 $sub13 = (($19) - ($18))|0;
 $cnt = $sub13;
 $20 = $f$addr;
 $buf14 = ((($20)) + 44|0);
 $21 = HEAP32[$buf14>>2]|0;
 $22 = $f$addr;
 $rpos = ((($22)) + 4|0);
 HEAP32[$rpos>>2] = $21;
 $23 = $f$addr;
 $buf15 = ((($23)) + 44|0);
 $24 = HEAP32[$buf15>>2]|0;
 $25 = $cnt;
 $add$ptr = (($24) + ($25)|0);
 $26 = $f$addr;
 $rend = ((($26)) + 8|0);
 HEAP32[$rend>>2] = $add$ptr;
 $27 = $f$addr;
 $buf_size16 = ((($27)) + 48|0);
 $28 = HEAP32[$buf_size16>>2]|0;
 $tobool17 = ($28|0)!=(0);
 if ($tobool17) {
  $29 = $f$addr;
  $rpos19 = ((($29)) + 4|0);
  $30 = HEAP32[$rpos19>>2]|0;
  $incdec$ptr = ((($30)) + 1|0);
  HEAP32[$rpos19>>2] = $incdec$ptr;
  $31 = HEAP8[$30>>0]|0;
  $32 = $buf$addr;
  $33 = $len$addr;
  $sub20 = (($33) - 1)|0;
  $arrayidx21 = (($32) + ($sub20)|0);
  HEAP8[$arrayidx21>>0] = $31;
 }
 $34 = $len$addr;
 $retval = $34;
 $35 = $retval;
 STACKTOP = sp;return ($35|0);
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
 HEAP32[$write>>2] = 2;
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
 return (4576|0);
}
function _memchr($src,$c,$n) {
 $src = $src|0;
 $c = $c|0;
 $n = $n|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $and = 0, $and15 = 0, $and16 = 0, $c$addr = 0, $cmp = 0, $cmp11 = 0;
 var $cmp28 = 0, $cmp8 = 0, $cond = 0, $conv = 0, $conv1 = 0, $conv27 = 0, $conv3 = 0, $conv7 = 0, $dec = 0, $dec34 = 0, $incdec$ptr = 0, $incdec$ptr21 = 0, $incdec$ptr33 = 0, $k = 0, $lnot = 0, $mul = 0, $n$addr = 0, $neg = 0, $or$cond = 0, $s = 0;
 var $src$addr = 0, $sub = 0, $sub22 = 0, $tobool = 0, $tobool17 = 0, $tobool2 = 0, $tobool25 = 0, $tobool36 = 0, $tobool5 = 0, $w = 0, $xor = 0, $xor14 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $src$addr = $src;
 $c$addr = $c;
 $n$addr = $n;
 $0 = $src$addr;
 $s = $0;
 $1 = $c$addr;
 $conv = $1&255;
 $conv1 = $conv&255;
 $c$addr = $conv1;
 while(1) {
  $2 = $s;
  $3 = $2;
  $and = $3 & 3;
  $tobool = ($and|0)!=(0);
  $4 = $n$addr;
  $tobool2 = ($4|0)!=(0);
  $or$cond = $tobool & $tobool2;
  if (!($or$cond)) {
   break;
  }
  $5 = $s;
  $6 = HEAP8[$5>>0]|0;
  $conv3 = $6&255;
  $7 = $c$addr;
  $cmp = ($conv3|0)!=($7|0);
  if (!($cmp)) {
   break;
  }
  $8 = $s;
  $incdec$ptr = ((($8)) + 1|0);
  $s = $incdec$ptr;
  $9 = $n$addr;
  $dec = (($9) + -1)|0;
  $n$addr = $dec;
 }
 $10 = $n$addr;
 $tobool5 = ($10|0)!=(0);
 L6: do {
  if ($tobool5) {
   $11 = $s;
   $12 = HEAP8[$11>>0]|0;
   $conv7 = $12&255;
   $13 = $c$addr;
   $cmp8 = ($conv7|0)!=($13|0);
   if ($cmp8) {
    $14 = $c$addr;
    $mul = Math_imul(16843009, $14)|0;
    $k = $mul;
    $15 = $s;
    $w = $15;
    while(1) {
     $16 = $n$addr;
     $cmp11 = ($16>>>0)>=(4);
     if (!($cmp11)) {
      break;
     }
     $17 = $w;
     $18 = HEAP32[$17>>2]|0;
     $19 = $k;
     $xor = $18 ^ $19;
     $sub = (($xor) - 16843009)|0;
     $20 = $w;
     $21 = HEAP32[$20>>2]|0;
     $22 = $k;
     $xor14 = $21 ^ $22;
     $neg = $xor14 ^ -1;
     $and15 = $sub & $neg;
     $and16 = $and15 & -2139062144;
     $tobool17 = ($and16|0)!=(0);
     $lnot = $tobool17 ^ 1;
     if (!($lnot)) {
      break;
     }
     $23 = $w;
     $incdec$ptr21 = ((($23)) + 4|0);
     $w = $incdec$ptr21;
     $24 = $n$addr;
     $sub22 = (($24) - 4)|0;
     $n$addr = $sub22;
    }
    $25 = $w;
    $s = $25;
    while(1) {
     $26 = $n$addr;
     $tobool25 = ($26|0)!=(0);
     if (!($tobool25)) {
      break L6;
     }
     $27 = $s;
     $28 = HEAP8[$27>>0]|0;
     $conv27 = $28&255;
     $29 = $c$addr;
     $cmp28 = ($conv27|0)!=($29|0);
     if (!($cmp28)) {
      break L6;
     }
     $30 = $s;
     $incdec$ptr33 = ((($30)) + 1|0);
     $s = $incdec$ptr33;
     $31 = $n$addr;
     $dec34 = (($31) + -1)|0;
     $n$addr = $dec34;
    }
   }
  }
 } while(0);
 $32 = $n$addr;
 $tobool36 = ($32|0)!=(0);
 $33 = $s;
 $cond = $tobool36 ? $33 : 0;
 STACKTOP = sp;return ($cond|0);
}
function _strcmp($l,$r) {
 $l = $l|0;
 $r = $r|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $cmp = 0, $conv = 0, $conv1 = 0, $conv3 = 0, $conv5 = 0, $conv6 = 0, $incdec$ptr = 0, $incdec$ptr4 = 0;
 var $l$addr = 0, $r$addr = 0, $sub = 0, $tobool = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $l$addr = $l;
 $r$addr = $r;
 while(1) {
  $0 = $l$addr;
  $1 = HEAP8[$0>>0]|0;
  $conv = $1 << 24 >> 24;
  $2 = $r$addr;
  $3 = HEAP8[$2>>0]|0;
  $conv1 = $3 << 24 >> 24;
  $cmp = ($conv|0)==($conv1|0);
  if (!($cmp)) {
   break;
  }
  $4 = $l$addr;
  $5 = HEAP8[$4>>0]|0;
  $conv3 = $5 << 24 >> 24;
  $tobool = ($conv3|0)!=(0);
  if (!($tobool)) {
   break;
  }
  $6 = $l$addr;
  $incdec$ptr = ((($6)) + 1|0);
  $l$addr = $incdec$ptr;
  $7 = $r$addr;
  $incdec$ptr4 = ((($7)) + 1|0);
  $r$addr = $incdec$ptr4;
 }
 $8 = $l$addr;
 $9 = HEAP8[$8>>0]|0;
 $conv5 = $9&255;
 $10 = $r$addr;
 $11 = HEAP8[$10>>0]|0;
 $conv6 = $11&255;
 $sub = (($conv5) - ($conv6))|0;
 STACKTOP = sp;return ($sub|0);
}
function _isdigit($c) {
 $c = $c|0;
 var $0 = 0, $c$addr = 0, $cmp = 0, $conv = 0, $sub = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $c$addr = $c;
 $0 = $c$addr;
 $sub = (($0) - 48)|0;
 $cmp = ($sub>>>0)<(10);
 $conv = $cmp&1;
 STACKTOP = sp;return ($conv|0);
}
function _sprintf($s,$fmt,$varargs) {
 $s = $s|0;
 $fmt = $fmt|0;
 $varargs = $varargs|0;
 var $0 = 0, $1 = 0, $2 = 0, $ap = 0, $call = 0, $fmt$addr = 0, $ret = 0, $s$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $ap = sp;
 $s$addr = $s;
 $fmt$addr = $fmt;
 HEAP32[$ap>>2] = $varargs;
 $0 = $s$addr;
 $1 = $fmt$addr;
 $call = (_vsprintf($0,$1,$ap)|0);
 $ret = $call;
 $2 = $ret;
 STACKTOP = sp;return ($2|0);
}
function _vsprintf($s,$fmt,$ap) {
 $s = $s|0;
 $fmt = $fmt|0;
 $ap = $ap|0;
 var $0 = 0, $1 = 0, $2 = 0, $ap$addr = 0, $call = 0, $fmt$addr = 0, $s$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $s$addr = $s;
 $fmt$addr = $fmt;
 $ap$addr = $ap;
 $0 = $s$addr;
 $1 = $fmt$addr;
 $2 = $ap$addr;
 $call = (_vsnprintf($0,2147483647,$1,$2)|0);
 STACKTOP = sp;return ($call|0);
}
function _vsnprintf($s,$n,$fmt,$ap) {
 $s = $s|0;
 $n = $n|0;
 $fmt = $fmt|0;
 $ap = $ap|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add$ptr = 0, $ap$addr = 0, $arrayidx = 0;
 var $b = 0, $buf = 0, $buf_size = 0, $call = 0, $call10 = 0, $cmp = 0, $cmp16 = 0, $cmp4 = 0, $conv = 0, $f = 0, $fmt$addr = 0, $n$addr = 0, $r = 0, $retval = 0, $s$addr = 0, $sub = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$rhs$cast6 = 0, $sub$ptr$sub = 0, $sub$ptr$sub7 = 0;
 var $sub17 = 0, $sub3 = 0, $sub8 = 0, $tobool = 0, $tobool11 = 0, $wbase = 0, $wend = 0, $wend15 = 0, $wpos = 0, $wpos13 = 0, $wpos14 = 0, dest = 0, label = 0, sp = 0, src = 0, stop = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 160|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(160|0);
 $b = sp + 148|0;
 $f = sp;
 $s$addr = $s;
 $n$addr = $n;
 $fmt$addr = $fmt;
 $ap$addr = $ap;
 dest=$f; src=268; stop=dest+124|0; do { HEAP32[dest>>2]=HEAP32[src>>2]|0; dest=dest+4|0; src=src+4|0; } while ((dest|0) < (stop|0));
 $0 = $n$addr;
 $sub = (($0) - 1)|0;
 $cmp = ($sub>>>0)>(2147483646);
 do {
  if ($cmp) {
   $1 = $n$addr;
   $tobool = ($1|0)!=(0);
   if (!($tobool)) {
    $s$addr = $b;
    $n$addr = 1;
    break;
   }
   $call = (___errno_location()|0);
   HEAP32[$call>>2] = 75;
   $retval = -1;
   $16 = $retval;
   STACKTOP = sp;return ($16|0);
  }
 } while(0);
 $2 = $n$addr;
 $3 = $s$addr;
 $sub$ptr$rhs$cast = $3;
 $sub$ptr$sub = ((Math_imul(((((0) + 1|0))), -1)|0) - ($sub$ptr$rhs$cast))|0;
 $sub3 = (($sub$ptr$sub) - 1)|0;
 $cmp4 = ($2>>>0)>($sub3>>>0);
 if ($cmp4) {
  $4 = $s$addr;
  $sub$ptr$rhs$cast6 = $4;
  $sub$ptr$sub7 = ((Math_imul(((((0) + 1|0))), -1)|0) - ($sub$ptr$rhs$cast6))|0;
  $sub8 = (($sub$ptr$sub7) - 1)|0;
  $n$addr = $sub8;
 }
 $5 = $n$addr;
 $buf_size = ((($f)) + 48|0);
 HEAP32[$buf_size>>2] = $5;
 $6 = $s$addr;
 $wpos = ((($f)) + 20|0);
 HEAP32[$wpos>>2] = $6;
 $buf = ((($f)) + 44|0);
 HEAP32[$buf>>2] = $6;
 $7 = $s$addr;
 $8 = $n$addr;
 $add$ptr = (($7) + ($8)|0);
 $wend = ((($f)) + 16|0);
 HEAP32[$wend>>2] = $add$ptr;
 $wbase = ((($f)) + 28|0);
 HEAP32[$wbase>>2] = $add$ptr;
 $9 = $fmt$addr;
 $10 = $ap$addr;
 $call10 = (_vfprintf($f,$9,$10)|0);
 $r = $call10;
 $11 = $n$addr;
 $tobool11 = ($11|0)!=(0);
 if ($tobool11) {
  $wpos13 = ((($f)) + 20|0);
  $12 = HEAP32[$wpos13>>2]|0;
  $wpos14 = ((($f)) + 20|0);
  $13 = HEAP32[$wpos14>>2]|0;
  $wend15 = ((($f)) + 16|0);
  $14 = HEAP32[$wend15>>2]|0;
  $cmp16 = ($13|0)==($14|0);
  $conv = $cmp16&1;
  $sub17 = (0 - ($conv))|0;
  $arrayidx = (($12) + ($sub17)|0);
  HEAP8[$arrayidx>>0] = 0;
 }
 $15 = $r;
 $retval = $15;
 $16 = $retval;
 STACKTOP = sp;return ($16|0);
}
function _vfprintf($f,$fmt,$ap) {
 $f = $f|0;
 $fmt = $fmt|0;
 $ap = $ap|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $5 = 0, $6 = 0;
 var $7 = 0, $8 = 0, $9 = 0, $__need_unlock = 0, $add$ptr = 0, $and = 0, $and11 = 0, $and36 = 0, $ap$addr = 0, $ap2 = 0, $buf = 0, $buf15 = 0, $buf29 = 0, $buf_size = 0, $buf_size16 = 0, $buf_size30 = 0, $call = 0, $call21 = 0, $call6 = 0, $cmp = 0;
 var $cmp5 = 0, $cmp7 = 0, $cond = 0, $conv = 0, $f$addr = 0, $fmt$addr = 0, $internal_buf = 0, $lock = 0, $mode = 0, $nl_arg = 0, $nl_type = 0, $olderr = 0, $or = 0, $ret = 0, $retval = 0, $saved_buf = 0, $tobool = 0, $tobool22 = 0, $tobool26 = 0, $tobool37 = 0;
 var $tobool41 = 0, $vacopy_currentptr = 0, $wbase = 0, $wbase32 = 0, $wend = 0, $wend31 = 0, $wpos = 0, $wpos25 = 0, $wpos33 = 0, $write = 0, dest = 0, label = 0, sp = 0, stop = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 256|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(256|0);
 $ap2 = sp + 136|0;
 $nl_type = sp + 96|0;
 $nl_arg = sp;
 $internal_buf = sp + 168|0;
 $f$addr = $f;
 $fmt$addr = $fmt;
 $ap$addr = $ap;
 dest=$nl_type; stop=dest+40|0; do { HEAP32[dest>>2]=0|0; dest=dest+4|0; } while ((dest|0) < (stop|0));
 $saved_buf = 0;
 $0 = $ap$addr;
 $vacopy_currentptr = HEAP32[$0>>2]|0;
 HEAP32[$ap2>>2] = $vacopy_currentptr;
 $1 = $fmt$addr;
 $call = (_printf_core(0,$1,$ap2,$nl_arg,$nl_type)|0);
 $cmp = ($call|0)<(0);
 if ($cmp) {
  $retval = -1;
  $42 = $retval;
  STACKTOP = sp;return ($42|0);
 }
 $2 = $f$addr;
 $lock = ((($2)) + 76|0);
 $3 = HEAP32[$lock>>2]|0;
 $cmp5 = ($3|0)>=(0);
 if ($cmp5) {
  $4 = $f$addr;
  $call6 = (___lockfile($4)|0);
  $cond = $call6;
 } else {
  $cond = 0;
 }
 $__need_unlock = $cond;
 $5 = $f$addr;
 $6 = HEAP32[$5>>2]|0;
 $and = $6 & 32;
 $olderr = $and;
 $7 = $f$addr;
 $mode = ((($7)) + 74|0);
 $8 = HEAP8[$mode>>0]|0;
 $conv = $8 << 24 >> 24;
 $cmp7 = ($conv|0)<(1);
 if ($cmp7) {
  $9 = $f$addr;
  $10 = HEAP32[$9>>2]|0;
  $and11 = $10 & -33;
  HEAP32[$9>>2] = $and11;
 }
 $11 = $f$addr;
 $buf_size = ((($11)) + 48|0);
 $12 = HEAP32[$buf_size>>2]|0;
 $tobool = ($12|0)!=(0);
 if (!($tobool)) {
  $13 = $f$addr;
  $buf = ((($13)) + 44|0);
  $14 = HEAP32[$buf>>2]|0;
  $saved_buf = $14;
  $15 = $f$addr;
  $buf15 = ((($15)) + 44|0);
  HEAP32[$buf15>>2] = $internal_buf;
  $16 = $f$addr;
  $wbase = ((($16)) + 28|0);
  HEAP32[$wbase>>2] = $internal_buf;
  $17 = $f$addr;
  $wpos = ((($17)) + 20|0);
  HEAP32[$wpos>>2] = $internal_buf;
  $18 = $f$addr;
  $buf_size16 = ((($18)) + 48|0);
  HEAP32[$buf_size16>>2] = 80;
  $add$ptr = ((($internal_buf)) + 80|0);
  $19 = $f$addr;
  $wend = ((($19)) + 16|0);
  HEAP32[$wend>>2] = $add$ptr;
 }
 $20 = $f$addr;
 $21 = $fmt$addr;
 $call21 = (_printf_core($20,$21,$ap2,$nl_arg,$nl_type)|0);
 $ret = $call21;
 $22 = $saved_buf;
 $tobool22 = ($22|0)!=(0|0);
 if ($tobool22) {
  $23 = $f$addr;
  $write = ((($23)) + 36|0);
  $24 = HEAP32[$write>>2]|0;
  $25 = $f$addr;
  (FUNCTION_TABLE_iiii[$24 & 7]($25,0,0)|0);
  $26 = $f$addr;
  $wpos25 = ((($26)) + 20|0);
  $27 = HEAP32[$wpos25>>2]|0;
  $tobool26 = ($27|0)!=(0|0);
  if (!($tobool26)) {
   $ret = -1;
  }
  $28 = $saved_buf;
  $29 = $f$addr;
  $buf29 = ((($29)) + 44|0);
  HEAP32[$buf29>>2] = $28;
  $30 = $f$addr;
  $buf_size30 = ((($30)) + 48|0);
  HEAP32[$buf_size30>>2] = 0;
  $31 = $f$addr;
  $wend31 = ((($31)) + 16|0);
  HEAP32[$wend31>>2] = 0;
  $32 = $f$addr;
  $wbase32 = ((($32)) + 28|0);
  HEAP32[$wbase32>>2] = 0;
  $33 = $f$addr;
  $wpos33 = ((($33)) + 20|0);
  HEAP32[$wpos33>>2] = 0;
 }
 $34 = $f$addr;
 $35 = HEAP32[$34>>2]|0;
 $and36 = $35 & 32;
 $tobool37 = ($and36|0)!=(0);
 if ($tobool37) {
  $ret = -1;
 }
 $36 = $olderr;
 $37 = $f$addr;
 $38 = HEAP32[$37>>2]|0;
 $or = $38 | $36;
 HEAP32[$37>>2] = $or;
 $39 = $__need_unlock;
 $tobool41 = ($39|0)!=(0);
 if ($tobool41) {
  $40 = $f$addr;
  ___unlockfile($40);
 }
 $41 = $ret;
 $retval = $41;
 $42 = $retval;
 STACKTOP = sp;return ($42|0);
}
function _printf_core($f,$fmt,$ap,$nl_arg,$nl_type) {
 $f = $f|0;
 $fmt = $fmt|0;
 $ap = $ap|0;
 $nl_arg = $nl_arg|0;
 $nl_type = $nl_type|0;
 var $0 = 0, $1 = 0, $10 = 0, $100 = 0, $101 = 0, $102 = 0, $103 = 0, $104 = 0, $105 = 0, $106 = 0, $107 = 0, $108 = 0, $109 = 0, $11 = 0, $110 = 0, $111 = 0, $112 = 0, $113 = 0, $114 = 0, $115 = 0;
 var $116 = 0, $117 = 0, $118 = 0, $119 = 0, $12 = 0, $120 = 0, $121 = 0, $122 = 0, $123 = 0, $124 = 0, $125 = 0, $126 = 0, $127 = 0, $128 = 0, $129 = 0, $13 = 0, $130 = 0, $131 = 0, $132 = 0, $133 = 0;
 var $134 = 0, $135 = 0, $136 = 0, $137 = 0, $138 = 0, $139 = 0, $14 = 0, $140 = 0, $141 = 0, $142 = 0, $143 = 0, $144 = 0, $145 = 0, $146 = 0, $147 = 0, $148 = 0, $149 = 0, $15 = 0, $150 = 0, $151 = 0;
 var $152 = 0, $153 = 0, $154 = 0, $155 = 0, $156 = 0, $157 = 0, $158 = 0, $159 = 0, $16 = 0, $160 = 0, $161 = 0, $162 = 0, $163 = 0, $164 = 0, $165 = 0, $166 = 0, $167 = 0, $168 = 0, $169 = 0, $17 = 0;
 var $170 = 0, $171 = 0, $172 = 0, $173 = 0, $174 = 0, $175 = 0, $176 = 0, $177 = 0, $178 = 0, $179 = 0, $18 = 0, $180 = 0, $181 = 0, $182 = 0, $183 = 0, $184 = 0, $185 = 0, $186 = 0, $187 = 0, $188 = 0;
 var $189 = 0, $19 = 0, $190 = 0, $191 = 0, $192 = 0, $193 = 0, $194 = 0, $195 = 0, $196 = 0, $197 = 0, $198 = 0, $199 = 0, $2 = 0, $20 = 0, $200 = 0, $201 = 0, $202 = 0, $203 = 0, $204 = 0, $205 = 0;
 var $206 = 0, $207 = 0, $208 = 0, $209 = 0, $21 = 0, $210 = 0, $211 = 0, $212 = 0, $213 = 0, $214 = 0, $215 = 0, $216 = 0, $217 = 0, $218 = 0, $219 = 0, $22 = 0, $220 = 0, $221 = 0, $222 = 0, $223 = 0;
 var $224 = 0, $225 = 0, $226 = 0, $227 = 0, $228 = 0, $229 = 0, $23 = 0, $230 = 0, $231 = 0, $232 = 0, $233 = 0, $234 = 0, $235 = 0, $236 = 0, $237 = 0, $238 = 0, $239 = 0, $24 = 0, $240 = 0, $241 = 0;
 var $242 = 0, $243 = 0, $244 = 0, $245 = 0, $246 = 0, $247 = 0, $248 = 0, $249 = 0, $25 = 0, $250 = 0, $251 = 0, $252 = 0, $253 = 0, $254 = 0, $255 = 0, $256 = 0, $257 = 0, $258 = 0, $259 = 0, $26 = 0;
 var $260 = 0, $261 = 0, $262 = 0, $263 = 0, $264 = 0, $265 = 0, $266 = 0, $267 = 0, $268 = 0, $269 = 0, $27 = 0, $270 = 0, $271 = 0, $272 = 0, $273 = 0, $274 = 0, $275 = 0, $276 = 0, $277 = 0, $278 = 0;
 var $279 = 0, $28 = 0, $280 = 0, $281 = 0, $282 = 0, $283 = 0, $284 = 0, $285 = 0, $286 = 0, $287 = 0, $288 = 0, $289 = 0, $29 = 0, $290 = 0, $291 = 0, $292 = 0, $293 = 0, $294 = 0, $295 = 0, $296 = 0;
 var $297 = 0, $298 = 0, $299 = 0, $3 = 0, $30 = 0, $300 = 0, $301 = 0, $302 = 0, $303 = 0, $304 = 0, $305 = 0, $306 = 0, $307 = 0, $308 = 0, $309 = 0, $31 = 0, $310 = 0, $311 = 0, $312 = 0, $313 = 0;
 var $314 = 0, $315 = 0, $316 = 0, $317 = 0, $318 = 0, $319 = 0, $32 = 0, $320 = 0, $321 = 0, $322 = 0, $323 = 0, $324 = 0, $325 = 0, $326 = 0, $327 = 0, $328 = 0, $329 = 0, $33 = 0, $330 = 0, $331 = 0;
 var $332 = 0, $333 = 0, $334 = 0, $335 = 0, $336 = 0, $337 = 0, $338 = 0, $339 = 0, $34 = 0, $340 = 0, $341 = 0, $342 = 0.0, $343 = 0, $344 = 0, $345 = 0, $346 = 0, $347 = 0, $348 = 0, $349 = 0, $35 = 0;
 var $350 = 0, $351 = 0, $352 = 0, $353 = 0, $354 = 0, $355 = 0, $356 = 0, $357 = 0, $358 = 0, $359 = 0, $36 = 0, $360 = 0, $361 = 0, $362 = 0, $363 = 0, $364 = 0, $365 = 0, $366 = 0, $367 = 0, $368 = 0;
 var $369 = 0, $37 = 0, $370 = 0, $371 = 0, $372 = 0, $373 = 0, $374 = 0, $375 = 0, $376 = 0, $377 = 0, $378 = 0, $379 = 0, $38 = 0, $380 = 0, $381 = 0, $382 = 0, $383 = 0, $384 = 0, $385 = 0, $386 = 0;
 var $387 = 0, $388 = 0, $389 = 0, $39 = 0, $390 = 0, $391 = 0, $392 = 0, $393 = 0, $394 = 0, $395 = 0, $396 = 0, $397 = 0, $398 = 0, $399 = 0, $4 = 0, $40 = 0, $400 = 0, $401 = 0, $402 = 0, $403 = 0;
 var $404 = 0, $405 = 0, $406 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0, $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0, $50 = 0, $51 = 0, $52 = 0, $53 = 0, $54 = 0, $55 = 0, $56 = 0;
 var $57 = 0, $58 = 0, $59 = 0, $6 = 0, $60 = 0, $61 = 0, $62 = 0, $63 = 0, $64 = 0, $65 = 0, $66 = 0, $67 = 0, $68 = 0, $69 = 0, $7 = 0, $70 = 0, $71 = 0, $72 = 0, $73 = 0, $74 = 0;
 var $75 = 0, $76 = 0, $77 = 0, $78 = 0, $79 = 0, $8 = 0, $80 = 0, $81 = 0, $82 = 0, $83 = 0, $84 = 0, $85 = 0, $86 = 0, $87 = 0, $88 = 0, $89 = 0, $9 = 0, $90 = 0, $91 = 0, $92 = 0;
 var $93 = 0, $94 = 0, $95 = 0, $96 = 0, $97 = 0, $98 = 0, $99 = 0, $a = 0, $add = 0, $add$ptr = 0, $add$ptr139 = 0, $add$ptr150 = 0, $add$ptr206 = 0, $add$ptr258 = 0, $add$ptr298 = 0, $add$ptr341 = 0, $add$ptr360 = 0, $add$ptr43 = 0, $add$ptr474 = 0, $add$ptr88 = 0;
 var $add270 = 0, $add277 = 0, $add323 = 0, $add335 = 0, $add377 = 0, $add389 = 0, $add396 = 0, $add404 = 0, $add413 = 0, $add420 = 0, $add442 = 0, $add446 = 0, $add448 = 0, $add449 = 0, $add457 = 0, $and = 0, $and211 = 0, $and215 = 0, $and217 = 0, $and220 = 0;
 var $and250 = 0, $and255 = 0, $and264 = 0, $and290 = 0, $and295 = 0, $and310 = 0, $and342 = 0, $and366 = 0, $ap$addr = 0, $arg = 0, $arglist_current = 0, $arglist_current4 = 0, $arglist_next = 0, $arglist_next5 = 0, $argpos = 0, $arrayidx114 = 0, $arrayidx119 = 0, $arrayidx124 = 0, $arrayidx129 = 0, $arrayidx132 = 0;
 var $arrayidx133 = 0, $arrayidx136 = 0, $arrayidx16 = 0, $arrayidx170 = 0, $arrayidx174 = 0, $arrayidx193 = 0, $arrayidx194 = 0, $arrayidx207 = 0, $arrayidx31 = 0, $arrayidx35 = 0, $arrayidx371 = 0, $arrayidx40 = 0, $arrayidx470 = 0, $arrayidx475 = 0, $arrayidx482 = 0, $arrayidx68 = 0, $arrayidx73 = 0, $arrayidx78 = 0, $arrayidx81 = 0, $arrayidx82 = 0;
 var $arrayidx85 = 0, $buf = 0, $call = 0, $call104 = 0, $call121 = 0, $call160 = 0, $call33 = 0, $call345 = 0, $call346 = 0, $call357 = 0, $call385 = 0, $call412 = 0, $call430 = 0, $call70 = 0, $cmp = 0, $cmp1 = 0, $cmp105 = 0, $cmp111 = 0, $cmp116 = 0, $cmp126 = 0;
 var $cmp13 = 0, $cmp156 = 0, $cmp166 = 0, $cmp177 = 0, $cmp18 = 0, $cmp182 = 0, $cmp185 = 0, $cmp212 = 0, $cmp241 = 0, $cmp271 = 0, $cmp307 = 0, $cmp324 = 0, $cmp37 = 0, $cmp378 = 0, $cmp386 = 0, $cmp391 = 0, $cmp398 = 0, $cmp405 = 0, $cmp414 = 0, $cmp422 = 0;
 var $cmp435 = 0, $cmp443 = 0, $cmp467 = 0, $cmp479 = 0, $cmp491 = 0, $cmp50 = 0, $cmp65 = 0, $cmp75 = 0, $cmp9 = 0, $cmp97 = 0, $cnt = 0, $cond = 0, $cond149 = 0, $cond246 = 0, $cond337 = 0, $cond355 = 0, $cond427 = 0, $conv = 0, $conv110 = 0, $conv115 = 0;
 var $conv12 = 0, $conv120 = 0, $conv125 = 0, $conv130 = 0, $conv134 = 0, $conv155 = 0, $conv164 = 0, $conv17 = 0, $conv172 = 0, $conv175 = 0, $conv208 = 0, $conv230 = 0, $conv233 = 0, $conv32 = 0, $conv36 = 0, $conv41 = 0, $conv48 = 0, $conv53 = 0, $conv58 = 0, $conv69 = 0;
 var $conv74 = 0, $conv79 = 0, $conv8 = 0, $conv83 = 0, $expanded = 0, $expanded10 = 0, $expanded12 = 0, $expanded13 = 0, $expanded15 = 0, $expanded16 = 0, $expanded17 = 0, $expanded6 = 0, $expanded8 = 0, $expanded9 = 0, $f$addr = 0, $fl = 0, $fmt$addr = 0, $i = 0, $inc = 0, $inc489 = 0;
 var $incdec$ptr = 0, $incdec$ptr159 = 0, $incdec$ptr171 = 0, $incdec$ptr23 = 0, $incdec$ptr293 = 0, $incdec$ptr384 = 0, $incdec$ptr411 = 0, $incdec$ptr45 = 0, $incdec$ptr62 = 0, $incdec$ptr93 = 0, $l = 0, $l10n = 0, $lnot = 0, $lnot$ext = 0, $lnot$ext334 = 0, $lnot333 = 0, $lnot484 = 0, $mb = 0, $nl_arg$addr = 0, $nl_type$addr = 0;
 var $or = 0, $or$cond = 0, $or100 = 0, $or247 = 0, $p = 0, $pl = 0, $prefix = 0, $ps = 0, $retval = 0, $s = 0, $shl = 0, $shl60 = 0, $shr = 0, $st = 0, $sub = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$lhs$cast267 = 0, $sub$ptr$lhs$cast274 = 0, $sub$ptr$lhs$cast318 = 0, $sub$ptr$lhs$cast328 = 0;
 var $sub$ptr$lhs$cast362 = 0, $sub$ptr$lhs$cast432 = 0, $sub$ptr$lhs$cast438 = 0, $sub$ptr$lhs$cast451 = 0, $sub$ptr$lhs$cast454 = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$rhs$cast268 = 0, $sub$ptr$rhs$cast275 = 0, $sub$ptr$rhs$cast319 = 0, $sub$ptr$rhs$cast329 = 0, $sub$ptr$rhs$cast363 = 0, $sub$ptr$rhs$cast433 = 0, $sub$ptr$rhs$cast439 = 0, $sub$ptr$rhs$cast452 = 0, $sub$ptr$rhs$cast455 = 0, $sub$ptr$sub = 0, $sub$ptr$sub269 = 0, $sub$ptr$sub276 = 0, $sub$ptr$sub320 = 0, $sub$ptr$sub330 = 0;
 var $sub$ptr$sub364 = 0, $sub$ptr$sub434 = 0, $sub$ptr$sub440 = 0, $sub$ptr$sub453 = 0, $sub$ptr$sub456 = 0, $sub101 = 0, $sub131 = 0, $sub135 = 0, $sub165 = 0, $sub173 = 0, $sub176 = 0, $sub390 = 0, $sub42 = 0, $sub49 = 0, $sub54 = 0, $sub59 = 0, $sub80 = 0, $sub84 = 0, $t = 0, $tobool = 0;
 var $tobool122 = 0, $tobool141 = 0, $tobool143 = 0, $tobool179 = 0, $tobool196 = 0, $tobool202 = 0, $tobool209 = 0, $tobool218 = 0, $tobool25 = 0, $tobool256 = 0, $tobool265 = 0, $tobool28 = 0, $tobool291 = 0, $tobool296 = 0, $tobool315 = 0, $tobool34 = 0, $tobool350 = 0, $tobool358 = 0, $tobool381 = 0, $tobool408 = 0;
 var $tobool460 = 0, $tobool463 = 0, $tobool471 = 0, $tobool483 = 0, $tobool55 = 0, $tobool7 = 0, $tobool71 = 0, $tobool90 = 0, $tobool92 = 0, $varet = 0, $varet146 = 0, $w = 0, $wc = 0, $ws = 0, $xor = 0, $xor450 = 0, $xor458 = 0, $z = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 176|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(176|0);
 $s = sp + 84|0;
 $arg = sp;
 $buf = sp + 128|0;
 $wc = sp + 24|0;
 $mb = sp + 120|0;
 $f$addr = $f;
 $fmt$addr = $fmt;
 $ap$addr = $ap;
 $nl_arg$addr = $nl_arg;
 $nl_type$addr = $nl_type;
 $0 = $fmt$addr;
 HEAP32[$s>>2] = $0;
 $l10n = 0;
 $cnt = 0;
 $l = 0;
 L1: while(1) {
  $1 = $cnt;
  $cmp = ($1|0)>=(0);
  do {
   if ($cmp) {
    $2 = $l;
    $3 = $cnt;
    $sub = (2147483647 - ($3))|0;
    $cmp1 = ($2|0)>($sub|0);
    if ($cmp1) {
     $call = (___errno_location()|0);
     HEAP32[$call>>2] = 75;
     $cnt = -1;
     break;
    } else {
     $4 = $l;
     $5 = $cnt;
     $add = (($5) + ($4))|0;
     $cnt = $add;
     break;
    }
   }
  } while(0);
  $6 = HEAP32[$s>>2]|0;
  $7 = HEAP8[$6>>0]|0;
  $tobool = ($7<<24>>24)!=(0);
  if (!($tobool)) {
   label = 134;
   break;
  }
  $8 = HEAP32[$s>>2]|0;
  $a = $8;
  while(1) {
   $9 = HEAP32[$s>>2]|0;
   $10 = HEAP8[$9>>0]|0;
   $conv = $10 << 24 >> 24;
   $tobool7 = ($conv|0)!=(0);
   if (!($tobool7)) {
    break;
   }
   $11 = HEAP32[$s>>2]|0;
   $12 = HEAP8[$11>>0]|0;
   $conv8 = $12 << 24 >> 24;
   $cmp9 = ($conv8|0)!=(37);
   if (!($cmp9)) {
    break;
   }
   $13 = HEAP32[$s>>2]|0;
   $incdec$ptr = ((($13)) + 1|0);
   HEAP32[$s>>2] = $incdec$ptr;
  }
  $14 = HEAP32[$s>>2]|0;
  $z = $14;
  while(1) {
   $15 = HEAP32[$s>>2]|0;
   $16 = HEAP8[$15>>0]|0;
   $conv12 = $16 << 24 >> 24;
   $cmp13 = ($conv12|0)==(37);
   if (!($cmp13)) {
    break;
   }
   $17 = HEAP32[$s>>2]|0;
   $arrayidx16 = ((($17)) + 1|0);
   $18 = HEAP8[$arrayidx16>>0]|0;
   $conv17 = $18 << 24 >> 24;
   $cmp18 = ($conv17|0)==(37);
   if (!($cmp18)) {
    break;
   }
   $19 = $z;
   $incdec$ptr23 = ((($19)) + 1|0);
   $z = $incdec$ptr23;
   $20 = HEAP32[$s>>2]|0;
   $add$ptr = ((($20)) + 2|0);
   HEAP32[$s>>2] = $add$ptr;
  }
  $21 = $z;
  $22 = $a;
  $sub$ptr$lhs$cast = $21;
  $sub$ptr$rhs$cast = $22;
  $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
  $l = $sub$ptr$sub;
  $23 = $f$addr;
  $tobool25 = ($23|0)!=(0|0);
  if ($tobool25) {
   $24 = $f$addr;
   $25 = $a;
   $26 = $l;
   _out($24,$25,$26);
  }
  $27 = $l;
  $tobool28 = ($27|0)!=(0);
  if ($tobool28) {
   continue;
  }
  $28 = HEAP32[$s>>2]|0;
  $arrayidx31 = ((($28)) + 1|0);
  $29 = HEAP8[$arrayidx31>>0]|0;
  $conv32 = $29 << 24 >> 24;
  $call33 = (_isdigit($conv32)|0);
  $tobool34 = ($call33|0)!=(0);
  if ($tobool34) {
   $30 = HEAP32[$s>>2]|0;
   $arrayidx35 = ((($30)) + 2|0);
   $31 = HEAP8[$arrayidx35>>0]|0;
   $conv36 = $31 << 24 >> 24;
   $cmp37 = ($conv36|0)==(36);
   if ($cmp37) {
    $l10n = 1;
    $32 = HEAP32[$s>>2]|0;
    $arrayidx40 = ((($32)) + 1|0);
    $33 = HEAP8[$arrayidx40>>0]|0;
    $conv41 = $33 << 24 >> 24;
    $sub42 = (($conv41) - 48)|0;
    $argpos = $sub42;
    $34 = HEAP32[$s>>2]|0;
    $add$ptr43 = ((($34)) + 3|0);
    HEAP32[$s>>2] = $add$ptr43;
   } else {
    label = 21;
   }
  } else {
   label = 21;
  }
  if ((label|0) == 21) {
   label = 0;
   $argpos = -1;
   $35 = HEAP32[$s>>2]|0;
   $incdec$ptr45 = ((($35)) + 1|0);
   HEAP32[$s>>2] = $incdec$ptr45;
  }
  $fl = 0;
  while(1) {
   $36 = HEAP32[$s>>2]|0;
   $37 = HEAP8[$36>>0]|0;
   $conv48 = $37 << 24 >> 24;
   $sub49 = (($conv48) - 32)|0;
   $cmp50 = ($sub49>>>0)<(32);
   if ($cmp50) {
    $38 = HEAP32[$s>>2]|0;
    $39 = HEAP8[$38>>0]|0;
    $conv53 = $39 << 24 >> 24;
    $sub54 = (($conv53) - 32)|0;
    $shl = 1 << $sub54;
    $and = 75913 & $shl;
    $tobool55 = ($and|0)!=(0);
    $405 = $tobool55;
   } else {
    $405 = 0;
   }
   $40 = HEAP32[$s>>2]|0;
   $41 = HEAP8[$40>>0]|0;
   $conv58 = $41 << 24 >> 24;
   if (!($405)) {
    break;
   }
   $sub59 = (($conv58) - 32)|0;
   $shl60 = 1 << $sub59;
   $42 = $fl;
   $or = $42 | $shl60;
   $fl = $or;
   $43 = HEAP32[$s>>2]|0;
   $incdec$ptr62 = ((($43)) + 1|0);
   HEAP32[$s>>2] = $incdec$ptr62;
  }
  $cmp65 = ($conv58|0)==(42);
  if ($cmp65) {
   $44 = HEAP32[$s>>2]|0;
   $arrayidx68 = ((($44)) + 1|0);
   $45 = HEAP8[$arrayidx68>>0]|0;
   $conv69 = $45 << 24 >> 24;
   $call70 = (_isdigit($conv69)|0);
   $tobool71 = ($call70|0)!=(0);
   if ($tobool71) {
    $46 = HEAP32[$s>>2]|0;
    $arrayidx73 = ((($46)) + 2|0);
    $47 = HEAP8[$arrayidx73>>0]|0;
    $conv74 = $47 << 24 >> 24;
    $cmp75 = ($conv74|0)==(36);
    if ($cmp75) {
     $l10n = 1;
     $48 = $nl_type$addr;
     $49 = HEAP32[$s>>2]|0;
     $arrayidx78 = ((($49)) + 1|0);
     $50 = HEAP8[$arrayidx78>>0]|0;
     $conv79 = $50 << 24 >> 24;
     $sub80 = (($conv79) - 48)|0;
     $arrayidx81 = (($48) + ($sub80<<2)|0);
     HEAP32[$arrayidx81>>2] = 10;
     $51 = $nl_arg$addr;
     $52 = HEAP32[$s>>2]|0;
     $arrayidx82 = ((($52)) + 1|0);
     $53 = HEAP8[$arrayidx82>>0]|0;
     $conv83 = $53 << 24 >> 24;
     $sub84 = (($conv83) - 48)|0;
     $arrayidx85 = (($51) + ($sub84<<3)|0);
     $54 = $arrayidx85;
     $55 = $54;
     $56 = HEAP32[$55>>2]|0;
     $57 = (($54) + 4)|0;
     $58 = $57;
     $59 = HEAP32[$58>>2]|0;
     $w = $56;
     $60 = HEAP32[$s>>2]|0;
     $add$ptr88 = ((($60)) + 3|0);
     HEAP32[$s>>2] = $add$ptr88;
    } else {
     label = 31;
    }
   } else {
    label = 31;
   }
   if ((label|0) == 31) {
    label = 0;
    $61 = $l10n;
    $tobool90 = ($61|0)!=(0);
    if ($tobool90) {
     label = 35;
     break;
    }
    $62 = $f$addr;
    $tobool92 = ($62|0)!=(0|0);
    if ($tobool92) {
     $63 = $ap$addr;
     $arglist_current = HEAP32[$63>>2]|0;
     $64 = $arglist_current;
     $65 = ((0) + 4|0);
     $expanded6 = $65;
     $expanded = (($expanded6) - 1)|0;
     $66 = (($64) + ($expanded))|0;
     $67 = ((0) + 4|0);
     $expanded10 = $67;
     $expanded9 = (($expanded10) - 1)|0;
     $expanded8 = $expanded9 ^ -1;
     $68 = $66 & $expanded8;
     $69 = $68;
     $70 = HEAP32[$69>>2]|0;
     $arglist_next = ((($69)) + 4|0);
     HEAP32[$63>>2] = $arglist_next;
     $varet = $70;
     $71 = $varet;
     $cond = $71;
    } else {
     $cond = 0;
    }
    $w = $cond;
    $72 = HEAP32[$s>>2]|0;
    $incdec$ptr93 = ((($72)) + 1|0);
    HEAP32[$s>>2] = $incdec$ptr93;
   }
   $73 = $w;
   $cmp97 = ($73|0)<(0);
   if ($cmp97) {
    $74 = $fl;
    $or100 = $74 | 8192;
    $fl = $or100;
    $75 = $w;
    $sub101 = (0 - ($75))|0;
    $w = $sub101;
   }
  } else {
   $call104 = (_getint($s)|0);
   $w = $call104;
   $cmp105 = ($call104|0)<(0);
   if ($cmp105) {
    label = 39;
    break;
   }
  }
  $76 = HEAP32[$s>>2]|0;
  $77 = HEAP8[$76>>0]|0;
  $conv110 = $77 << 24 >> 24;
  $cmp111 = ($conv110|0)==(46);
  do {
   if ($cmp111) {
    $78 = HEAP32[$s>>2]|0;
    $arrayidx114 = ((($78)) + 1|0);
    $79 = HEAP8[$arrayidx114>>0]|0;
    $conv115 = $79 << 24 >> 24;
    $cmp116 = ($conv115|0)==(42);
    if ($cmp116) {
     $80 = HEAP32[$s>>2]|0;
     $arrayidx119 = ((($80)) + 2|0);
     $81 = HEAP8[$arrayidx119>>0]|0;
     $conv120 = $81 << 24 >> 24;
     $call121 = (_isdigit($conv120)|0);
     $tobool122 = ($call121|0)!=(0);
     if ($tobool122) {
      $82 = HEAP32[$s>>2]|0;
      $arrayidx124 = ((($82)) + 3|0);
      $83 = HEAP8[$arrayidx124>>0]|0;
      $conv125 = $83 << 24 >> 24;
      $cmp126 = ($conv125|0)==(36);
      if ($cmp126) {
       $84 = $nl_type$addr;
       $85 = HEAP32[$s>>2]|0;
       $arrayidx129 = ((($85)) + 2|0);
       $86 = HEAP8[$arrayidx129>>0]|0;
       $conv130 = $86 << 24 >> 24;
       $sub131 = (($conv130) - 48)|0;
       $arrayidx132 = (($84) + ($sub131<<2)|0);
       HEAP32[$arrayidx132>>2] = 10;
       $87 = $nl_arg$addr;
       $88 = HEAP32[$s>>2]|0;
       $arrayidx133 = ((($88)) + 2|0);
       $89 = HEAP8[$arrayidx133>>0]|0;
       $conv134 = $89 << 24 >> 24;
       $sub135 = (($conv134) - 48)|0;
       $arrayidx136 = (($87) + ($sub135<<3)|0);
       $90 = $arrayidx136;
       $91 = $90;
       $92 = HEAP32[$91>>2]|0;
       $93 = (($90) + 4)|0;
       $94 = $93;
       $95 = HEAP32[$94>>2]|0;
       $p = $92;
       $96 = HEAP32[$s>>2]|0;
       $add$ptr139 = ((($96)) + 4|0);
       HEAP32[$s>>2] = $add$ptr139;
       break;
      }
     }
     $97 = $l10n;
     $tobool141 = ($97|0)!=(0);
     if ($tobool141) {
      label = 49;
      break L1;
     }
     $98 = $f$addr;
     $tobool143 = ($98|0)!=(0|0);
     if ($tobool143) {
      $99 = $ap$addr;
      $arglist_current4 = HEAP32[$99>>2]|0;
      $100 = $arglist_current4;
      $101 = ((0) + 4|0);
      $expanded13 = $101;
      $expanded12 = (($expanded13) - 1)|0;
      $102 = (($100) + ($expanded12))|0;
      $103 = ((0) + 4|0);
      $expanded17 = $103;
      $expanded16 = (($expanded17) - 1)|0;
      $expanded15 = $expanded16 ^ -1;
      $104 = $102 & $expanded15;
      $105 = $104;
      $106 = HEAP32[$105>>2]|0;
      $arglist_next5 = ((($105)) + 4|0);
      HEAP32[$99>>2] = $arglist_next5;
      $varet146 = $106;
      $107 = $varet146;
      $cond149 = $107;
     } else {
      $cond149 = 0;
     }
     $p = $cond149;
     $108 = HEAP32[$s>>2]|0;
     $add$ptr150 = ((($108)) + 2|0);
     HEAP32[$s>>2] = $add$ptr150;
    } else {
     label = 50;
    }
   } else {
    label = 50;
   }
  } while(0);
  do {
   if ((label|0) == 50) {
    label = 0;
    $109 = HEAP32[$s>>2]|0;
    $110 = HEAP8[$109>>0]|0;
    $conv155 = $110 << 24 >> 24;
    $cmp156 = ($conv155|0)==(46);
    if ($cmp156) {
     $111 = HEAP32[$s>>2]|0;
     $incdec$ptr159 = ((($111)) + 1|0);
     HEAP32[$s>>2] = $incdec$ptr159;
     $call160 = (_getint($s)|0);
     $p = $call160;
     break;
    } else {
     $p = -1;
     break;
    }
   }
  } while(0);
  $st = 0;
  while(1) {
   $112 = HEAP32[$s>>2]|0;
   $113 = HEAP8[$112>>0]|0;
   $conv164 = $113 << 24 >> 24;
   $sub165 = (($conv164) - 65)|0;
   $cmp166 = ($sub165>>>0)>(57);
   if ($cmp166) {
    label = 55;
    break L1;
   }
   $114 = $st;
   $ps = $114;
   $115 = $st;
   $arrayidx170 = (1109 + (($115*58)|0)|0);
   $116 = HEAP32[$s>>2]|0;
   $incdec$ptr171 = ((($116)) + 1|0);
   HEAP32[$s>>2] = $incdec$ptr171;
   $117 = HEAP8[$116>>0]|0;
   $conv172 = $117 << 24 >> 24;
   $sub173 = (($conv172) - 65)|0;
   $arrayidx174 = (($arrayidx170) + ($sub173)|0);
   $118 = HEAP8[$arrayidx174>>0]|0;
   $conv175 = $118&255;
   $st = $conv175;
   $119 = $st;
   $sub176 = (($119) - 1)|0;
   $cmp177 = ($sub176>>>0)<(8);
   if (!($cmp177)) {
    break;
   }
  }
  $120 = $st;
  $tobool179 = ($120|0)!=(0);
  if (!($tobool179)) {
   label = 58;
   break;
  }
  $121 = $st;
  $cmp182 = ($121|0)==(19);
  $122 = $argpos;
  $cmp185 = ($122|0)>=(0);
  do {
   if ($cmp182) {
    if ($cmp185) {
     label = 61;
     break L1;
    }
   } else {
    if ($cmp185) {
     $123 = $st;
     $124 = $nl_type$addr;
     $125 = $argpos;
     $arrayidx193 = (($124) + ($125<<2)|0);
     HEAP32[$arrayidx193>>2] = $123;
     $126 = $nl_arg$addr;
     $127 = $argpos;
     $arrayidx194 = (($126) + ($127<<3)|0);
     ;HEAP32[$arg>>2]=HEAP32[$arrayidx194>>2]|0;HEAP32[$arg+4>>2]=HEAP32[$arrayidx194+4>>2]|0;
     break;
    }
    $128 = $f$addr;
    $tobool196 = ($128|0)!=(0|0);
    if (!($tobool196)) {
     label = 66;
     break L1;
    }
    $129 = $st;
    $130 = $ap$addr;
    _pop_arg($arg,$129,$130);
   }
  } while(0);
  $131 = $f$addr;
  $tobool202 = ($131|0)!=(0|0);
  if (!($tobool202)) {
   continue;
  }
  $add$ptr206 = ((($buf)) + 40|0);
  $z = $add$ptr206;
  $prefix = 1573;
  $pl = 0;
  $132 = HEAP32[$s>>2]|0;
  $arrayidx207 = ((($132)) + -1|0);
  $133 = HEAP8[$arrayidx207>>0]|0;
  $conv208 = $133 << 24 >> 24;
  $t = $conv208;
  $134 = $ps;
  $tobool209 = ($134|0)!=(0);
  if ($tobool209) {
   $135 = $t;
   $and211 = $135 & 15;
   $cmp212 = ($and211|0)==(3);
   if ($cmp212) {
    $136 = $t;
    $and215 = $136 & -33;
    $t = $and215;
   }
  }
  $137 = $fl;
  $and217 = $137 & 8192;
  $tobool218 = ($and217|0)!=(0);
  if ($tobool218) {
   $138 = $fl;
   $and220 = $138 & -65537;
   $fl = $and220;
  }
  $139 = $t;
  L90: do {
   switch ($139|0) {
   case 110:  {
    $140 = $ps;
    switch ($140|0) {
    case 0:  {
     $141 = $cnt;
     $142 = HEAP32[$arg>>2]|0;
     HEAP32[$142>>2] = $141;
     continue L1;
     break;
    }
    case 1:  {
     $143 = $cnt;
     $144 = HEAP32[$arg>>2]|0;
     HEAP32[$144>>2] = $143;
     continue L1;
     break;
    }
    case 2:  {
     $145 = $cnt;
     $146 = ($145|0)<(0);
     $147 = $146 << 31 >> 31;
     $148 = HEAP32[$arg>>2]|0;
     $149 = $148;
     $150 = $149;
     HEAP32[$150>>2] = $145;
     $151 = (($149) + 4)|0;
     $152 = $151;
     HEAP32[$152>>2] = $147;
     continue L1;
     break;
    }
    case 3:  {
     $153 = $cnt;
     $conv230 = $153&65535;
     $154 = HEAP32[$arg>>2]|0;
     HEAP16[$154>>1] = $conv230;
     continue L1;
     break;
    }
    case 4:  {
     $155 = $cnt;
     $conv233 = $155&255;
     $156 = HEAP32[$arg>>2]|0;
     HEAP8[$156>>0] = $conv233;
     continue L1;
     break;
    }
    case 6:  {
     $157 = $cnt;
     $158 = HEAP32[$arg>>2]|0;
     HEAP32[$158>>2] = $157;
     continue L1;
     break;
    }
    case 7:  {
     $159 = $cnt;
     $160 = ($159|0)<(0);
     $161 = $160 << 31 >> 31;
     $162 = HEAP32[$arg>>2]|0;
     $163 = $162;
     $164 = $163;
     HEAP32[$164>>2] = $159;
     $165 = (($163) + 4)|0;
     $166 = $165;
     HEAP32[$166>>2] = $161;
     continue L1;
     break;
    }
    default: {
     continue L1;
    }
    }
    break;
   }
   case 112:  {
    $167 = $p;
    $cmp241 = ($167>>>0)>(8);
    $168 = $p;
    $cond246 = $cmp241 ? $168 : 8;
    $p = $cond246;
    $t = 120;
    $169 = $fl;
    $or247 = $169 | 8;
    $fl = $or247;
    label = 83;
    break;
   }
   case 88: case 120:  {
    label = 83;
    break;
   }
   case 111:  {
    $191 = $arg;
    $192 = $191;
    $193 = HEAP32[$192>>2]|0;
    $194 = (($191) + 4)|0;
    $195 = $194;
    $196 = HEAP32[$195>>2]|0;
    $197 = $z;
    $198 = (_fmt_o($193,$196,$197)|0);
    $a = $198;
    $199 = $fl;
    $and264 = $199 & 8;
    $tobool265 = ($and264|0)!=(0);
    if ($tobool265) {
     $200 = $p;
     $201 = $z;
     $202 = $a;
     $sub$ptr$lhs$cast267 = $201;
     $sub$ptr$rhs$cast268 = $202;
     $sub$ptr$sub269 = (($sub$ptr$lhs$cast267) - ($sub$ptr$rhs$cast268))|0;
     $add270 = (($sub$ptr$sub269) + 1)|0;
     $cmp271 = ($200|0)<($add270|0);
     if ($cmp271) {
      $203 = $z;
      $204 = $a;
      $sub$ptr$lhs$cast274 = $203;
      $sub$ptr$rhs$cast275 = $204;
      $sub$ptr$sub276 = (($sub$ptr$lhs$cast274) - ($sub$ptr$rhs$cast275))|0;
      $add277 = (($sub$ptr$sub276) + 1)|0;
      $p = $add277;
      label = 97;
     } else {
      label = 97;
     }
    } else {
     label = 97;
    }
    break;
   }
   case 105: case 100:  {
    $pl = 1;
    $205 = $arg;
    $206 = $205;
    $207 = HEAP32[$206>>2]|0;
    $208 = (($205) + 4)|0;
    $209 = $208;
    $210 = HEAP32[$209>>2]|0;
    $211 = ($210>>>0)>(2147483647);
    $212 = ($207>>>0)>(4294967295);
    $213 = ($210|0)==(2147483647);
    $214 = $213 & $212;
    $215 = $211 | $214;
    if ($215) {
     $216 = $arg;
     $217 = $216;
     $218 = HEAP32[$217>>2]|0;
     $219 = (($216) + 4)|0;
     $220 = $219;
     $221 = HEAP32[$220>>2]|0;
     $222 = (_i64Subtract(0,0,($218|0),($221|0))|0);
     $223 = tempRet0;
     $224 = $arg;
     $225 = $224;
     HEAP32[$225>>2] = $222;
     $226 = (($224) + 4)|0;
     $227 = $226;
     HEAP32[$227>>2] = $223;
     label = 96;
     break L90;
    }
    $228 = $fl;
    $and290 = $228 & 2048;
    $tobool291 = ($and290|0)!=(0);
    if ($tobool291) {
     $229 = $prefix;
     $incdec$ptr293 = ((($229)) + 1|0);
     $prefix = $incdec$ptr293;
     label = 96;
     break L90;
    }
    $230 = $fl;
    $and295 = $230 & 1;
    $tobool296 = ($and295|0)!=(0);
    if ($tobool296) {
     $231 = $prefix;
     $add$ptr298 = ((($231)) + 2|0);
     $prefix = $add$ptr298;
     label = 96;
     break L90;
    } else {
     $pl = 0;
     label = 96;
     break L90;
    }
    break;
   }
   case 117:  {
    label = 96;
    break;
   }
   case 99:  {
    $277 = $arg;
    $278 = $277;
    $279 = HEAP32[$278>>2]|0;
    $280 = (($277) + 4)|0;
    $281 = $280;
    $282 = HEAP32[$281>>2]|0;
    $283 = $279&255;
    $284 = $z;
    $p = 1;
    $add$ptr341 = ((($284)) + -1|0);
    $a = $add$ptr341;
    HEAP8[$add$ptr341>>0] = $283;
    $285 = $fl;
    $and342 = $285 & -65537;
    $fl = $and342;
    break;
   }
   case 109:  {
    $call345 = (___errno_location()|0);
    $286 = HEAP32[$call345>>2]|0;
    $call346 = (_strerror($286)|0);
    $a = $call346;
    label = 108;
    break;
   }
   case 115:  {
    $287 = HEAP32[$arg>>2]|0;
    $tobool350 = ($287|0)!=(0|0);
    $288 = HEAP32[$arg>>2]|0;
    $cond355 = $tobool350 ? $288 : 1583;
    $a = $cond355;
    label = 108;
    break;
   }
   case 67:  {
    $297 = $arg;
    $298 = $297;
    $299 = HEAP32[$298>>2]|0;
    $300 = (($297) + 4)|0;
    $301 = $300;
    $302 = HEAP32[$301>>2]|0;
    HEAP32[$wc>>2] = $299;
    $arrayidx371 = ((($wc)) + 4|0);
    HEAP32[$arrayidx371>>2] = 0;
    HEAP32[$arg>>2] = $wc;
    $p = -1;
    label = 113;
    break;
   }
   case 83:  {
    label = 113;
    break;
   }
   case 65: case 71: case 70: case 69: case 97: case 103: case 102: case 101:  {
    $341 = $f$addr;
    $342 = +HEAPF64[$arg>>3];
    $343 = $w;
    $344 = $p;
    $345 = $fl;
    $346 = $t;
    $call430 = (_fmt_fp($341,$342,$343,$344,$345,$346)|0);
    $l = $call430;
    continue L1;
    break;
   }
   default: {
   }
   }
  } while(0);
  if ((label|0) == 83) {
   label = 0;
   $170 = $arg;
   $171 = $170;
   $172 = HEAP32[$171>>2]|0;
   $173 = (($170) + 4)|0;
   $174 = $173;
   $175 = HEAP32[$174>>2]|0;
   $176 = $z;
   $177 = $t;
   $and250 = $177 & 32;
   $178 = (_fmt_x($172,$175,$176,$and250)|0);
   $a = $178;
   $179 = $arg;
   $180 = $179;
   $181 = HEAP32[$180>>2]|0;
   $182 = (($179) + 4)|0;
   $183 = $182;
   $184 = HEAP32[$183>>2]|0;
   $185 = ($181|0)!=(0);
   $186 = ($184|0)!=(0);
   $187 = $185 | $186;
   if ($187) {
    $188 = $fl;
    $and255 = $188 & 8;
    $tobool256 = ($and255|0)!=(0);
    if ($tobool256) {
     $189 = $t;
     $shr = $189 >> 4;
     $190 = $prefix;
     $add$ptr258 = (($190) + ($shr)|0);
     $prefix = $add$ptr258;
     $pl = 2;
     label = 97;
    } else {
     label = 97;
    }
   } else {
    label = 97;
   }
  }
  else if ((label|0) == 96) {
   label = 0;
   $232 = $arg;
   $233 = $232;
   $234 = HEAP32[$233>>2]|0;
   $235 = (($232) + 4)|0;
   $236 = $235;
   $237 = HEAP32[$236>>2]|0;
   $238 = $z;
   $239 = (_fmt_u($234,$237,$238)|0);
   $a = $239;
   label = 97;
  }
  else if ((label|0) == 108) {
   label = 0;
   $289 = $a;
   $290 = $p;
   $call357 = (_memchr($289,0,$290)|0);
   $z = $call357;
   $291 = $z;
   $tobool358 = ($291|0)!=(0|0);
   if ($tobool358) {
    $294 = $z;
    $295 = $a;
    $sub$ptr$lhs$cast362 = $294;
    $sub$ptr$rhs$cast363 = $295;
    $sub$ptr$sub364 = (($sub$ptr$lhs$cast362) - ($sub$ptr$rhs$cast363))|0;
    $p = $sub$ptr$sub364;
   } else {
    $292 = $a;
    $293 = $p;
    $add$ptr360 = (($292) + ($293)|0);
    $z = $add$ptr360;
   }
   $296 = $fl;
   $and366 = $296 & -65537;
   $fl = $and366;
  }
  else if ((label|0) == 113) {
   label = 0;
   $303 = HEAP32[$arg>>2]|0;
   $ws = $303;
   $l = 0;
   $i = 0;
   while(1) {
    $304 = $i;
    $305 = $p;
    $add377 = (0 + ($305))|0;
    $cmp378 = ($304>>>0)<($add377>>>0);
    if (!($cmp378)) {
     break;
    }
    $306 = $ws;
    $307 = HEAP32[$306>>2]|0;
    $tobool381 = ($307|0)!=(0);
    if (!($tobool381)) {
     break;
    }
    $308 = $ws;
    $incdec$ptr384 = ((($308)) + 4|0);
    $ws = $incdec$ptr384;
    $309 = HEAP32[$308>>2]|0;
    $call385 = (_wctomb($mb,$309)|0);
    $l = $call385;
    $cmp386 = ($call385|0)>=(0);
    if (!($cmp386)) {
     break;
    }
    $310 = $l;
    $311 = $p;
    $add389 = (0 + ($311))|0;
    $312 = $i;
    $sub390 = (($add389) - ($312))|0;
    $cmp391 = ($310>>>0)<=($sub390>>>0);
    if (!($cmp391)) {
     break;
    }
    $313 = $l;
    $314 = $i;
    $add396 = (($314) + ($313))|0;
    $i = $add396;
   }
   $315 = $l;
   $cmp398 = ($315|0)<(0);
   if ($cmp398) {
    label = 120;
    break;
   }
   $316 = $i;
   $p = $316;
   $317 = $f$addr;
   $318 = $w;
   $319 = $p;
   $320 = $fl;
   _pad_677($317,32,$318,$319,$320);
   $321 = HEAP32[$arg>>2]|0;
   $ws = $321;
   $i = 0;
   while(1) {
    $322 = $i;
    $323 = $p;
    $add404 = (0 + ($323))|0;
    $cmp405 = ($322>>>0)<($add404>>>0);
    if ($cmp405) {
     $324 = $ws;
     $325 = HEAP32[$324>>2]|0;
     $tobool408 = ($325|0)!=(0);
     if ($tobool408) {
      $326 = $i;
      $327 = $ws;
      $incdec$ptr411 = ((($327)) + 4|0);
      $ws = $incdec$ptr411;
      $328 = HEAP32[$327>>2]|0;
      $call412 = (_wctomb($mb,$328)|0);
      $l = $call412;
      $add413 = (($326) + ($call412))|0;
      $329 = $p;
      $cmp414 = ($add413|0)<=($329|0);
      $406 = $cmp414;
     } else {
      $406 = 0;
     }
    } else {
     $406 = 0;
    }
    $330 = $f$addr;
    if (!($406)) {
     break;
    }
    $331 = $l;
    _out($330,$mb,$331);
    $332 = $l;
    $333 = $i;
    $add420 = (($333) + ($332))|0;
    $i = $add420;
   }
   $334 = $w;
   $335 = $p;
   $336 = $fl;
   $xor = $336 ^ 8192;
   _pad_677($330,32,$334,$335,$xor);
   $337 = $w;
   $338 = $p;
   $cmp422 = ($337|0)>($338|0);
   $339 = $w;
   $340 = $p;
   $cond427 = $cmp422 ? $339 : $340;
   $l = $cond427;
   continue;
  }
  do {
   if ((label|0) == 97) {
    label = 0;
    $240 = $p;
    $cmp307 = ($240|0)>=(0);
    if ($cmp307) {
     $241 = $fl;
     $and310 = $241 & -65537;
     $fl = $and310;
    }
    $242 = $arg;
    $243 = $242;
    $244 = HEAP32[$243>>2]|0;
    $245 = (($242) + 4)|0;
    $246 = $245;
    $247 = HEAP32[$246>>2]|0;
    $248 = ($244|0)!=(0);
    $249 = ($247|0)!=(0);
    $250 = $248 | $249;
    $251 = $p;
    $tobool315 = ($251|0)!=(0);
    $or$cond = $250 | $tobool315;
    if (!($or$cond)) {
     $252 = $z;
     $a = $252;
     break;
    }
    $253 = $p;
    $254 = $z;
    $255 = $a;
    $sub$ptr$lhs$cast318 = $254;
    $sub$ptr$rhs$cast319 = $255;
    $sub$ptr$sub320 = (($sub$ptr$lhs$cast318) - ($sub$ptr$rhs$cast319))|0;
    $256 = $arg;
    $257 = $256;
    $258 = HEAP32[$257>>2]|0;
    $259 = (($256) + 4)|0;
    $260 = $259;
    $261 = HEAP32[$260>>2]|0;
    $262 = ($258|0)!=(0);
    $263 = ($261|0)!=(0);
    $264 = $262 | $263;
    $lnot = $264 ^ 1;
    $lnot$ext = $lnot&1;
    $add323 = (($sub$ptr$sub320) + ($lnot$ext))|0;
    $cmp324 = ($253|0)>($add323|0);
    if ($cmp324) {
     $265 = $p;
     $cond337 = $265;
    } else {
     $266 = $z;
     $267 = $a;
     $sub$ptr$lhs$cast328 = $266;
     $sub$ptr$rhs$cast329 = $267;
     $sub$ptr$sub330 = (($sub$ptr$lhs$cast328) - ($sub$ptr$rhs$cast329))|0;
     $268 = $arg;
     $269 = $268;
     $270 = HEAP32[$269>>2]|0;
     $271 = (($268) + 4)|0;
     $272 = $271;
     $273 = HEAP32[$272>>2]|0;
     $274 = ($270|0)!=(0);
     $275 = ($273|0)!=(0);
     $276 = $274 | $275;
     $lnot333 = $276 ^ 1;
     $lnot$ext334 = $lnot333&1;
     $add335 = (($sub$ptr$sub330) + ($lnot$ext334))|0;
     $cond337 = $add335;
    }
    $p = $cond337;
   }
  } while(0);
  $347 = $p;
  $348 = $z;
  $349 = $a;
  $sub$ptr$lhs$cast432 = $348;
  $sub$ptr$rhs$cast433 = $349;
  $sub$ptr$sub434 = (($sub$ptr$lhs$cast432) - ($sub$ptr$rhs$cast433))|0;
  $cmp435 = ($347|0)<($sub$ptr$sub434|0);
  if ($cmp435) {
   $350 = $z;
   $351 = $a;
   $sub$ptr$lhs$cast438 = $350;
   $sub$ptr$rhs$cast439 = $351;
   $sub$ptr$sub440 = (($sub$ptr$lhs$cast438) - ($sub$ptr$rhs$cast439))|0;
   $p = $sub$ptr$sub440;
  }
  $352 = $w;
  $353 = $pl;
  $354 = $p;
  $add442 = (($353) + ($354))|0;
  $cmp443 = ($352|0)<($add442|0);
  if ($cmp443) {
   $355 = $pl;
   $356 = $p;
   $add446 = (($355) + ($356))|0;
   $w = $add446;
  }
  $357 = $f$addr;
  $358 = $w;
  $359 = $pl;
  $360 = $p;
  $add448 = (($359) + ($360))|0;
  $361 = $fl;
  _pad_677($357,32,$358,$add448,$361);
  $362 = $f$addr;
  $363 = $prefix;
  $364 = $pl;
  _out($362,$363,$364);
  $365 = $f$addr;
  $366 = $w;
  $367 = $pl;
  $368 = $p;
  $add449 = (($367) + ($368))|0;
  $369 = $fl;
  $xor450 = $369 ^ 65536;
  _pad_677($365,48,$366,$add449,$xor450);
  $370 = $f$addr;
  $371 = $p;
  $372 = $z;
  $373 = $a;
  $sub$ptr$lhs$cast451 = $372;
  $sub$ptr$rhs$cast452 = $373;
  $sub$ptr$sub453 = (($sub$ptr$lhs$cast451) - ($sub$ptr$rhs$cast452))|0;
  _pad_677($370,48,$371,$sub$ptr$sub453,0);
  $374 = $f$addr;
  $375 = $a;
  $376 = $z;
  $377 = $a;
  $sub$ptr$lhs$cast454 = $376;
  $sub$ptr$rhs$cast455 = $377;
  $sub$ptr$sub456 = (($sub$ptr$lhs$cast454) - ($sub$ptr$rhs$cast455))|0;
  _out($374,$375,$sub$ptr$sub456);
  $378 = $f$addr;
  $379 = $w;
  $380 = $pl;
  $381 = $p;
  $add457 = (($380) + ($381))|0;
  $382 = $fl;
  $xor458 = $382 ^ 8192;
  _pad_677($378,32,$379,$add457,$xor458);
  $383 = $w;
  $l = $383;
 }
 if ((label|0) == 35) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 39) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 49) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 55) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 58) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 61) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 66) {
  $retval = 0;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 120) {
  $retval = -1;
  $404 = $retval;
  STACKTOP = sp;return ($404|0);
 }
 else if ((label|0) == 134) {
  $384 = $f$addr;
  $tobool460 = ($384|0)!=(0|0);
  if ($tobool460) {
   $385 = $cnt;
   $retval = $385;
   $404 = $retval;
   STACKTOP = sp;return ($404|0);
  }
  $386 = $l10n;
  $tobool463 = ($386|0)!=(0);
  if (!($tobool463)) {
   $retval = 0;
   $404 = $retval;
   STACKTOP = sp;return ($404|0);
  }
  $i = 1;
  while(1) {
   $387 = $i;
   $cmp467 = ($387|0)<=(9);
   if (!($cmp467)) {
    break;
   }
   $388 = $nl_type$addr;
   $389 = $i;
   $arrayidx470 = (($388) + ($389<<2)|0);
   $390 = HEAP32[$arrayidx470>>2]|0;
   $tobool471 = ($390|0)!=(0);
   if (!($tobool471)) {
    break;
   }
   $391 = $nl_arg$addr;
   $392 = $i;
   $add$ptr474 = (($391) + ($392<<3)|0);
   $393 = $nl_type$addr;
   $394 = $i;
   $arrayidx475 = (($393) + ($394<<2)|0);
   $395 = HEAP32[$arrayidx475>>2]|0;
   $396 = $ap$addr;
   _pop_arg($add$ptr474,$395,$396);
   $397 = $i;
   $inc = (($397) + 1)|0;
   $i = $inc;
  }
  while(1) {
   $398 = $i;
   $cmp479 = ($398|0)<=(9);
   if (!($cmp479)) {
    break;
   }
   $399 = $nl_type$addr;
   $400 = $i;
   $arrayidx482 = (($399) + ($400<<2)|0);
   $401 = HEAP32[$arrayidx482>>2]|0;
   $tobool483 = ($401|0)!=(0);
   $lnot484 = $tobool483 ^ 1;
   if (!($lnot484)) {
    break;
   }
   $402 = $i;
   $inc489 = (($402) + 1)|0;
   $i = $inc489;
  }
  $403 = $i;
  $cmp491 = ($403|0)<=(9);
  if ($cmp491) {
   $retval = -1;
   $404 = $retval;
   STACKTOP = sp;return ($404|0);
  } else {
   $retval = 1;
   $404 = $retval;
   STACKTOP = sp;return ($404|0);
  }
 }
 return (0)|0;
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
function _out($f,$s,$l) {
 $f = $f|0;
 $s = $s|0;
 $l = $l|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $and = 0, $f$addr = 0, $l$addr = 0, $s$addr = 0, $tobool = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 $s$addr = $s;
 $l$addr = $l;
 $0 = $f$addr;
 $1 = HEAP32[$0>>2]|0;
 $and = $1 & 32;
 $tobool = ($and|0)!=(0);
 if ($tobool) {
  STACKTOP = sp;return;
 }
 $2 = $s$addr;
 $3 = $l$addr;
 $4 = $f$addr;
 (___fwritex($2,$3,$4)|0);
 STACKTOP = sp;return;
}
function _getint($s) {
 $s = $s|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $add = 0, $call = 0, $conv = 0, $conv1 = 0, $i = 0, $incdec$ptr = 0, $mul = 0, $s$addr = 0, $sub = 0, $tobool = 0, label = 0;
 var sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $s$addr = $s;
 $i = 0;
 while(1) {
  $0 = $s$addr;
  $1 = HEAP32[$0>>2]|0;
  $2 = HEAP8[$1>>0]|0;
  $conv = $2 << 24 >> 24;
  $call = (_isdigit($conv)|0);
  $tobool = ($call|0)!=(0);
  $3 = $i;
  if (!($tobool)) {
   break;
  }
  $mul = ($3*10)|0;
  $4 = $s$addr;
  $5 = HEAP32[$4>>2]|0;
  $6 = HEAP8[$5>>0]|0;
  $conv1 = $6 << 24 >> 24;
  $sub = (($conv1) - 48)|0;
  $add = (($mul) + ($sub))|0;
  $i = $add;
  $7 = $s$addr;
  $8 = HEAP32[$7>>2]|0;
  $incdec$ptr = ((($8)) + 1|0);
  HEAP32[$7>>2] = $incdec$ptr;
 }
 STACKTOP = sp;return ($3|0);
}
function _pop_arg($arg,$type,$ap) {
 $arg = $arg|0;
 $type = $type|0;
 $ap = $ap|0;
 var $0 = 0, $1 = 0, $10 = 0, $100 = 0, $101 = 0, $102 = 0, $103 = 0, $104 = 0, $105 = 0, $106 = 0, $107 = 0, $108 = 0, $109 = 0, $11 = 0, $110 = 0, $111 = 0, $112 = 0, $113 = 0, $114 = 0, $115 = 0;
 var $116 = 0, $117 = 0, $118 = 0, $119 = 0, $12 = 0, $120 = 0, $121 = 0, $122 = 0, $123 = 0, $124 = 0, $125 = 0, $126 = 0, $127 = 0, $128 = 0, $129 = 0, $13 = 0, $130 = 0, $131 = 0, $132 = 0, $133 = 0;
 var $134 = 0, $135 = 0, $136 = 0, $137 = 0, $138 = 0, $139 = 0, $14 = 0, $140 = 0, $141 = 0.0, $142 = 0.0, $143 = 0, $144 = 0, $145 = 0, $146 = 0, $147 = 0, $148 = 0, $149 = 0, $15 = 0, $150 = 0, $151 = 0.0;
 var $152 = 0.0, $153 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0, $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0;
 var $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0, $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0;
 var $50 = 0, $51 = 0, $52 = 0, $53 = 0, $54 = 0, $55 = 0, $56 = 0, $57 = 0, $58 = 0, $59 = 0, $6 = 0, $60 = 0, $61 = 0, $62 = 0, $63 = 0, $64 = 0, $65 = 0, $66 = 0, $67 = 0, $68 = 0;
 var $69 = 0, $7 = 0, $70 = 0, $71 = 0, $72 = 0, $73 = 0, $74 = 0, $75 = 0, $76 = 0, $77 = 0, $78 = 0, $79 = 0, $8 = 0, $80 = 0, $81 = 0, $82 = 0, $83 = 0, $84 = 0, $85 = 0, $86 = 0;
 var $87 = 0, $88 = 0, $89 = 0, $9 = 0, $90 = 0, $91 = 0, $92 = 0, $93 = 0, $94 = 0, $95 = 0, $96 = 0, $97 = 0, $98 = 0, $99 = 0, $ap$addr = 0, $arg$addr = 0, $arglist_current = 0, $arglist_current11 = 0, $arglist_current14 = 0, $arglist_current17 = 0;
 var $arglist_current2 = 0, $arglist_current20 = 0, $arglist_current23 = 0, $arglist_current26 = 0, $arglist_current5 = 0, $arglist_current8 = 0, $arglist_next = 0, $arglist_next12 = 0, $arglist_next15 = 0, $arglist_next18 = 0, $arglist_next21 = 0, $arglist_next24 = 0, $arglist_next27 = 0, $arglist_next3 = 0, $arglist_next6 = 0, $arglist_next9 = 0, $cmp = 0, $conv16 = 0, $conv22 = 0, $conv28 = 0;
 var $conv34 = 0, $expanded = 0, $expanded28 = 0, $expanded30 = 0, $expanded31 = 0, $expanded32 = 0, $expanded34 = 0, $expanded35 = 0, $expanded37 = 0, $expanded38 = 0, $expanded39 = 0, $expanded41 = 0, $expanded42 = 0, $expanded44 = 0, $expanded45 = 0, $expanded46 = 0, $expanded48 = 0, $expanded49 = 0, $expanded51 = 0, $expanded52 = 0;
 var $expanded53 = 0, $expanded55 = 0, $expanded56 = 0, $expanded58 = 0, $expanded59 = 0, $expanded60 = 0, $expanded62 = 0, $expanded63 = 0, $expanded65 = 0, $expanded66 = 0, $expanded67 = 0, $expanded69 = 0, $expanded70 = 0, $expanded72 = 0, $expanded73 = 0, $expanded74 = 0, $expanded76 = 0, $expanded77 = 0, $expanded79 = 0, $expanded80 = 0;
 var $expanded81 = 0, $expanded83 = 0, $expanded84 = 0, $expanded86 = 0, $expanded87 = 0, $expanded88 = 0, $expanded90 = 0, $expanded91 = 0, $expanded93 = 0, $expanded94 = 0, $expanded95 = 0, $type$addr = 0, $varet = 0, $varet11 = 0, $varet15 = 0, $varet21 = 0, $varet27 = 0, $varet3 = 0, $varet33 = 0, $varet39 = 0.0;
 var $varet42 = 0.0, $varet6 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 64|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(64|0);
 $varet11 = sp + 16|0;
 $arg$addr = $arg;
 $type$addr = $type;
 $ap$addr = $ap;
 $0 = $type$addr;
 $cmp = ($0>>>0)>(20);
 if ($cmp) {
  STACKTOP = sp;return;
 }
 $1 = $type$addr;
 do {
  switch ($1|0) {
  case 9:  {
   $2 = $ap$addr;
   $arglist_current = HEAP32[$2>>2]|0;
   $3 = $arglist_current;
   $4 = ((0) + 4|0);
   $expanded28 = $4;
   $expanded = (($expanded28) - 1)|0;
   $5 = (($3) + ($expanded))|0;
   $6 = ((0) + 4|0);
   $expanded32 = $6;
   $expanded31 = (($expanded32) - 1)|0;
   $expanded30 = $expanded31 ^ -1;
   $7 = $5 & $expanded30;
   $8 = $7;
   $9 = HEAP32[$8>>2]|0;
   $arglist_next = ((($8)) + 4|0);
   HEAP32[$2>>2] = $arglist_next;
   $varet = $9;
   $10 = $varet;
   $11 = $arg$addr;
   HEAP32[$11>>2] = $10;
   STACKTOP = sp;return;
   break;
  }
  case 10:  {
   $12 = $ap$addr;
   $arglist_current2 = HEAP32[$12>>2]|0;
   $13 = $arglist_current2;
   $14 = ((0) + 4|0);
   $expanded35 = $14;
   $expanded34 = (($expanded35) - 1)|0;
   $15 = (($13) + ($expanded34))|0;
   $16 = ((0) + 4|0);
   $expanded39 = $16;
   $expanded38 = (($expanded39) - 1)|0;
   $expanded37 = $expanded38 ^ -1;
   $17 = $15 & $expanded37;
   $18 = $17;
   $19 = HEAP32[$18>>2]|0;
   $arglist_next3 = ((($18)) + 4|0);
   HEAP32[$12>>2] = $arglist_next3;
   $varet3 = $19;
   $20 = $varet3;
   $21 = ($20|0)<(0);
   $22 = $21 << 31 >> 31;
   $23 = $arg$addr;
   $24 = $23;
   $25 = $24;
   HEAP32[$25>>2] = $20;
   $26 = (($24) + 4)|0;
   $27 = $26;
   HEAP32[$27>>2] = $22;
   STACKTOP = sp;return;
   break;
  }
  case 11:  {
   $28 = $ap$addr;
   $arglist_current5 = HEAP32[$28>>2]|0;
   $29 = $arglist_current5;
   $30 = ((0) + 4|0);
   $expanded42 = $30;
   $expanded41 = (($expanded42) - 1)|0;
   $31 = (($29) + ($expanded41))|0;
   $32 = ((0) + 4|0);
   $expanded46 = $32;
   $expanded45 = (($expanded46) - 1)|0;
   $expanded44 = $expanded45 ^ -1;
   $33 = $31 & $expanded44;
   $34 = $33;
   $35 = HEAP32[$34>>2]|0;
   $arglist_next6 = ((($34)) + 4|0);
   HEAP32[$28>>2] = $arglist_next6;
   $varet6 = $35;
   $36 = $varet6;
   $37 = $arg$addr;
   $38 = $37;
   $39 = $38;
   HEAP32[$39>>2] = $36;
   $40 = (($38) + 4)|0;
   $41 = $40;
   HEAP32[$41>>2] = 0;
   STACKTOP = sp;return;
   break;
  }
  case 12:  {
   $42 = $ap$addr;
   $arglist_current8 = HEAP32[$42>>2]|0;
   $43 = $arglist_current8;
   $44 = ((0) + 8|0);
   $expanded49 = $44;
   $expanded48 = (($expanded49) - 1)|0;
   $45 = (($43) + ($expanded48))|0;
   $46 = ((0) + 8|0);
   $expanded53 = $46;
   $expanded52 = (($expanded53) - 1)|0;
   $expanded51 = $expanded52 ^ -1;
   $47 = $45 & $expanded51;
   $48 = $47;
   $49 = $48;
   $50 = $49;
   $51 = HEAP32[$50>>2]|0;
   $52 = (($49) + 4)|0;
   $53 = $52;
   $54 = HEAP32[$53>>2]|0;
   $arglist_next9 = ((($48)) + 8|0);
   HEAP32[$42>>2] = $arglist_next9;
   $55 = $varet11;
   $56 = $55;
   HEAP32[$56>>2] = $51;
   $57 = (($55) + 4)|0;
   $58 = $57;
   HEAP32[$58>>2] = $54;
   $59 = $varet11;
   $60 = $59;
   $61 = HEAP32[$60>>2]|0;
   $62 = (($59) + 4)|0;
   $63 = $62;
   $64 = HEAP32[$63>>2]|0;
   $65 = $arg$addr;
   $66 = $65;
   $67 = $66;
   HEAP32[$67>>2] = $61;
   $68 = (($66) + 4)|0;
   $69 = $68;
   HEAP32[$69>>2] = $64;
   STACKTOP = sp;return;
   break;
  }
  case 13:  {
   $70 = $ap$addr;
   $arglist_current11 = HEAP32[$70>>2]|0;
   $71 = $arglist_current11;
   $72 = ((0) + 4|0);
   $expanded56 = $72;
   $expanded55 = (($expanded56) - 1)|0;
   $73 = (($71) + ($expanded55))|0;
   $74 = ((0) + 4|0);
   $expanded60 = $74;
   $expanded59 = (($expanded60) - 1)|0;
   $expanded58 = $expanded59 ^ -1;
   $75 = $73 & $expanded58;
   $76 = $75;
   $77 = HEAP32[$76>>2]|0;
   $arglist_next12 = ((($76)) + 4|0);
   HEAP32[$70>>2] = $arglist_next12;
   $varet15 = $77;
   $78 = $varet15;
   $conv16 = $78&65535;
   $79 = $conv16 << 16 >> 16;
   $80 = ($79|0)<(0);
   $81 = $80 << 31 >> 31;
   $82 = $arg$addr;
   $83 = $82;
   $84 = $83;
   HEAP32[$84>>2] = $79;
   $85 = (($83) + 4)|0;
   $86 = $85;
   HEAP32[$86>>2] = $81;
   STACKTOP = sp;return;
   break;
  }
  case 14:  {
   $87 = $ap$addr;
   $arglist_current14 = HEAP32[$87>>2]|0;
   $88 = $arglist_current14;
   $89 = ((0) + 4|0);
   $expanded63 = $89;
   $expanded62 = (($expanded63) - 1)|0;
   $90 = (($88) + ($expanded62))|0;
   $91 = ((0) + 4|0);
   $expanded67 = $91;
   $expanded66 = (($expanded67) - 1)|0;
   $expanded65 = $expanded66 ^ -1;
   $92 = $90 & $expanded65;
   $93 = $92;
   $94 = HEAP32[$93>>2]|0;
   $arglist_next15 = ((($93)) + 4|0);
   HEAP32[$87>>2] = $arglist_next15;
   $varet21 = $94;
   $95 = $varet21;
   $conv22 = $95&65535;
   $96 = $conv22&65535;
   $97 = $arg$addr;
   $98 = $97;
   $99 = $98;
   HEAP32[$99>>2] = $96;
   $100 = (($98) + 4)|0;
   $101 = $100;
   HEAP32[$101>>2] = 0;
   STACKTOP = sp;return;
   break;
  }
  case 15:  {
   $102 = $ap$addr;
   $arglist_current17 = HEAP32[$102>>2]|0;
   $103 = $arglist_current17;
   $104 = ((0) + 4|0);
   $expanded70 = $104;
   $expanded69 = (($expanded70) - 1)|0;
   $105 = (($103) + ($expanded69))|0;
   $106 = ((0) + 4|0);
   $expanded74 = $106;
   $expanded73 = (($expanded74) - 1)|0;
   $expanded72 = $expanded73 ^ -1;
   $107 = $105 & $expanded72;
   $108 = $107;
   $109 = HEAP32[$108>>2]|0;
   $arglist_next18 = ((($108)) + 4|0);
   HEAP32[$102>>2] = $arglist_next18;
   $varet27 = $109;
   $110 = $varet27;
   $conv28 = $110&255;
   $111 = $conv28 << 24 >> 24;
   $112 = ($111|0)<(0);
   $113 = $112 << 31 >> 31;
   $114 = $arg$addr;
   $115 = $114;
   $116 = $115;
   HEAP32[$116>>2] = $111;
   $117 = (($115) + 4)|0;
   $118 = $117;
   HEAP32[$118>>2] = $113;
   STACKTOP = sp;return;
   break;
  }
  case 16:  {
   $119 = $ap$addr;
   $arglist_current20 = HEAP32[$119>>2]|0;
   $120 = $arglist_current20;
   $121 = ((0) + 4|0);
   $expanded77 = $121;
   $expanded76 = (($expanded77) - 1)|0;
   $122 = (($120) + ($expanded76))|0;
   $123 = ((0) + 4|0);
   $expanded81 = $123;
   $expanded80 = (($expanded81) - 1)|0;
   $expanded79 = $expanded80 ^ -1;
   $124 = $122 & $expanded79;
   $125 = $124;
   $126 = HEAP32[$125>>2]|0;
   $arglist_next21 = ((($125)) + 4|0);
   HEAP32[$119>>2] = $arglist_next21;
   $varet33 = $126;
   $127 = $varet33;
   $conv34 = $127&255;
   $128 = $conv34&255;
   $129 = $arg$addr;
   $130 = $129;
   $131 = $130;
   HEAP32[$131>>2] = $128;
   $132 = (($130) + 4)|0;
   $133 = $132;
   HEAP32[$133>>2] = 0;
   STACKTOP = sp;return;
   break;
  }
  case 17:  {
   $134 = $ap$addr;
   $arglist_current23 = HEAP32[$134>>2]|0;
   $135 = $arglist_current23;
   $136 = ((0) + 8|0);
   $expanded84 = $136;
   $expanded83 = (($expanded84) - 1)|0;
   $137 = (($135) + ($expanded83))|0;
   $138 = ((0) + 8|0);
   $expanded88 = $138;
   $expanded87 = (($expanded88) - 1)|0;
   $expanded86 = $expanded87 ^ -1;
   $139 = $137 & $expanded86;
   $140 = $139;
   $141 = +HEAPF64[$140>>3];
   $arglist_next24 = ((($140)) + 8|0);
   HEAP32[$134>>2] = $arglist_next24;
   $varet39 = $141;
   $142 = $varet39;
   $143 = $arg$addr;
   HEAPF64[$143>>3] = $142;
   STACKTOP = sp;return;
   break;
  }
  case 18:  {
   $144 = $ap$addr;
   $arglist_current26 = HEAP32[$144>>2]|0;
   $145 = $arglist_current26;
   $146 = ((0) + 8|0);
   $expanded91 = $146;
   $expanded90 = (($expanded91) - 1)|0;
   $147 = (($145) + ($expanded90))|0;
   $148 = ((0) + 8|0);
   $expanded95 = $148;
   $expanded94 = (($expanded95) - 1)|0;
   $expanded93 = $expanded94 ^ -1;
   $149 = $147 & $expanded93;
   $150 = $149;
   $151 = +HEAPF64[$150>>3];
   $arglist_next27 = ((($150)) + 8|0);
   HEAP32[$144>>2] = $arglist_next27;
   $varet42 = $151;
   $152 = $varet42;
   $153 = $arg$addr;
   HEAPF64[$153>>3] = $152;
   STACKTOP = sp;return;
   break;
  }
  default: {
   STACKTOP = sp;return;
  }
  }
 } while(0);
}
function _fmt_x($0,$1,$s,$lower) {
 $0 = $0|0;
 $1 = $1|0;
 $s = $s|0;
 $lower = $lower|0;
 var $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0, $27 = 0, $28 = 0;
 var $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $arrayidx = 0, $conv = 0, $conv1 = 0, $incdec$ptr = 0;
 var $lower$addr = 0, $or = 0, $s$addr = 0, $x$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = sp;
 $2 = $x$addr;
 $3 = $2;
 HEAP32[$3>>2] = $0;
 $4 = (($2) + 4)|0;
 $5 = $4;
 HEAP32[$5>>2] = $1;
 $s$addr = $s;
 $lower$addr = $lower;
 while(1) {
  $6 = $x$addr;
  $7 = $6;
  $8 = HEAP32[$7>>2]|0;
  $9 = (($6) + 4)|0;
  $10 = $9;
  $11 = HEAP32[$10>>2]|0;
  $12 = ($8|0)!=(0);
  $13 = ($11|0)!=(0);
  $14 = $12 | $13;
  if (!($14)) {
   break;
  }
  $15 = $x$addr;
  $16 = $15;
  $17 = HEAP32[$16>>2]|0;
  $18 = (($15) + 4)|0;
  $19 = $18;
  $20 = HEAP32[$19>>2]|0;
  $21 = $17 & 15;
  $arrayidx = (1625 + ($21)|0);
  $22 = HEAP8[$arrayidx>>0]|0;
  $conv = $22 << 24 >> 24;
  $23 = $lower$addr;
  $or = $conv | $23;
  $conv1 = $or&255;
  $24 = $s$addr;
  $incdec$ptr = ((($24)) + -1|0);
  $s$addr = $incdec$ptr;
  HEAP8[$incdec$ptr>>0] = $conv1;
  $25 = $x$addr;
  $26 = $25;
  $27 = HEAP32[$26>>2]|0;
  $28 = (($25) + 4)|0;
  $29 = $28;
  $30 = HEAP32[$29>>2]|0;
  $31 = (_bitshift64Lshr(($27|0),($30|0),4)|0);
  $32 = tempRet0;
  $33 = $x$addr;
  $34 = $33;
  HEAP32[$34>>2] = $31;
  $35 = (($33) + 4)|0;
  $36 = $35;
  HEAP32[$36>>2] = $32;
 }
 $37 = $s$addr;
 STACKTOP = sp;return ($37|0);
}
function _fmt_o($0,$1,$s) {
 $0 = $0|0;
 $1 = $1|0;
 $s = $s|0;
 var $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0, $27 = 0, $28 = 0;
 var $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $incdec$ptr = 0, $s$addr = 0, $x$addr = 0;
 var label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = sp;
 $2 = $x$addr;
 $3 = $2;
 HEAP32[$3>>2] = $0;
 $4 = (($2) + 4)|0;
 $5 = $4;
 HEAP32[$5>>2] = $1;
 $s$addr = $s;
 while(1) {
  $6 = $x$addr;
  $7 = $6;
  $8 = HEAP32[$7>>2]|0;
  $9 = (($6) + 4)|0;
  $10 = $9;
  $11 = HEAP32[$10>>2]|0;
  $12 = ($8|0)!=(0);
  $13 = ($11|0)!=(0);
  $14 = $12 | $13;
  if (!($14)) {
   break;
  }
  $15 = $x$addr;
  $16 = $15;
  $17 = HEAP32[$16>>2]|0;
  $18 = (($15) + 4)|0;
  $19 = $18;
  $20 = HEAP32[$19>>2]|0;
  $21 = $17 & 7;
  $22 = (_i64Add(48,0,($21|0),0)|0);
  $23 = tempRet0;
  $24 = $22&255;
  $25 = $s$addr;
  $incdec$ptr = ((($25)) + -1|0);
  $s$addr = $incdec$ptr;
  HEAP8[$incdec$ptr>>0] = $24;
  $26 = $x$addr;
  $27 = $26;
  $28 = HEAP32[$27>>2]|0;
  $29 = (($26) + 4)|0;
  $30 = $29;
  $31 = HEAP32[$30>>2]|0;
  $32 = (_bitshift64Lshr(($28|0),($31|0),3)|0);
  $33 = tempRet0;
  $34 = $x$addr;
  $35 = $34;
  HEAP32[$35>>2] = $32;
  $36 = (($34) + 4)|0;
  $37 = $36;
  HEAP32[$37>>2] = $33;
 }
 $38 = $s$addr;
 STACKTOP = sp;return ($38|0);
}
function _fmt_u($0,$1,$s) {
 $0 = $0|0;
 $1 = $1|0;
 $s = $s|0;
 var $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0, $27 = 0, $28 = 0;
 var $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0, $45 = 0, $5 = 0;
 var $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add5 = 0, $conv6 = 0, $div9 = 0, $incdec$ptr = 0, $incdec$ptr7 = 0, $rem4 = 0, $s$addr = 0, $tobool = 0, $x$addr = 0, $y = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = sp;
 $2 = $x$addr;
 $3 = $2;
 HEAP32[$3>>2] = $0;
 $4 = (($2) + 4)|0;
 $5 = $4;
 HEAP32[$5>>2] = $1;
 $s$addr = $s;
 while(1) {
  $6 = $x$addr;
  $7 = $6;
  $8 = HEAP32[$7>>2]|0;
  $9 = (($6) + 4)|0;
  $10 = $9;
  $11 = HEAP32[$10>>2]|0;
  $12 = ($11>>>0)>(0);
  $13 = ($8>>>0)>(4294967295);
  $14 = ($11|0)==(0);
  $15 = $14 & $13;
  $16 = $12 | $15;
  $17 = $x$addr;
  $18 = $17;
  $19 = HEAP32[$18>>2]|0;
  $20 = (($17) + 4)|0;
  $21 = $20;
  $22 = HEAP32[$21>>2]|0;
  if (!($16)) {
   break;
  }
  $23 = (___uremdi3(($19|0),($22|0),10,0)|0);
  $24 = tempRet0;
  $25 = (_i64Add(48,0,($23|0),($24|0))|0);
  $26 = tempRet0;
  $27 = $25&255;
  $28 = $s$addr;
  $incdec$ptr = ((($28)) + -1|0);
  $s$addr = $incdec$ptr;
  HEAP8[$incdec$ptr>>0] = $27;
  $29 = $x$addr;
  $30 = $29;
  $31 = HEAP32[$30>>2]|0;
  $32 = (($29) + 4)|0;
  $33 = $32;
  $34 = HEAP32[$33>>2]|0;
  $35 = (___udivdi3(($31|0),($34|0),10,0)|0);
  $36 = tempRet0;
  $37 = $x$addr;
  $38 = $37;
  HEAP32[$38>>2] = $35;
  $39 = (($37) + 4)|0;
  $40 = $39;
  HEAP32[$40>>2] = $36;
 }
 $y = $19;
 while(1) {
  $41 = $y;
  $tobool = ($41|0)!=(0);
  if (!($tobool)) {
   break;
  }
  $42 = $y;
  $rem4 = (($42>>>0) % 10)&-1;
  $add5 = (48 + ($rem4))|0;
  $conv6 = $add5&255;
  $43 = $s$addr;
  $incdec$ptr7 = ((($43)) + -1|0);
  $s$addr = $incdec$ptr7;
  HEAP8[$incdec$ptr7>>0] = $conv6;
  $44 = $y;
  $div9 = (($44>>>0) / 10)&-1;
  $y = $div9;
 }
 $45 = $s$addr;
 STACKTOP = sp;return ($45|0);
}
function _strerror($e) {
 $e = $e|0;
 var $0 = 0, $1 = 0, $call = 0, $call1 = 0, $e$addr = 0, $locale = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $e$addr = $e;
 $0 = $e$addr;
 $call = (___pthread_self_563()|0);
 $locale = ((($call)) + 188|0);
 $1 = HEAP32[$locale>>2]|0;
 $call1 = (___strerror_l($0,$1)|0);
 STACKTOP = sp;return ($call1|0);
}
function _wctomb($s,$wc) {
 $s = $s|0;
 $wc = $wc|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $call = 0, $retval = 0, $s$addr = 0, $tobool = 0, $wc$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $s$addr = $s;
 $wc$addr = $wc;
 $0 = $s$addr;
 $tobool = ($0|0)!=(0|0);
 if ($tobool) {
  $1 = $s$addr;
  $2 = $wc$addr;
  $call = (_wcrtomb($1,$2,0)|0);
  $retval = $call;
 } else {
  $retval = 0;
 }
 $3 = $retval;
 STACKTOP = sp;return ($3|0);
}
function _pad_677($f,$c,$w,$l,$fl) {
 $f = $f|0;
 $c = $c|0;
 $w = $w|0;
 $l = $l|0;
 $fl = $fl|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $and = 0, $c$addr = 0, $cmp = 0, $cmp1 = 0, $cmp3 = 0, $cond = 0, $conv = 0;
 var $f$addr = 0, $fl$addr = 0, $l$addr = 0, $pad = 0, $sub = 0, $sub6 = 0, $tobool = 0, $w$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 288|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(288|0);
 $pad = sp + 16|0;
 $f$addr = $f;
 $c$addr = $c;
 $w$addr = $w;
 $l$addr = $l;
 $fl$addr = $fl;
 $0 = $fl$addr;
 $and = $0 & 73728;
 $tobool = ($and|0)!=(0);
 if ($tobool) {
  STACKTOP = sp;return;
 }
 $1 = $l$addr;
 $2 = $w$addr;
 $cmp = ($1|0)>=($2|0);
 if ($cmp) {
  STACKTOP = sp;return;
 }
 $3 = $w$addr;
 $4 = $l$addr;
 $sub = (($3) - ($4))|0;
 $l$addr = $sub;
 $5 = $c$addr;
 $conv = $5 << 24 >> 24;
 $6 = $conv&255;
 $7 = $l$addr;
 $cmp1 = ($7>>>0)>(256);
 $8 = $l$addr;
 $cond = $cmp1 ? 256 : $8;
 _memset(($pad|0),($6|0),($cond|0))|0;
 while(1) {
  $9 = $l$addr;
  $cmp3 = ($9>>>0)>=(256);
  $10 = $f$addr;
  if (!($cmp3)) {
   break;
  }
  _out($10,$pad,256);
  $11 = $l$addr;
  $sub6 = (($11) - 256)|0;
  $l$addr = $sub6;
 }
 $12 = $l$addr;
 _out($10,$pad,$12);
 STACKTOP = sp;return;
}
function _fmt_fp($f,$y,$w,$p,$fl,$t) {
 $f = $f|0;
 $y = +$y;
 $w = $w|0;
 $p = $p|0;
 $fl = $fl|0;
 $t = $t|0;
 var $0 = 0.0, $1 = 0, $10 = 0.0, $100 = 0, $101 = 0, $102 = 0, $103 = 0, $104 = 0, $105 = 0, $106 = 0, $107 = 0, $108 = 0, $109 = 0, $11 = 0, $110 = 0, $111 = 0, $112 = 0, $113 = 0, $114 = 0, $115 = 0;
 var $116 = 0, $117 = 0, $118 = 0, $119 = 0, $12 = 0, $120 = 0, $121 = 0, $122 = 0, $123 = 0, $124 = 0, $125 = 0, $126 = 0, $127 = 0, $128 = 0, $129 = 0, $13 = 0, $130 = 0, $131 = 0, $132 = 0, $133 = 0;
 var $134 = 0, $135 = 0, $136 = 0.0, $137 = 0.0, $138 = 0, $139 = 0, $14 = 0, $140 = 0.0, $141 = 0, $142 = 0.0, $143 = 0, $144 = 0, $145 = 0.0, $146 = 0, $147 = 0, $148 = 0, $149 = 0, $15 = 0, $150 = 0, $151 = 0;
 var $152 = 0, $153 = 0, $154 = 0, $155 = 0, $156 = 0, $157 = 0, $158 = 0, $159 = 0, $16 = 0, $160 = 0, $161 = 0, $162 = 0, $163 = 0, $164 = 0, $165 = 0, $166 = 0, $167 = 0, $168 = 0, $169 = 0, $17 = 0;
 var $170 = 0, $171 = 0, $172 = 0, $173 = 0, $174 = 0, $175 = 0, $176 = 0, $177 = 0, $178 = 0, $179 = 0, $18 = 0, $180 = 0, $181 = 0, $182 = 0, $183 = 0, $184 = 0, $185 = 0, $186 = 0, $187 = 0, $188 = 0;
 var $189 = 0, $19 = 0, $190 = 0, $191 = 0, $192 = 0, $193 = 0, $194 = 0, $195 = 0, $196 = 0, $197 = 0, $198 = 0, $199 = 0, $2 = 0, $20 = 0.0, $200 = 0, $201 = 0, $202 = 0, $203 = 0, $204 = 0, $205 = 0;
 var $206 = 0, $207 = 0, $208 = 0, $209 = 0, $21 = 0.0, $210 = 0, $211 = 0, $212 = 0, $213 = 0, $214 = 0, $215 = 0, $216 = 0, $217 = 0, $218 = 0, $219 = 0, $22 = 0, $220 = 0, $221 = 0, $222 = 0, $223 = 0;
 var $224 = 0, $225 = 0, $226 = 0, $227 = 0, $228 = 0, $229 = 0, $23 = 0, $230 = 0, $231 = 0, $232 = 0, $233 = 0, $234 = 0, $235 = 0, $236 = 0, $237 = 0, $238 = 0, $239 = 0, $24 = 0, $240 = 0, $241 = 0;
 var $242 = 0, $243 = 0, $244 = 0, $245 = 0, $246 = 0, $247 = 0, $248 = 0, $249 = 0, $25 = 0, $250 = 0, $251 = 0, $252 = 0, $253 = 0, $254 = 0, $255 = 0, $256 = 0, $257 = 0, $258 = 0, $259 = 0, $26 = 0;
 var $260 = 0, $261 = 0.0, $262 = 0, $263 = 0, $264 = 0, $265 = 0, $266 = 0, $267 = 0, $268 = 0, $269 = 0, $27 = 0, $270 = 0, $271 = 0.0, $272 = 0.0, $273 = 0, $274 = 0, $275 = 0, $276 = 0.0, $277 = 0.0, $278 = 0.0;
 var $279 = 0, $28 = 0, $280 = 0, $281 = 0, $282 = 0, $283 = 0, $284 = 0, $285 = 0, $286 = 0, $287 = 0, $288 = 0, $289 = 0, $29 = 0, $290 = 0, $291 = 0, $292 = 0, $293 = 0, $294 = 0, $295 = 0, $296 = 0;
 var $297 = 0, $298 = 0, $299 = 0, $3 = 0, $30 = 0, $300 = 0, $301 = 0, $302 = 0, $303 = 0, $304 = 0, $305 = 0, $306 = 0, $307 = 0, $308 = 0, $309 = 0, $31 = 0, $310 = 0, $311 = 0, $312 = 0, $313 = 0;
 var $314 = 0, $315 = 0, $316 = 0, $317 = 0, $318 = 0, $319 = 0, $32 = 0, $320 = 0, $321 = 0, $322 = 0, $323 = 0, $324 = 0, $325 = 0, $326 = 0, $327 = 0, $328 = 0, $329 = 0, $33 = 0, $330 = 0, $331 = 0;
 var $332 = 0, $333 = 0, $334 = 0, $335 = 0, $336 = 0, $337 = 0, $338 = 0, $339 = 0, $34 = 0, $340 = 0, $341 = 0, $342 = 0, $343 = 0, $344 = 0, $345 = 0, $346 = 0, $347 = 0, $348 = 0, $349 = 0, $35 = 0;
 var $350 = 0, $351 = 0, $352 = 0, $353 = 0, $354 = 0, $355 = 0, $356 = 0, $357 = 0, $358 = 0, $359 = 0, $36 = 0, $360 = 0, $361 = 0, $362 = 0, $363 = 0, $364 = 0, $365 = 0, $366 = 0, $367 = 0, $368 = 0;
 var $369 = 0, $37 = 0, $370 = 0, $371 = 0, $372 = 0, $373 = 0, $374 = 0, $375 = 0, $376 = 0, $377 = 0, $378 = 0, $379 = 0, $38 = 0, $380 = 0, $381 = 0, $382 = 0, $383 = 0, $384 = 0, $385 = 0, $386 = 0;
 var $387 = 0, $388 = 0, $389 = 0, $39 = 0, $390 = 0, $391 = 0, $392 = 0, $393 = 0, $394 = 0, $395 = 0, $396 = 0, $397 = 0, $398 = 0, $399 = 0, $4 = 0, $40 = 0.0, $400 = 0, $401 = 0, $402 = 0, $403 = 0;
 var $404 = 0, $405 = 0, $406 = 0, $407 = 0, $408 = 0, $409 = 0, $41 = 0.0, $410 = 0, $411 = 0, $412 = 0, $413 = 0, $414 = 0, $415 = 0, $416 = 0, $417 = 0, $418 = 0, $419 = 0, $42 = 0, $420 = 0, $421 = 0;
 var $422 = 0, $423 = 0, $424 = 0, $425 = 0, $426 = 0, $427 = 0, $428 = 0, $429 = 0, $43 = 0, $430 = 0, $431 = 0, $432 = 0, $433 = 0, $434 = 0, $435 = 0, $436 = 0, $437 = 0, $438 = 0, $439 = 0, $44 = 0;
 var $440 = 0, $441 = 0, $442 = 0, $443 = 0, $444 = 0, $445 = 0, $446 = 0, $447 = 0, $448 = 0, $449 = 0, $45 = 0, $450 = 0, $451 = 0, $452 = 0, $453 = 0, $454 = 0, $455 = 0, $456 = 0, $457 = 0, $458 = 0;
 var $459 = 0, $46 = 0, $460 = 0, $461 = 0, $462 = 0, $463 = 0, $464 = 0, $465 = 0, $466 = 0, $467 = 0, $468 = 0, $469 = 0, $47 = 0, $470 = 0, $471 = 0, $472 = 0, $473 = 0, $474 = 0, $475 = 0, $476 = 0;
 var $477 = 0, $478 = 0, $479 = 0, $48 = 0, $480 = 0, $49 = 0, $5 = 0.0, $50 = 0, $51 = 0, $52 = 0.0, $53 = 0, $54 = 0, $55 = 0.0, $56 = 0.0, $57 = 0.0, $58 = 0.0, $59 = 0.0, $6 = 0, $60 = 0.0, $61 = 0.0;
 var $62 = 0.0, $63 = 0.0, $64 = 0.0, $65 = 0, $66 = 0, $67 = 0, $68 = 0, $69 = 0, $7 = 0, $70 = 0, $71 = 0, $72 = 0, $73 = 0, $74 = 0, $75 = 0, $76 = 0, $77 = 0, $78 = 0.0, $79 = 0, $8 = 0;
 var $80 = 0, $81 = 0, $82 = 0, $83 = 0.0, $84 = 0, $85 = 0, $86 = 0.0, $87 = 0, $88 = 0, $89 = 0, $9 = 0, $90 = 0.0, $91 = 0, $92 = 0, $93 = 0, $94 = 0, $95 = 0, $96 = 0, $97 = 0, $98 = 0;
 var $99 = 0, $a = 0, $add = 0, $add$ptr = 0, $add$ptr15 = 0, $add$ptr211 = 0, $add$ptr212 = 0, $add$ptr213 = 0, $add$ptr234 = 0, $add$ptr311 = 0, $add$ptr354 = 0, $add$ptr358 = 0, $add$ptr373 = 0, $add$ptr393 = 0, $add$ptr442 = 0, $add$ptr446 = 0, $add$ptr65 = 0, $add$ptr671 = 0, $add$ptr685 = 0, $add$ptr693 = 0;
 var $add$ptr718 = 0, $add$ptr742 = 0, $add$ptr756 = 0, $add$ptr759 = 0, $add$ptr786 = 0, $add$ptr794 = 0, $add$ptr802 = 0, $add113 = 0, $add150 = 0, $add154 = 0, $add163 = 0, $add165 = 0, $add166 = 0, $add185 = 0, $add187 = 0, $add192 = 0, $add272 = 0, $add273 = 0, $add275 = 0, $add284 = 0;
 var $add313 = 0, $add355 = 0, $add359 = 0, $add382 = 0.0, $add410 = 0.0, $add414 = 0, $add46 = 0, $add47 = 0, $add477 = 0, $add52 = 0, $add561 = 0, $add573 = 0, $add587 = 0, $add599 = 0, $add608 = 0, $add612 = 0, $add620 = 0, $add651 = 0, $add653 = 0, $add654 = 0;
 var $add67 = 0, $add737 = 0, $add810 = 0, $add815 = 0, $add817 = 0, $add822 = 0, $add87 = 0.0, $add90 = 0.0, $and = 0, $and119 = 0, $and12 = 0, $and134 = 0, $and282 = 0, $and36 = 0, $and379 = 0, $and41 = 0, $and45 = 0, $and483 = 0, $and610 = 0, $and62 = 0;
 var $and702 = 0, $and780 = 0, $arrayidx = 0, $arrayidx117 = 0, $arrayidx251 = 0, $arrayidx453 = 0, $arrayidx489 = 0, $arrayidx493 = 0, $b = 0, $big = 0, $buf = 0, $call55 = 0.0, $carry = 0, $carry262 = 0, $cmp103 = 0, $cmp108 = 0, $cmp127 = 0, $cmp131 = 0, $cmp147 = 0, $cmp188 = 0;
 var $cmp196 = 0, $cmp205 = 0, $cmp225 = 0, $cmp228 = 0, $cmp235 = 0, $cmp249 = 0, $cmp259 = 0, $cmp265 = 0, $cmp277 = 0, $cmp299 = 0, $cmp308 = 0, $cmp315 = 0, $cmp324 = 0, $cmp333 = 0, $cmp338 = 0, $cmp350 = 0, $cmp363 = 0, $cmp374 = 0, $cmp38 = 0, $cmp385 = 0;
 var $cmp390 = 0, $cmp394 = 0, $cmp403 = 0, $cmp411 = 0, $cmp416 = 0, $cmp420 = 0, $cmp433 = 0, $cmp443 = 0, $cmp450 = 0, $cmp463 = 0, $cmp470 = 0, $cmp473 = 0, $cmp48 = 0, $cmp486 = 0, $cmp495 = 0, $cmp505 = 0, $cmp515 = 0, $cmp528 = 0, $cmp539 = 0, $cmp563 = 0;
 var $cmp577 = 0, $cmp589 = 0, $cmp59 = 0, $cmp614 = 0, $cmp617 = 0, $cmp623 = 0, $cmp636 = 0, $cmp641 = 0, $cmp657 = 0, $cmp660 = 0, $cmp665 = 0, $cmp673 = 0, $cmp678 = 0, $cmp68 = 0, $cmp686 = 0, $cmp70 = 0, $cmp707 = 0, $cmp710 = 0, $cmp722 = 0, $cmp727 = 0;
 var $cmp739 = 0, $cmp745 = 0, $cmp748 = 0, $cmp760 = 0, $cmp765 = 0, $cmp770 = 0, $cmp777 = 0, $cmp790 = 0, $cmp818 = 0, $cmp82 = 0, $cmp94 = 0, $cond = 0, $cond100 = 0, $cond110 = 0, $cond194 = 0, $cond233 = 0, $cond271 = 0, $cond304 = 0, $cond43 = 0, $cond527 = 0;
 var $cond53 = 0, $cond553 = 0, $cond576 = 0, $cond604 = 0, $cond629 = 0, $cond643 = 0, $cond732 = 0, $cond800 = 0, $cond824 = 0, $conv111 = 0, $conv114 = 0, $conv116 = 0, $conv118 = 0, $conv121 = 0, $conv123 = 0.0, $conv216 = 0, $conv218 = 0.0, $conv334 = 0, $conv402 = 0, $conv644 = 0;
 var $conv646 = 0, $conv81 = 0, $d = 0, $dec = 0, $dec476 = 0, $dec481 = 0, $dec78 = 0, $div274 = 0, $div356 = 0, $div378 = 0, $div384 = 0, $div389 = 0, $e = 0, $e2 = 0, $ebuf = 0, $ebuf0 = 0, $estr = 0, $f$addr = 0, $fl$addr = 0, $i = 0;
 var $inc = 0, $inc361 = 0, $inc368 = 0, $inc425 = 0, $inc438 = 0, $inc468 = 0, $inc500 = 0, $incdec$ptr = 0, $incdec$ptr106 = 0, $incdec$ptr112 = 0, $incdec$ptr115 = 0, $incdec$ptr122 = 0, $incdec$ptr137 = 0, $incdec$ptr217 = 0, $incdec$ptr243 = 0, $incdec$ptr246 = 0, $incdec$ptr254 = 0, $incdec$ptr288 = 0, $incdec$ptr292 = 0, $incdec$ptr296 = 0;
 var $incdec$ptr419 = 0, $incdec$ptr423 = 0, $incdec$ptr460 = 0, $incdec$ptr639 = 0, $incdec$ptr645 = 0, $incdec$ptr647 = 0, $incdec$ptr681 = 0, $incdec$ptr689 = 0, $incdec$ptr698 = 0, $incdec$ptr725 = 0, $incdec$ptr734 = 0, $incdec$ptr763 = 0, $incdec$ptr773 = 0, $incdec$ptr776 = 0, $incdec$ptr808 = 0, $j = 0, $l = 0, $land$ext = 0, $lnot = 0, $lnot455 = 0;
 var $lor$ext = 0, $mul = 0.0, $mul125 = 0.0, $mul202 = 0.0, $mul220 = 0.0, $mul286 = 0, $mul322 = 0, $mul328 = 0, $mul335 = 0, $mul349 = 0, $mul367 = 0, $mul406 = 0.0, $mul407 = 0.0, $mul431 = 0, $mul437 = 0, $mul499 = 0, $mul513 = 0, $mul524 = 0, $mul537 = 0, $mul548 = 0;
 var $mul572 = 0, $mul586 = 0, $mul598 = 0, $mul80 = 0.0, $need = 0, $or = 0, $or$cond = 0, $or$cond1 = 0, $or$cond2 = 0, $or120 = 0, $or298 = 0, $or332 = 0, $or337 = 0, $or462 = 0, $or504 = 0, $or613 = 0, $or656 = 0, $p$addr = 0, $pl = 0, $prefix = 0;
 var $r = 0, $re = 0, $rem360 = 0, $rem370 = 0, $rem494 = 0, $retval = 0, $rm = 0, $round = 0.0, $round377 = 0.0, $s = 0, $s35 = 0, $s668 = 0, $s715 = 0, $s753 = 0, $sh = 0, $sh263 = 0, $shl280 = 0, $shr283 = 0, $shr285 = 0, $small = 0.0;
 var $sub = 0.0, $sub$ptr$div = 0, $sub$ptr$div321 = 0, $sub$ptr$div347 = 0, $sub$ptr$div430 = 0, $sub$ptr$div511 = 0, $sub$ptr$div522 = 0, $sub$ptr$div535 = 0, $sub$ptr$div546 = 0, $sub$ptr$div570 = 0, $sub$ptr$div584 = 0, $sub$ptr$div596 = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$lhs$cast143 = 0, $sub$ptr$lhs$cast151 = 0, $sub$ptr$lhs$cast157 = 0, $sub$ptr$lhs$cast160 = 0, $sub$ptr$lhs$cast170 = 0, $sub$ptr$lhs$cast173 = 0, $sub$ptr$lhs$cast178 = 0;
 var $sub$ptr$lhs$cast182 = 0, $sub$ptr$lhs$cast305 = 0, $sub$ptr$lhs$cast318 = 0, $sub$ptr$lhs$cast344 = 0, $sub$ptr$lhs$cast427 = 0, $sub$ptr$lhs$cast508 = 0, $sub$ptr$lhs$cast519 = 0, $sub$ptr$lhs$cast532 = 0, $sub$ptr$lhs$cast543 = 0, $sub$ptr$lhs$cast567 = 0, $sub$ptr$lhs$cast581 = 0, $sub$ptr$lhs$cast593 = 0, $sub$ptr$lhs$cast633 = 0, $sub$ptr$lhs$cast648 = 0, $sub$ptr$lhs$cast694 = 0, $sub$ptr$lhs$cast787 = 0, $sub$ptr$lhs$cast795 = 0, $sub$ptr$lhs$cast803 = 0, $sub$ptr$lhs$cast811 = 0, $sub$ptr$rhs$cast = 0;
 var $sub$ptr$rhs$cast144 = 0, $sub$ptr$rhs$cast152 = 0, $sub$ptr$rhs$cast158 = 0, $sub$ptr$rhs$cast161 = 0, $sub$ptr$rhs$cast171 = 0, $sub$ptr$rhs$cast174 = 0, $sub$ptr$rhs$cast179 = 0, $sub$ptr$rhs$cast183 = 0, $sub$ptr$rhs$cast306 = 0, $sub$ptr$rhs$cast319 = 0, $sub$ptr$rhs$cast345 = 0, $sub$ptr$rhs$cast428 = 0, $sub$ptr$rhs$cast509 = 0, $sub$ptr$rhs$cast520 = 0, $sub$ptr$rhs$cast533 = 0, $sub$ptr$rhs$cast544 = 0, $sub$ptr$rhs$cast568 = 0, $sub$ptr$rhs$cast582 = 0, $sub$ptr$rhs$cast594 = 0, $sub$ptr$rhs$cast634 = 0;
 var $sub$ptr$rhs$cast649 = 0, $sub$ptr$rhs$cast695 = 0, $sub$ptr$rhs$cast788 = 0, $sub$ptr$rhs$cast796 = 0, $sub$ptr$rhs$cast804 = 0, $sub$ptr$rhs$cast812 = 0, $sub$ptr$sub = 0, $sub$ptr$sub145 = 0, $sub$ptr$sub153 = 0, $sub$ptr$sub159 = 0, $sub$ptr$sub162 = 0, $sub$ptr$sub172 = 0, $sub$ptr$sub175 = 0, $sub$ptr$sub180 = 0, $sub$ptr$sub184 = 0, $sub$ptr$sub307 = 0, $sub$ptr$sub320 = 0, $sub$ptr$sub346 = 0, $sub$ptr$sub429 = 0, $sub$ptr$sub510 = 0;
 var $sub$ptr$sub521 = 0, $sub$ptr$sub534 = 0, $sub$ptr$sub545 = 0, $sub$ptr$sub569 = 0, $sub$ptr$sub583 = 0, $sub$ptr$sub595 = 0, $sub$ptr$sub635 = 0, $sub$ptr$sub650 = 0, $sub$ptr$sub696 = 0, $sub$ptr$sub789 = 0, $sub$ptr$sub797 = 0, $sub$ptr$sub805 = 0, $sub$ptr$sub813 = 0, $sub124 = 0.0, $sub146 = 0, $sub176 = 0, $sub181 = 0, $sub203 = 0, $sub219 = 0.0, $sub256 = 0;
 var $sub264 = 0, $sub269 = 0, $sub281 = 0, $sub336 = 0, $sub343 = 0, $sub348 = 0, $sub357 = 0, $sub409 = 0, $sub478 = 0, $sub480 = 0, $sub512 = 0, $sub514 = 0, $sub523 = 0, $sub525 = 0, $sub536 = 0, $sub538 = 0, $sub547 = 0, $sub549 = 0, $sub562 = 0, $sub571 = 0;
 var $sub574 = 0, $sub585 = 0, $sub588 = 0, $sub597 = 0, $sub600 = 0, $sub626 = 0, $sub735 = 0, $sub74 = 0, $sub806 = 0, $sub85 = 0.0, $sub86 = 0.0, $sub88 = 0.0, $sub91 = 0.0, $sub97 = 0, $t$addr = 0, $tobool129 = 0, $tobool13 = 0, $tobool135 = 0, $tobool139 = 0, $tobool140 = 0;
 var $tobool200 = 0, $tobool222 = 0, $tobool244 = 0, $tobool252 = 0, $tobool290 = 0, $tobool294 = 0, $tobool341 = 0, $tobool37 = 0, $tobool371 = 0, $tobool380 = 0, $tobool400 = 0, $tobool42 = 0, $tobool454 = 0, $tobool466 = 0, $tobool484 = 0, $tobool490 = 0, $tobool5 = 0, $tobool56 = 0, $tobool609 = 0, $tobool611 = 0;
 var $tobool63 = 0, $tobool700 = 0, $tobool703 = 0, $tobool76 = 0, $tobool781 = 0, $tobool79 = 0, $tobool9 = 0, $w$addr = 0, $x = 0, $x237 = 0, $x353 = 0, $xor = 0, $xor167 = 0, $xor186 = 0, $xor655 = 0, $xor816 = 0, $y$addr = 0.0, $z = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 720|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(720|0);
 $big = sp + 152|0;
 $e2 = sp + 132|0;
 $buf = sp + 692|0;
 $ebuf0 = sp + 680|0;
 $x237 = sp + 16|0;
 $f$addr = $f;
 $y$addr = $y;
 $w$addr = $w;
 $p$addr = $p;
 $fl$addr = $fl;
 $t$addr = $t;
 HEAP32[$e2>>2] = 0;
 $prefix = 1590;
 $arrayidx = ((($ebuf0)) + 12|0);
 $ebuf = $arrayidx;
 $pl = 1;
 $0 = $y$addr;
 $1 = (___DOUBLE_BITS_680($0)|0);
 $2 = tempRet0;
 $3 = (_bitshift64Lshr(($1|0),($2|0),63)|0);
 $4 = tempRet0;
 $tobool5 = ($3|0)!=(0);
 do {
  if ($tobool5) {
   $5 = $y$addr;
   $sub = -$5;
   $y$addr = $sub;
  } else {
   $6 = $fl$addr;
   $and = $6 & 2048;
   $tobool9 = ($and|0)!=(0);
   if ($tobool9) {
    $7 = $prefix;
    $add$ptr = ((($7)) + 3|0);
    $prefix = $add$ptr;
    break;
   }
   $8 = $fl$addr;
   $and12 = $8 & 1;
   $tobool13 = ($and12|0)!=(0);
   $9 = $prefix;
   if ($tobool13) {
    $add$ptr15 = ((($9)) + 6|0);
    $prefix = $add$ptr15;
    break;
   } else {
    $incdec$ptr = ((($9)) + 1|0);
    $prefix = $incdec$ptr;
    $pl = 0;
    break;
   }
  }
 } while(0);
 $10 = $y$addr;
 $11 = (___DOUBLE_BITS_680($10)|0);
 $12 = tempRet0;
 $13 = $12 & 2147483647;
 $14 = ($13>>>0)<(2146435072);
 $15 = ($11>>>0)<(0);
 $16 = ($13|0)==(2146435072);
 $17 = $16 & $15;
 $18 = $14 | $17;
 if (!($18)) {
  $19 = $t$addr;
  $and36 = $19 & 32;
  $tobool37 = ($and36|0)!=(0);
  $cond = $tobool37 ? 1609 : 1613;
  $s35 = $cond;
  $20 = $y$addr;
  $21 = $y$addr;
  $cmp38 = $20 != $21;
  if ($cmp38) {
   $22 = $t$addr;
   $and41 = $22 & 32;
   $tobool42 = ($and41|0)!=(0);
   $cond43 = $tobool42 ? 1617 : 1621;
   $s35 = $cond43;
  }
  $23 = $f$addr;
  $24 = $w$addr;
  $25 = $pl;
  $add = (3 + ($25))|0;
  $26 = $fl$addr;
  $and45 = $26 & -65537;
  _pad_677($23,32,$24,$add,$and45);
  $27 = $f$addr;
  $28 = $prefix;
  $29 = $pl;
  _out($27,$28,$29);
  $30 = $f$addr;
  $31 = $s35;
  _out($30,$31,3);
  $32 = $f$addr;
  $33 = $w$addr;
  $34 = $pl;
  $add46 = (3 + ($34))|0;
  $35 = $fl$addr;
  $xor = $35 ^ 8192;
  _pad_677($32,32,$33,$add46,$xor);
  $36 = $w$addr;
  $37 = $pl;
  $add47 = (3 + ($37))|0;
  $cmp48 = ($36|0)>($add47|0);
  $38 = $w$addr;
  $39 = $pl;
  $add52 = (3 + ($39))|0;
  $cond53 = $cmp48 ? $38 : $add52;
  $retval = $cond53;
  $480 = $retval;
  STACKTOP = sp;return ($480|0);
 }
 $40 = $y$addr;
 $call55 = (+_frexpl($40,$e2));
 $mul = $call55 * 2.0;
 $y$addr = $mul;
 $41 = $y$addr;
 $tobool56 = $41 != 0.0;
 if ($tobool56) {
  $42 = HEAP32[$e2>>2]|0;
  $dec = (($42) + -1)|0;
  HEAP32[$e2>>2] = $dec;
 }
 $43 = $t$addr;
 $or = $43 | 32;
 $cmp59 = ($or|0)==(97);
 if ($cmp59) {
  $round = 8.0;
  $44 = $t$addr;
  $and62 = $44 & 32;
  $tobool63 = ($and62|0)!=(0);
  if ($tobool63) {
   $45 = $prefix;
   $add$ptr65 = ((($45)) + 9|0);
   $prefix = $add$ptr65;
  }
  $46 = $pl;
  $add67 = (($46) + 2)|0;
  $pl = $add67;
  $47 = $p$addr;
  $cmp68 = ($47|0)<(0);
  $48 = $p$addr;
  $cmp70 = ($48|0)>=(12);
  $or$cond = $cmp68 | $cmp70;
  if ($or$cond) {
   $re = 0;
  } else {
   $49 = $p$addr;
   $sub74 = (12 - ($49))|0;
   $re = $sub74;
  }
  $50 = $re;
  $tobool76 = ($50|0)!=(0);
  do {
   if ($tobool76) {
    while(1) {
     $51 = $re;
     $dec78 = (($51) + -1)|0;
     $re = $dec78;
     $tobool79 = ($51|0)!=(0);
     if (!($tobool79)) {
      break;
     }
     $52 = $round;
     $mul80 = $52 * 16.0;
     $round = $mul80;
    }
    $53 = $prefix;
    $54 = HEAP8[$53>>0]|0;
    $conv81 = $54 << 24 >> 24;
    $cmp82 = ($conv81|0)==(45);
    if ($cmp82) {
     $55 = $y$addr;
     $sub85 = -$55;
     $y$addr = $sub85;
     $56 = $round;
     $57 = $y$addr;
     $sub86 = $57 - $56;
     $y$addr = $sub86;
     $58 = $round;
     $59 = $y$addr;
     $add87 = $59 + $58;
     $y$addr = $add87;
     $60 = $y$addr;
     $sub88 = -$60;
     $y$addr = $sub88;
     break;
    } else {
     $61 = $round;
     $62 = $y$addr;
     $add90 = $62 + $61;
     $y$addr = $add90;
     $63 = $round;
     $64 = $y$addr;
     $sub91 = $64 - $63;
     $y$addr = $sub91;
     break;
    }
   }
  } while(0);
  $65 = HEAP32[$e2>>2]|0;
  $cmp94 = ($65|0)<(0);
  $66 = HEAP32[$e2>>2]|0;
  $sub97 = (0 - ($66))|0;
  $cond100 = $cmp94 ? $sub97 : $66;
  $67 = ($cond100|0)<(0);
  $68 = $67 << 31 >> 31;
  $69 = $ebuf;
  $70 = (_fmt_u($cond100,$68,$69)|0);
  $estr = $70;
  $71 = $estr;
  $72 = $ebuf;
  $cmp103 = ($71|0)==($72|0);
  if ($cmp103) {
   $73 = $estr;
   $incdec$ptr106 = ((($73)) + -1|0);
   $estr = $incdec$ptr106;
   HEAP8[$incdec$ptr106>>0] = 48;
  }
  $74 = HEAP32[$e2>>2]|0;
  $cmp108 = ($74|0)<(0);
  $cond110 = $cmp108 ? 45 : 43;
  $conv111 = $cond110&255;
  $75 = $estr;
  $incdec$ptr112 = ((($75)) + -1|0);
  $estr = $incdec$ptr112;
  HEAP8[$incdec$ptr112>>0] = $conv111;
  $76 = $t$addr;
  $add113 = (($76) + 15)|0;
  $conv114 = $add113&255;
  $77 = $estr;
  $incdec$ptr115 = ((($77)) + -1|0);
  $estr = $incdec$ptr115;
  HEAP8[$incdec$ptr115>>0] = $conv114;
  $s = $buf;
  while(1) {
   $78 = $y$addr;
   $conv116 = (~~(($78)));
   $x = $conv116;
   $79 = $x;
   $arrayidx117 = (1625 + ($79)|0);
   $80 = HEAP8[$arrayidx117>>0]|0;
   $conv118 = $80 << 24 >> 24;
   $81 = $t$addr;
   $and119 = $81 & 32;
   $or120 = $conv118 | $and119;
   $conv121 = $or120&255;
   $82 = $s;
   $incdec$ptr122 = ((($82)) + 1|0);
   $s = $incdec$ptr122;
   HEAP8[$82>>0] = $conv121;
   $83 = $y$addr;
   $84 = $x;
   $conv123 = (+($84|0));
   $sub124 = $83 - $conv123;
   $mul125 = 16.0 * $sub124;
   $y$addr = $mul125;
   $85 = $s;
   $sub$ptr$lhs$cast = $85;
   $sub$ptr$rhs$cast = $buf;
   $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
   $cmp127 = ($sub$ptr$sub|0)==(1);
   do {
    if ($cmp127) {
     $86 = $y$addr;
     $tobool129 = $86 != 0.0;
     $87 = $p$addr;
     $cmp131 = ($87|0)>(0);
     $or$cond1 = $tobool129 | $cmp131;
     if (!($or$cond1)) {
      $88 = $fl$addr;
      $and134 = $88 & 8;
      $tobool135 = ($and134|0)!=(0);
      if (!($tobool135)) {
       break;
      }
     }
     $89 = $s;
     $incdec$ptr137 = ((($89)) + 1|0);
     $s = $incdec$ptr137;
     HEAP8[$89>>0] = 46;
    }
   } while(0);
   $90 = $y$addr;
   $tobool139 = $90 != 0.0;
   if (!($tobool139)) {
    break;
   }
  }
  $91 = $p$addr;
  $tobool140 = ($91|0)!=(0);
  if ($tobool140) {
   $92 = $s;
   $sub$ptr$lhs$cast143 = $92;
   $sub$ptr$rhs$cast144 = $buf;
   $sub$ptr$sub145 = (($sub$ptr$lhs$cast143) - ($sub$ptr$rhs$cast144))|0;
   $sub146 = (($sub$ptr$sub145) - 2)|0;
   $93 = $p$addr;
   $cmp147 = ($sub146|0)<($93|0);
   if ($cmp147) {
    $94 = $p$addr;
    $add150 = (($94) + 2)|0;
    $95 = $ebuf;
    $96 = $estr;
    $sub$ptr$lhs$cast151 = $95;
    $sub$ptr$rhs$cast152 = $96;
    $sub$ptr$sub153 = (($sub$ptr$lhs$cast151) - ($sub$ptr$rhs$cast152))|0;
    $add154 = (($add150) + ($sub$ptr$sub153))|0;
    $l = $add154;
   } else {
    label = 37;
   }
  } else {
   label = 37;
  }
  if ((label|0) == 37) {
   $97 = $s;
   $sub$ptr$lhs$cast157 = $97;
   $sub$ptr$rhs$cast158 = $buf;
   $sub$ptr$sub159 = (($sub$ptr$lhs$cast157) - ($sub$ptr$rhs$cast158))|0;
   $98 = $ebuf;
   $99 = $estr;
   $sub$ptr$lhs$cast160 = $98;
   $sub$ptr$rhs$cast161 = $99;
   $sub$ptr$sub162 = (($sub$ptr$lhs$cast160) - ($sub$ptr$rhs$cast161))|0;
   $add163 = (($sub$ptr$sub159) + ($sub$ptr$sub162))|0;
   $l = $add163;
  }
  $100 = $f$addr;
  $101 = $w$addr;
  $102 = $pl;
  $103 = $l;
  $add165 = (($102) + ($103))|0;
  $104 = $fl$addr;
  _pad_677($100,32,$101,$add165,$104);
  $105 = $f$addr;
  $106 = $prefix;
  $107 = $pl;
  _out($105,$106,$107);
  $108 = $f$addr;
  $109 = $w$addr;
  $110 = $pl;
  $111 = $l;
  $add166 = (($110) + ($111))|0;
  $112 = $fl$addr;
  $xor167 = $112 ^ 65536;
  _pad_677($108,48,$109,$add166,$xor167);
  $113 = $f$addr;
  $114 = $s;
  $sub$ptr$lhs$cast170 = $114;
  $sub$ptr$rhs$cast171 = $buf;
  $sub$ptr$sub172 = (($sub$ptr$lhs$cast170) - ($sub$ptr$rhs$cast171))|0;
  _out($113,$buf,$sub$ptr$sub172);
  $115 = $f$addr;
  $116 = $l;
  $117 = $ebuf;
  $118 = $estr;
  $sub$ptr$lhs$cast173 = $117;
  $sub$ptr$rhs$cast174 = $118;
  $sub$ptr$sub175 = (($sub$ptr$lhs$cast173) - ($sub$ptr$rhs$cast174))|0;
  $sub176 = (($116) - ($sub$ptr$sub175))|0;
  $119 = $s;
  $sub$ptr$lhs$cast178 = $119;
  $sub$ptr$rhs$cast179 = $buf;
  $sub$ptr$sub180 = (($sub$ptr$lhs$cast178) - ($sub$ptr$rhs$cast179))|0;
  $sub181 = (($sub176) - ($sub$ptr$sub180))|0;
  _pad_677($115,48,$sub181,0,0);
  $120 = $f$addr;
  $121 = $estr;
  $122 = $ebuf;
  $123 = $estr;
  $sub$ptr$lhs$cast182 = $122;
  $sub$ptr$rhs$cast183 = $123;
  $sub$ptr$sub184 = (($sub$ptr$lhs$cast182) - ($sub$ptr$rhs$cast183))|0;
  _out($120,$121,$sub$ptr$sub184);
  $124 = $f$addr;
  $125 = $w$addr;
  $126 = $pl;
  $127 = $l;
  $add185 = (($126) + ($127))|0;
  $128 = $fl$addr;
  $xor186 = $128 ^ 8192;
  _pad_677($124,32,$125,$add185,$xor186);
  $129 = $w$addr;
  $130 = $pl;
  $131 = $l;
  $add187 = (($130) + ($131))|0;
  $cmp188 = ($129|0)>($add187|0);
  if ($cmp188) {
   $132 = $w$addr;
   $cond194 = $132;
  } else {
   $133 = $pl;
   $134 = $l;
   $add192 = (($133) + ($134))|0;
   $cond194 = $add192;
  }
  $retval = $cond194;
  $480 = $retval;
  STACKTOP = sp;return ($480|0);
 }
 $135 = $p$addr;
 $cmp196 = ($135|0)<(0);
 if ($cmp196) {
  $p$addr = 6;
 }
 $136 = $y$addr;
 $tobool200 = $136 != 0.0;
 if ($tobool200) {
  $137 = $y$addr;
  $mul202 = $137 * 268435456.0;
  $y$addr = $mul202;
  $138 = HEAP32[$e2>>2]|0;
  $sub203 = (($138) - 28)|0;
  HEAP32[$e2>>2] = $sub203;
 }
 $139 = HEAP32[$e2>>2]|0;
 $cmp205 = ($139|0)<(0);
 if ($cmp205) {
  $z = $big;
  $r = $big;
  $a = $big;
 } else {
  $add$ptr211 = ((($big)) + 504|0);
  $add$ptr212 = ((($add$ptr211)) + -212|0);
  $add$ptr213 = ((($add$ptr212)) + -4|0);
  $z = $add$ptr213;
  $r = $add$ptr213;
  $a = $add$ptr213;
 }
 while(1) {
  $140 = $y$addr;
  $conv216 = (~~(($140))>>>0);
  $141 = $z;
  HEAP32[$141>>2] = $conv216;
  $142 = $y$addr;
  $143 = $z;
  $incdec$ptr217 = ((($143)) + 4|0);
  $z = $incdec$ptr217;
  $144 = HEAP32[$143>>2]|0;
  $conv218 = (+($144>>>0));
  $sub219 = $142 - $conv218;
  $mul220 = 1.0E+9 * $sub219;
  $y$addr = $mul220;
  $145 = $y$addr;
  $tobool222 = $145 != 0.0;
  if (!($tobool222)) {
   break;
  }
 }
 while(1) {
  $146 = HEAP32[$e2>>2]|0;
  $cmp225 = ($146|0)>(0);
  if (!($cmp225)) {
   break;
  }
  $carry = 0;
  $147 = HEAP32[$e2>>2]|0;
  $cmp228 = (29)<($147|0);
  $148 = HEAP32[$e2>>2]|0;
  $cond233 = $cmp228 ? 29 : $148;
  $sh = $cond233;
  $149 = $z;
  $add$ptr234 = ((($149)) + -4|0);
  $d = $add$ptr234;
  while(1) {
   $150 = $d;
   $151 = $a;
   $cmp235 = ($150>>>0)>=($151>>>0);
   if (!($cmp235)) {
    break;
   }
   $152 = $d;
   $153 = HEAP32[$152>>2]|0;
   $154 = $sh;
   $155 = (_bitshift64Shl(($153|0),0,($154|0))|0);
   $156 = tempRet0;
   $157 = $carry;
   $158 = (_i64Add(($155|0),($156|0),($157|0),0)|0);
   $159 = tempRet0;
   $160 = $x237;
   $161 = $160;
   HEAP32[$161>>2] = $158;
   $162 = (($160) + 4)|0;
   $163 = $162;
   HEAP32[$163>>2] = $159;
   $164 = $x237;
   $165 = $164;
   $166 = HEAP32[$165>>2]|0;
   $167 = (($164) + 4)|0;
   $168 = $167;
   $169 = HEAP32[$168>>2]|0;
   $170 = (___uremdi3(($166|0),($169|0),1000000000,0)|0);
   $171 = tempRet0;
   $172 = $d;
   HEAP32[$172>>2] = $170;
   $173 = $x237;
   $174 = $173;
   $175 = HEAP32[$174>>2]|0;
   $176 = (($173) + 4)|0;
   $177 = $176;
   $178 = HEAP32[$177>>2]|0;
   $179 = (___udivdi3(($175|0),($178|0),1000000000,0)|0);
   $180 = tempRet0;
   $carry = $179;
   $181 = $d;
   $incdec$ptr243 = ((($181)) + -4|0);
   $d = $incdec$ptr243;
  }
  $182 = $carry;
  $tobool244 = ($182|0)!=(0);
  if ($tobool244) {
   $183 = $carry;
   $184 = $a;
   $incdec$ptr246 = ((($184)) + -4|0);
   $a = $incdec$ptr246;
   HEAP32[$incdec$ptr246>>2] = $183;
  }
  while(1) {
   $185 = $z;
   $186 = $a;
   $cmp249 = ($185>>>0)>($186>>>0);
   if (!($cmp249)) {
    break;
   }
   $187 = $z;
   $arrayidx251 = ((($187)) + -4|0);
   $188 = HEAP32[$arrayidx251>>2]|0;
   $tobool252 = ($188|0)!=(0);
   $lnot = $tobool252 ^ 1;
   if (!($lnot)) {
    break;
   }
   $189 = $z;
   $incdec$ptr254 = ((($189)) + -4|0);
   $z = $incdec$ptr254;
  }
  $190 = $sh;
  $191 = HEAP32[$e2>>2]|0;
  $sub256 = (($191) - ($190))|0;
  HEAP32[$e2>>2] = $sub256;
 }
 while(1) {
  $192 = HEAP32[$e2>>2]|0;
  $cmp259 = ($192|0)<(0);
  if (!($cmp259)) {
   break;
  }
  $carry262 = 0;
  $193 = HEAP32[$e2>>2]|0;
  $sub264 = (0 - ($193))|0;
  $cmp265 = (9)<($sub264|0);
  $194 = HEAP32[$e2>>2]|0;
  $sub269 = (0 - ($194))|0;
  $cond271 = $cmp265 ? 9 : $sub269;
  $sh263 = $cond271;
  $195 = $p$addr;
  $add272 = (($195) + 17)|0;
  $add273 = (($add272) + 8)|0;
  $div274 = (($add273|0) / 9)&-1;
  $add275 = (1 + ($div274))|0;
  $need = $add275;
  $196 = $a;
  $d = $196;
  while(1) {
   $197 = $d;
   $198 = $z;
   $cmp277 = ($197>>>0)<($198>>>0);
   if (!($cmp277)) {
    break;
   }
   $199 = $d;
   $200 = HEAP32[$199>>2]|0;
   $201 = $sh263;
   $shl280 = 1 << $201;
   $sub281 = (($shl280) - 1)|0;
   $and282 = $200 & $sub281;
   $rm = $and282;
   $202 = $d;
   $203 = HEAP32[$202>>2]|0;
   $204 = $sh263;
   $shr283 = $203 >>> $204;
   $205 = $carry262;
   $add284 = (($shr283) + ($205))|0;
   $206 = $d;
   HEAP32[$206>>2] = $add284;
   $207 = $sh263;
   $shr285 = 1000000000 >> $207;
   $208 = $rm;
   $mul286 = Math_imul($shr285, $208)|0;
   $carry262 = $mul286;
   $209 = $d;
   $incdec$ptr288 = ((($209)) + 4|0);
   $d = $incdec$ptr288;
  }
  $210 = $a;
  $211 = HEAP32[$210>>2]|0;
  $tobool290 = ($211|0)!=(0);
  if (!($tobool290)) {
   $212 = $a;
   $incdec$ptr292 = ((($212)) + 4|0);
   $a = $incdec$ptr292;
  }
  $213 = $carry262;
  $tobool294 = ($213|0)!=(0);
  if ($tobool294) {
   $214 = $carry262;
   $215 = $z;
   $incdec$ptr296 = ((($215)) + 4|0);
   $z = $incdec$ptr296;
   HEAP32[$215>>2] = $214;
  }
  $216 = $t$addr;
  $or298 = $216 | 32;
  $cmp299 = ($or298|0)==(102);
  $217 = $r;
  $218 = $a;
  $cond304 = $cmp299 ? $217 : $218;
  $b = $cond304;
  $219 = $z;
  $220 = $b;
  $sub$ptr$lhs$cast305 = $219;
  $sub$ptr$rhs$cast306 = $220;
  $sub$ptr$sub307 = (($sub$ptr$lhs$cast305) - ($sub$ptr$rhs$cast306))|0;
  $sub$ptr$div = (($sub$ptr$sub307|0) / 4)&-1;
  $221 = $need;
  $cmp308 = ($sub$ptr$div|0)>($221|0);
  if ($cmp308) {
   $222 = $b;
   $223 = $need;
   $add$ptr311 = (($222) + ($223<<2)|0);
   $z = $add$ptr311;
  }
  $224 = $sh263;
  $225 = HEAP32[$e2>>2]|0;
  $add313 = (($225) + ($224))|0;
  HEAP32[$e2>>2] = $add313;
 }
 $226 = $a;
 $227 = $z;
 $cmp315 = ($226>>>0)<($227>>>0);
 L105: do {
  if ($cmp315) {
   $i = 10;
   $228 = $r;
   $229 = $a;
   $sub$ptr$lhs$cast318 = $228;
   $sub$ptr$rhs$cast319 = $229;
   $sub$ptr$sub320 = (($sub$ptr$lhs$cast318) - ($sub$ptr$rhs$cast319))|0;
   $sub$ptr$div321 = (($sub$ptr$sub320|0) / 4)&-1;
   $mul322 = ($sub$ptr$div321*9)|0;
   $e = $mul322;
   while(1) {
    $230 = $a;
    $231 = HEAP32[$230>>2]|0;
    $232 = $i;
    $cmp324 = ($231>>>0)>=($232>>>0);
    if (!($cmp324)) {
     break L105;
    }
    $233 = $i;
    $mul328 = ($233*10)|0;
    $i = $mul328;
    $234 = $e;
    $inc = (($234) + 1)|0;
    $e = $inc;
   }
  } else {
   $e = 0;
  }
 } while(0);
 $235 = $p$addr;
 $236 = $t$addr;
 $or332 = $236 | 32;
 $cmp333 = ($or332|0)!=(102);
 $conv334 = $cmp333&1;
 $237 = $e;
 $mul335 = Math_imul($conv334, $237)|0;
 $sub336 = (($235) - ($mul335))|0;
 $238 = $t$addr;
 $or337 = $238 | 32;
 $cmp338 = ($or337|0)==(103);
 $239 = $p$addr;
 $tobool341 = ($239|0)!=(0);
 $240 = $cmp338 ? $tobool341 : 0;
 $land$ext = $240&1;
 $sub343 = (($sub336) - ($land$ext))|0;
 $j = $sub343;
 $241 = $j;
 $242 = $z;
 $243 = $r;
 $sub$ptr$lhs$cast344 = $242;
 $sub$ptr$rhs$cast345 = $243;
 $sub$ptr$sub346 = (($sub$ptr$lhs$cast344) - ($sub$ptr$rhs$cast345))|0;
 $sub$ptr$div347 = (($sub$ptr$sub346|0) / 4)&-1;
 $sub348 = (($sub$ptr$div347) - 1)|0;
 $mul349 = ($sub348*9)|0;
 $cmp350 = ($241|0)<($mul349|0);
 if ($cmp350) {
  $244 = $r;
  $add$ptr354 = ((($244)) + 4|0);
  $245 = $j;
  $add355 = (($245) + 9216)|0;
  $div356 = (($add355|0) / 9)&-1;
  $sub357 = (($div356) - 1024)|0;
  $add$ptr358 = (($add$ptr354) + ($sub357<<2)|0);
  $d = $add$ptr358;
  $246 = $j;
  $add359 = (($246) + 9216)|0;
  $j = $add359;
  $247 = $j;
  $rem360 = (($247|0) % 9)&-1;
  $j = $rem360;
  $i = 10;
  $248 = $j;
  $inc361 = (($248) + 1)|0;
  $j = $inc361;
  while(1) {
   $249 = $j;
   $cmp363 = ($249|0)<(9);
   if (!($cmp363)) {
    break;
   }
   $250 = $i;
   $mul367 = ($250*10)|0;
   $i = $mul367;
   $251 = $j;
   $inc368 = (($251) + 1)|0;
   $j = $inc368;
  }
  $252 = $d;
  $253 = HEAP32[$252>>2]|0;
  $254 = $i;
  $rem370 = (($253>>>0) % ($254>>>0))&-1;
  $x353 = $rem370;
  $255 = $x353;
  $tobool371 = ($255|0)!=(0);
  if ($tobool371) {
   label = 82;
  } else {
   $256 = $d;
   $add$ptr373 = ((($256)) + 4|0);
   $257 = $z;
   $cmp374 = ($add$ptr373|0)!=($257|0);
   if ($cmp374) {
    label = 82;
   }
  }
  L120: do {
   if ((label|0) == 82) {
    $round377 = 9007199254740992.0;
    $258 = $d;
    $259 = HEAP32[$258>>2]|0;
    $260 = $i;
    $div378 = (($259>>>0) / ($260>>>0))&-1;
    $and379 = $div378 & 1;
    $tobool380 = ($and379|0)!=(0);
    if ($tobool380) {
     $261 = $round377;
     $add382 = $261 + 2.0;
     $round377 = $add382;
    }
    $262 = $x353;
    $263 = $i;
    $div384 = (($263|0) / 2)&-1;
    $cmp385 = ($262>>>0)<($div384>>>0);
    do {
     if ($cmp385) {
      $small = 0.5;
     } else {
      $264 = $x353;
      $265 = $i;
      $div389 = (($265|0) / 2)&-1;
      $cmp390 = ($264|0)==($div389|0);
      if ($cmp390) {
       $266 = $d;
       $add$ptr393 = ((($266)) + 4|0);
       $267 = $z;
       $cmp394 = ($add$ptr393|0)==($267|0);
       if ($cmp394) {
        $small = 1.0;
        break;
       }
      }
      $small = 1.5;
     }
    } while(0);
    $268 = $pl;
    $tobool400 = ($268|0)!=(0);
    if ($tobool400) {
     $269 = $prefix;
     $270 = HEAP8[$269>>0]|0;
     $conv402 = $270 << 24 >> 24;
     $cmp403 = ($conv402|0)==(45);
     if ($cmp403) {
      $271 = $round377;
      $mul406 = $271 * -1.0;
      $round377 = $mul406;
      $272 = $small;
      $mul407 = $272 * -1.0;
      $small = $mul407;
     }
    }
    $273 = $x353;
    $274 = $d;
    $275 = HEAP32[$274>>2]|0;
    $sub409 = (($275) - ($273))|0;
    HEAP32[$274>>2] = $sub409;
    $276 = $round377;
    $277 = $small;
    $add410 = $276 + $277;
    $278 = $round377;
    $cmp411 = $add410 != $278;
    if ($cmp411) {
     $279 = $d;
     $280 = HEAP32[$279>>2]|0;
     $281 = $i;
     $add414 = (($280) + ($281))|0;
     $282 = $d;
     HEAP32[$282>>2] = $add414;
     while(1) {
      $283 = $d;
      $284 = HEAP32[$283>>2]|0;
      $cmp416 = ($284>>>0)>(999999999);
      if (!($cmp416)) {
       break;
      }
      $285 = $d;
      $incdec$ptr419 = ((($285)) + -4|0);
      $d = $incdec$ptr419;
      HEAP32[$285>>2] = 0;
      $286 = $d;
      $287 = $a;
      $cmp420 = ($286>>>0)<($287>>>0);
      if ($cmp420) {
       $288 = $a;
       $incdec$ptr423 = ((($288)) + -4|0);
       $a = $incdec$ptr423;
       HEAP32[$incdec$ptr423>>2] = 0;
      }
      $289 = $d;
      $290 = HEAP32[$289>>2]|0;
      $inc425 = (($290) + 1)|0;
      HEAP32[$289>>2] = $inc425;
     }
     $i = 10;
     $291 = $r;
     $292 = $a;
     $sub$ptr$lhs$cast427 = $291;
     $sub$ptr$rhs$cast428 = $292;
     $sub$ptr$sub429 = (($sub$ptr$lhs$cast427) - ($sub$ptr$rhs$cast428))|0;
     $sub$ptr$div430 = (($sub$ptr$sub429|0) / 4)&-1;
     $mul431 = ($sub$ptr$div430*9)|0;
     $e = $mul431;
     while(1) {
      $293 = $a;
      $294 = HEAP32[$293>>2]|0;
      $295 = $i;
      $cmp433 = ($294>>>0)>=($295>>>0);
      if (!($cmp433)) {
       break L120;
      }
      $296 = $i;
      $mul437 = ($296*10)|0;
      $i = $mul437;
      $297 = $e;
      $inc438 = (($297) + 1)|0;
      $e = $inc438;
     }
    }
   }
  } while(0);
  $298 = $z;
  $299 = $d;
  $add$ptr442 = ((($299)) + 4|0);
  $cmp443 = ($298>>>0)>($add$ptr442>>>0);
  if ($cmp443) {
   $300 = $d;
   $add$ptr446 = ((($300)) + 4|0);
   $z = $add$ptr446;
  }
 }
 while(1) {
  $301 = $z;
  $302 = $a;
  $cmp450 = ($301>>>0)>($302>>>0);
  if (!($cmp450)) {
   break;
  }
  $303 = $z;
  $arrayidx453 = ((($303)) + -4|0);
  $304 = HEAP32[$arrayidx453>>2]|0;
  $tobool454 = ($304|0)!=(0);
  $lnot455 = $tobool454 ^ 1;
  if (!($lnot455)) {
   break;
  }
  $305 = $z;
  $incdec$ptr460 = ((($305)) + -4|0);
  $z = $incdec$ptr460;
 }
 $306 = $t$addr;
 $or462 = $306 | 32;
 $cmp463 = ($or462|0)==(103);
 do {
  if ($cmp463) {
   $307 = $p$addr;
   $tobool466 = ($307|0)!=(0);
   if (!($tobool466)) {
    $308 = $p$addr;
    $inc468 = (($308) + 1)|0;
    $p$addr = $inc468;
   }
   $309 = $p$addr;
   $310 = $e;
   $cmp470 = ($309|0)>($310|0);
   $311 = $e;
   $cmp473 = ($311|0)>=(-4);
   $or$cond2 = $cmp470 & $cmp473;
   $312 = $t$addr;
   if ($or$cond2) {
    $dec476 = (($312) + -1)|0;
    $t$addr = $dec476;
    $313 = $e;
    $add477 = (($313) + 1)|0;
    $314 = $p$addr;
    $sub478 = (($314) - ($add477))|0;
    $p$addr = $sub478;
   } else {
    $sub480 = (($312) - 2)|0;
    $t$addr = $sub480;
    $315 = $p$addr;
    $dec481 = (($315) + -1)|0;
    $p$addr = $dec481;
   }
   $316 = $fl$addr;
   $and483 = $316 & 8;
   $tobool484 = ($and483|0)!=(0);
   if (!($tobool484)) {
    $317 = $z;
    $318 = $a;
    $cmp486 = ($317>>>0)>($318>>>0);
    L165: do {
     if ($cmp486) {
      $319 = $z;
      $arrayidx489 = ((($319)) + -4|0);
      $320 = HEAP32[$arrayidx489>>2]|0;
      $tobool490 = ($320|0)!=(0);
      if ($tobool490) {
       $i = 10;
       $j = 0;
       while(1) {
        $321 = $z;
        $arrayidx493 = ((($321)) + -4|0);
        $322 = HEAP32[$arrayidx493>>2]|0;
        $323 = $i;
        $rem494 = (($322>>>0) % ($323>>>0))&-1;
        $cmp495 = ($rem494|0)==(0);
        if (!($cmp495)) {
         break L165;
        }
        $324 = $i;
        $mul499 = ($324*10)|0;
        $i = $mul499;
        $325 = $j;
        $inc500 = (($325) + 1)|0;
        $j = $inc500;
       }
      } else {
       label = 119;
      }
     } else {
      label = 119;
     }
    } while(0);
    if ((label|0) == 119) {
     $j = 9;
    }
    $326 = $t$addr;
    $or504 = $326 | 32;
    $cmp505 = ($or504|0)==(102);
    $327 = $p$addr;
    $328 = $z;
    $329 = $r;
    $sub$ptr$lhs$cast508 = $328;
    $sub$ptr$rhs$cast509 = $329;
    $sub$ptr$sub510 = (($sub$ptr$lhs$cast508) - ($sub$ptr$rhs$cast509))|0;
    $sub$ptr$div511 = (($sub$ptr$sub510|0) / 4)&-1;
    $sub512 = (($sub$ptr$div511) - 1)|0;
    $mul513 = ($sub512*9)|0;
    if ($cmp505) {
     $330 = $j;
     $sub514 = (($mul513) - ($330))|0;
     $cmp515 = (0)>($sub514|0);
     if ($cmp515) {
      $cond527 = 0;
     } else {
      $331 = $z;
      $332 = $r;
      $sub$ptr$lhs$cast519 = $331;
      $sub$ptr$rhs$cast520 = $332;
      $sub$ptr$sub521 = (($sub$ptr$lhs$cast519) - ($sub$ptr$rhs$cast520))|0;
      $sub$ptr$div522 = (($sub$ptr$sub521|0) / 4)&-1;
      $sub523 = (($sub$ptr$div522) - 1)|0;
      $mul524 = ($sub523*9)|0;
      $333 = $j;
      $sub525 = (($mul524) - ($333))|0;
      $cond527 = $sub525;
     }
     $cmp528 = ($327|0)<($cond527|0);
     do {
      if ($cmp528) {
       $334 = $p$addr;
       $cond553 = $334;
      } else {
       $335 = $z;
       $336 = $r;
       $sub$ptr$lhs$cast532 = $335;
       $sub$ptr$rhs$cast533 = $336;
       $sub$ptr$sub534 = (($sub$ptr$lhs$cast532) - ($sub$ptr$rhs$cast533))|0;
       $sub$ptr$div535 = (($sub$ptr$sub534|0) / 4)&-1;
       $sub536 = (($sub$ptr$div535) - 1)|0;
       $mul537 = ($sub536*9)|0;
       $337 = $j;
       $sub538 = (($mul537) - ($337))|0;
       $cmp539 = (0)>($sub538|0);
       if ($cmp539) {
        $cond553 = 0;
        break;
       }
       $338 = $z;
       $339 = $r;
       $sub$ptr$lhs$cast543 = $338;
       $sub$ptr$rhs$cast544 = $339;
       $sub$ptr$sub545 = (($sub$ptr$lhs$cast543) - ($sub$ptr$rhs$cast544))|0;
       $sub$ptr$div546 = (($sub$ptr$sub545|0) / 4)&-1;
       $sub547 = (($sub$ptr$div546) - 1)|0;
       $mul548 = ($sub547*9)|0;
       $340 = $j;
       $sub549 = (($mul548) - ($340))|0;
       $cond553 = $sub549;
      }
     } while(0);
     $p$addr = $cond553;
     break;
    } else {
     $341 = $e;
     $add561 = (($mul513) + ($341))|0;
     $342 = $j;
     $sub562 = (($add561) - ($342))|0;
     $cmp563 = (0)>($sub562|0);
     if ($cmp563) {
      $cond576 = 0;
     } else {
      $343 = $z;
      $344 = $r;
      $sub$ptr$lhs$cast567 = $343;
      $sub$ptr$rhs$cast568 = $344;
      $sub$ptr$sub569 = (($sub$ptr$lhs$cast567) - ($sub$ptr$rhs$cast568))|0;
      $sub$ptr$div570 = (($sub$ptr$sub569|0) / 4)&-1;
      $sub571 = (($sub$ptr$div570) - 1)|0;
      $mul572 = ($sub571*9)|0;
      $345 = $e;
      $add573 = (($mul572) + ($345))|0;
      $346 = $j;
      $sub574 = (($add573) - ($346))|0;
      $cond576 = $sub574;
     }
     $cmp577 = ($327|0)<($cond576|0);
     do {
      if ($cmp577) {
       $347 = $p$addr;
       $cond604 = $347;
      } else {
       $348 = $z;
       $349 = $r;
       $sub$ptr$lhs$cast581 = $348;
       $sub$ptr$rhs$cast582 = $349;
       $sub$ptr$sub583 = (($sub$ptr$lhs$cast581) - ($sub$ptr$rhs$cast582))|0;
       $sub$ptr$div584 = (($sub$ptr$sub583|0) / 4)&-1;
       $sub585 = (($sub$ptr$div584) - 1)|0;
       $mul586 = ($sub585*9)|0;
       $350 = $e;
       $add587 = (($mul586) + ($350))|0;
       $351 = $j;
       $sub588 = (($add587) - ($351))|0;
       $cmp589 = (0)>($sub588|0);
       if ($cmp589) {
        $cond604 = 0;
        break;
       }
       $352 = $z;
       $353 = $r;
       $sub$ptr$lhs$cast593 = $352;
       $sub$ptr$rhs$cast594 = $353;
       $sub$ptr$sub595 = (($sub$ptr$lhs$cast593) - ($sub$ptr$rhs$cast594))|0;
       $sub$ptr$div596 = (($sub$ptr$sub595|0) / 4)&-1;
       $sub597 = (($sub$ptr$div596) - 1)|0;
       $mul598 = ($sub597*9)|0;
       $354 = $e;
       $add599 = (($mul598) + ($354))|0;
       $355 = $j;
       $sub600 = (($add599) - ($355))|0;
       $cond604 = $sub600;
      }
     } while(0);
     $p$addr = $cond604;
     break;
    }
   }
  }
 } while(0);
 $356 = $p$addr;
 $add608 = (1 + ($356))|0;
 $357 = $p$addr;
 $tobool609 = ($357|0)!=(0);
 if ($tobool609) {
  $359 = 1;
 } else {
  $358 = $fl$addr;
  $and610 = $358 & 8;
  $tobool611 = ($and610|0)!=(0);
  $359 = $tobool611;
 }
 $lor$ext = $359&1;
 $add612 = (($add608) + ($lor$ext))|0;
 $l = $add612;
 $360 = $t$addr;
 $or613 = $360 | 32;
 $cmp614 = ($or613|0)==(102);
 $361 = $e;
 if ($cmp614) {
  $cmp617 = ($361|0)>(0);
  if ($cmp617) {
   $362 = $e;
   $363 = $l;
   $add620 = (($363) + ($362))|0;
   $l = $add620;
  }
 } else {
  $cmp623 = ($361|0)<(0);
  $364 = $e;
  $sub626 = (0 - ($364))|0;
  $cond629 = $cmp623 ? $sub626 : $364;
  $365 = ($cond629|0)<(0);
  $366 = $365 << 31 >> 31;
  $367 = $ebuf;
  $368 = (_fmt_u($cond629,$366,$367)|0);
  $estr = $368;
  while(1) {
   $369 = $ebuf;
   $370 = $estr;
   $sub$ptr$lhs$cast633 = $369;
   $sub$ptr$rhs$cast634 = $370;
   $sub$ptr$sub635 = (($sub$ptr$lhs$cast633) - ($sub$ptr$rhs$cast634))|0;
   $cmp636 = ($sub$ptr$sub635|0)<(2);
   if (!($cmp636)) {
    break;
   }
   $371 = $estr;
   $incdec$ptr639 = ((($371)) + -1|0);
   $estr = $incdec$ptr639;
   HEAP8[$incdec$ptr639>>0] = 48;
  }
  $372 = $e;
  $cmp641 = ($372|0)<(0);
  $cond643 = $cmp641 ? 45 : 43;
  $conv644 = $cond643&255;
  $373 = $estr;
  $incdec$ptr645 = ((($373)) + -1|0);
  $estr = $incdec$ptr645;
  HEAP8[$incdec$ptr645>>0] = $conv644;
  $374 = $t$addr;
  $conv646 = $374&255;
  $375 = $estr;
  $incdec$ptr647 = ((($375)) + -1|0);
  $estr = $incdec$ptr647;
  HEAP8[$incdec$ptr647>>0] = $conv646;
  $376 = $ebuf;
  $377 = $estr;
  $sub$ptr$lhs$cast648 = $376;
  $sub$ptr$rhs$cast649 = $377;
  $sub$ptr$sub650 = (($sub$ptr$lhs$cast648) - ($sub$ptr$rhs$cast649))|0;
  $378 = $l;
  $add651 = (($378) + ($sub$ptr$sub650))|0;
  $l = $add651;
 }
 $379 = $f$addr;
 $380 = $w$addr;
 $381 = $pl;
 $382 = $l;
 $add653 = (($381) + ($382))|0;
 $383 = $fl$addr;
 _pad_677($379,32,$380,$add653,$383);
 $384 = $f$addr;
 $385 = $prefix;
 $386 = $pl;
 _out($384,$385,$386);
 $387 = $f$addr;
 $388 = $w$addr;
 $389 = $pl;
 $390 = $l;
 $add654 = (($389) + ($390))|0;
 $391 = $fl$addr;
 $xor655 = $391 ^ 65536;
 _pad_677($387,48,$388,$add654,$xor655);
 $392 = $t$addr;
 $or656 = $392 | 32;
 $cmp657 = ($or656|0)==(102);
 if ($cmp657) {
  $393 = $a;
  $394 = $r;
  $cmp660 = ($393>>>0)>($394>>>0);
  if ($cmp660) {
   $395 = $r;
   $a = $395;
  }
  $396 = $a;
  $d = $396;
  while(1) {
   $397 = $d;
   $398 = $r;
   $cmp665 = ($397>>>0)<=($398>>>0);
   if (!($cmp665)) {
    break;
   }
   $399 = $d;
   $400 = HEAP32[$399>>2]|0;
   $add$ptr671 = ((($buf)) + 9|0);
   $401 = (_fmt_u($400,0,$add$ptr671)|0);
   $s668 = $401;
   $402 = $d;
   $403 = $a;
   $cmp673 = ($402|0)!=($403|0);
   L214: do {
    if ($cmp673) {
     while(1) {
      $404 = $s668;
      $cmp678 = ($404>>>0)>($buf>>>0);
      if (!($cmp678)) {
       break L214;
      }
      $405 = $s668;
      $incdec$ptr681 = ((($405)) + -1|0);
      $s668 = $incdec$ptr681;
      HEAP8[$incdec$ptr681>>0] = 48;
     }
    } else {
     $406 = $s668;
     $add$ptr685 = ((($buf)) + 9|0);
     $cmp686 = ($406|0)==($add$ptr685|0);
     if ($cmp686) {
      $407 = $s668;
      $incdec$ptr689 = ((($407)) + -1|0);
      $s668 = $incdec$ptr689;
      HEAP8[$incdec$ptr689>>0] = 48;
     }
    }
   } while(0);
   $408 = $f$addr;
   $409 = $s668;
   $add$ptr693 = ((($buf)) + 9|0);
   $410 = $s668;
   $sub$ptr$lhs$cast694 = $add$ptr693;
   $sub$ptr$rhs$cast695 = $410;
   $sub$ptr$sub696 = (($sub$ptr$lhs$cast694) - ($sub$ptr$rhs$cast695))|0;
   _out($408,$409,$sub$ptr$sub696);
   $411 = $d;
   $incdec$ptr698 = ((($411)) + 4|0);
   $d = $incdec$ptr698;
  }
  $412 = $p$addr;
  $tobool700 = ($412|0)!=(0);
  if ($tobool700) {
   label = 157;
  } else {
   $413 = $fl$addr;
   $and702 = $413 & 8;
   $tobool703 = ($and702|0)!=(0);
   if ($tobool703) {
    label = 157;
   }
  }
  if ((label|0) == 157) {
   $414 = $f$addr;
   _out($414,1641,1);
  }
  while(1) {
   $415 = $d;
   $416 = $z;
   $cmp707 = ($415>>>0)<($416>>>0);
   $417 = $p$addr;
   $cmp710 = ($417|0)>(0);
   $418 = $cmp707 ? $cmp710 : 0;
   if (!($418)) {
    break;
   }
   $419 = $d;
   $420 = HEAP32[$419>>2]|0;
   $add$ptr718 = ((($buf)) + 9|0);
   $421 = (_fmt_u($420,0,$add$ptr718)|0);
   $s715 = $421;
   while(1) {
    $422 = $s715;
    $cmp722 = ($422>>>0)>($buf>>>0);
    if (!($cmp722)) {
     break;
    }
    $423 = $s715;
    $incdec$ptr725 = ((($423)) + -1|0);
    $s715 = $incdec$ptr725;
    HEAP8[$incdec$ptr725>>0] = 48;
   }
   $424 = $f$addr;
   $425 = $s715;
   $426 = $p$addr;
   $cmp727 = (9)<($426|0);
   $427 = $p$addr;
   $cond732 = $cmp727 ? 9 : $427;
   _out($424,$425,$cond732);
   $428 = $d;
   $incdec$ptr734 = ((($428)) + 4|0);
   $d = $incdec$ptr734;
   $429 = $p$addr;
   $sub735 = (($429) - 9)|0;
   $p$addr = $sub735;
  }
  $430 = $f$addr;
  $431 = $p$addr;
  $add737 = (($431) + 9)|0;
  _pad_677($430,48,$add737,9,0);
 } else {
  $432 = $z;
  $433 = $a;
  $cmp739 = ($432>>>0)<=($433>>>0);
  if ($cmp739) {
   $434 = $a;
   $add$ptr742 = ((($434)) + 4|0);
   $z = $add$ptr742;
  }
  $435 = $a;
  $d = $435;
  while(1) {
   $436 = $d;
   $437 = $z;
   $cmp745 = ($436>>>0)<($437>>>0);
   $438 = $p$addr;
   $cmp748 = ($438|0)>=(0);
   $439 = $cmp745 ? $cmp748 : 0;
   if (!($439)) {
    break;
   }
   $440 = $d;
   $441 = HEAP32[$440>>2]|0;
   $add$ptr756 = ((($buf)) + 9|0);
   $442 = (_fmt_u($441,0,$add$ptr756)|0);
   $s753 = $442;
   $443 = $s753;
   $add$ptr759 = ((($buf)) + 9|0);
   $cmp760 = ($443|0)==($add$ptr759|0);
   if ($cmp760) {
    $444 = $s753;
    $incdec$ptr763 = ((($444)) + -1|0);
    $s753 = $incdec$ptr763;
    HEAP8[$incdec$ptr763>>0] = 48;
   }
   $445 = $d;
   $446 = $a;
   $cmp765 = ($445|0)!=($446|0);
   L244: do {
    if ($cmp765) {
     while(1) {
      $447 = $s753;
      $cmp770 = ($447>>>0)>($buf>>>0);
      if (!($cmp770)) {
       break L244;
      }
      $448 = $s753;
      $incdec$ptr773 = ((($448)) + -1|0);
      $s753 = $incdec$ptr773;
      HEAP8[$incdec$ptr773>>0] = 48;
     }
    } else {
     $449 = $f$addr;
     $450 = $s753;
     $incdec$ptr776 = ((($450)) + 1|0);
     $s753 = $incdec$ptr776;
     _out($449,$450,1);
     $451 = $p$addr;
     $cmp777 = ($451|0)>(0);
     if (!($cmp777)) {
      $452 = $fl$addr;
      $and780 = $452 & 8;
      $tobool781 = ($and780|0)!=(0);
      if (!($tobool781)) {
       break;
      }
     }
     $453 = $f$addr;
     _out($453,1641,1);
    }
   } while(0);
   $454 = $f$addr;
   $455 = $s753;
   $add$ptr786 = ((($buf)) + 9|0);
   $456 = $s753;
   $sub$ptr$lhs$cast787 = $add$ptr786;
   $sub$ptr$rhs$cast788 = $456;
   $sub$ptr$sub789 = (($sub$ptr$lhs$cast787) - ($sub$ptr$rhs$cast788))|0;
   $457 = $p$addr;
   $cmp790 = ($sub$ptr$sub789|0)<($457|0);
   if ($cmp790) {
    $add$ptr794 = ((($buf)) + 9|0);
    $458 = $s753;
    $sub$ptr$lhs$cast795 = $add$ptr794;
    $sub$ptr$rhs$cast796 = $458;
    $sub$ptr$sub797 = (($sub$ptr$lhs$cast795) - ($sub$ptr$rhs$cast796))|0;
    $cond800 = $sub$ptr$sub797;
   } else {
    $459 = $p$addr;
    $cond800 = $459;
   }
   _out($454,$455,$cond800);
   $add$ptr802 = ((($buf)) + 9|0);
   $460 = $s753;
   $sub$ptr$lhs$cast803 = $add$ptr802;
   $sub$ptr$rhs$cast804 = $460;
   $sub$ptr$sub805 = (($sub$ptr$lhs$cast803) - ($sub$ptr$rhs$cast804))|0;
   $461 = $p$addr;
   $sub806 = (($461) - ($sub$ptr$sub805))|0;
   $p$addr = $sub806;
   $462 = $d;
   $incdec$ptr808 = ((($462)) + 4|0);
   $d = $incdec$ptr808;
  }
  $463 = $f$addr;
  $464 = $p$addr;
  $add810 = (($464) + 18)|0;
  _pad_677($463,48,$add810,18,0);
  $465 = $f$addr;
  $466 = $estr;
  $467 = $ebuf;
  $468 = $estr;
  $sub$ptr$lhs$cast811 = $467;
  $sub$ptr$rhs$cast812 = $468;
  $sub$ptr$sub813 = (($sub$ptr$lhs$cast811) - ($sub$ptr$rhs$cast812))|0;
  _out($465,$466,$sub$ptr$sub813);
 }
 $469 = $f$addr;
 $470 = $w$addr;
 $471 = $pl;
 $472 = $l;
 $add815 = (($471) + ($472))|0;
 $473 = $fl$addr;
 $xor816 = $473 ^ 8192;
 _pad_677($469,32,$470,$add815,$xor816);
 $474 = $w$addr;
 $475 = $pl;
 $476 = $l;
 $add817 = (($475) + ($476))|0;
 $cmp818 = ($474|0)>($add817|0);
 if ($cmp818) {
  $477 = $w$addr;
  $cond824 = $477;
 } else {
  $478 = $pl;
  $479 = $l;
  $add822 = (($478) + ($479))|0;
  $cond824 = $add822;
 }
 $retval = $cond824;
 $480 = $retval;
 STACKTOP = sp;return ($480|0);
}
function ___FLOAT_BITS_679($__f) {
 $__f = +$__f;
 var $0 = 0.0, $1 = 0, $__f$addr = 0.0, $__u = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $__u = sp;
 $__f$addr = $__f;
 $0 = $__f$addr;
 HEAPF32[$__u>>2] = $0;
 $1 = HEAP32[$__u>>2]|0;
 STACKTOP = sp;return ($1|0);
}
function ___DOUBLE_BITS_680($__f) {
 $__f = +$__f;
 var $0 = 0.0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $__f$addr = 0.0, $__u = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $__u = sp;
 $__f$addr = $__f;
 $0 = $__f$addr;
 HEAPF64[$__u>>3] = $0;
 $1 = $__u;
 $2 = $1;
 $3 = HEAP32[$2>>2]|0;
 $4 = (($1) + 4)|0;
 $5 = $4;
 $6 = HEAP32[$5>>2]|0;
 tempRet0 = ($6);
 STACKTOP = sp;return ($3|0);
}
function ___signbitl($x) {
 $x = +$x;
 var $0 = 0.0, $call = 0, $x$addr = 0.0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = $x;
 $0 = $x$addr;
 $call = (___signbit($0)|0);
 STACKTOP = sp;return ($call|0);
}
function ___fpclassifyl($x) {
 $x = +$x;
 var $0 = 0.0, $call = 0, $x$addr = 0.0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = $x;
 $0 = $x$addr;
 $call = (___fpclassify($0)|0);
 STACKTOP = sp;return ($call|0);
}
function _frexpl($x,$e) {
 $x = +$x;
 $e = $e|0;
 var $0 = 0.0, $1 = 0, $call = 0.0, $e$addr = 0, $x$addr = 0.0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = $x;
 $e$addr = $e;
 $0 = $x$addr;
 $1 = $e$addr;
 $call = (+_frexp($0,$1));
 STACKTOP = sp;return (+$call);
}
function _frexp($x,$e) {
 $x = +$x;
 $e = $e|0;
 var $0 = 0.0, $1 = 0, $10 = 0, $11 = 0.0, $12 = 0.0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0.0, $18 = 0, $19 = 0.0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0.0;
 var $45 = 0.0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $call = 0.0, $cmp = 0, $e$addr = 0, $ee = 0, $mul = 0.0, $retval = 0.0, $sub = 0, $sub8 = 0, $tobool = 0, $tobool1 = 0, $x$addr = 0.0, $y = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $y = sp;
 $x$addr = $x;
 $e$addr = $e;
 $0 = $x$addr;
 HEAPF64[$y>>3] = $0;
 $1 = $y;
 $2 = $1;
 $3 = HEAP32[$2>>2]|0;
 $4 = (($1) + 4)|0;
 $5 = $4;
 $6 = HEAP32[$5>>2]|0;
 $7 = (_bitshift64Lshr(($3|0),($6|0),52)|0);
 $8 = tempRet0;
 $9 = $7 & 2047;
 $ee = $9;
 $10 = $ee;
 $tobool = ($10|0)!=(0);
 if ($tobool) {
  $18 = $ee;
  $cmp = ($18|0)==(2047);
  if ($cmp) {
   $19 = $x$addr;
   $retval = $19;
   $45 = $retval;
   STACKTOP = sp;return (+$45);
  } else {
   $20 = $ee;
   $sub8 = (($20) - 1022)|0;
   $21 = $e$addr;
   HEAP32[$21>>2] = $sub8;
   $22 = $y;
   $23 = $22;
   $24 = HEAP32[$23>>2]|0;
   $25 = (($22) + 4)|0;
   $26 = $25;
   $27 = HEAP32[$26>>2]|0;
   $28 = $27 & -2146435073;
   $29 = $y;
   $30 = $29;
   HEAP32[$30>>2] = $24;
   $31 = (($29) + 4)|0;
   $32 = $31;
   HEAP32[$32>>2] = $28;
   $33 = $y;
   $34 = $33;
   $35 = HEAP32[$34>>2]|0;
   $36 = (($33) + 4)|0;
   $37 = $36;
   $38 = HEAP32[$37>>2]|0;
   $39 = $38 | 1071644672;
   $40 = $y;
   $41 = $40;
   HEAP32[$41>>2] = $35;
   $42 = (($40) + 4)|0;
   $43 = $42;
   HEAP32[$43>>2] = $39;
   $44 = +HEAPF64[$y>>3];
   $retval = $44;
   $45 = $retval;
   STACKTOP = sp;return (+$45);
  }
 } else {
  $11 = $x$addr;
  $tobool1 = $11 != 0.0;
  if ($tobool1) {
   $12 = $x$addr;
   $mul = $12 * 1.8446744073709552E+19;
   $13 = $e$addr;
   $call = (+_frexp($mul,$13));
   $x$addr = $call;
   $14 = $e$addr;
   $15 = HEAP32[$14>>2]|0;
   $sub = (($15) - 64)|0;
   HEAP32[$14>>2] = $sub;
  } else {
   $16 = $e$addr;
   HEAP32[$16>>2] = 0;
  }
  $17 = $x$addr;
  $retval = $17;
  $45 = $retval;
  STACKTOP = sp;return (+$45);
 }
 return +(0.0);
}
function ___fpclassify($x) {
 $x = +$x;
 var $0 = 0.0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $cmp = 0, $cond = 0, $cond8 = 0, $e = 0, $retval = 0;
 var $tobool = 0, $u = 0, $x$addr = 0.0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $u = sp;
 $x$addr = $x;
 $0 = $x$addr;
 HEAPF64[$u>>3] = $0;
 $1 = $u;
 $2 = $1;
 $3 = HEAP32[$2>>2]|0;
 $4 = (($1) + 4)|0;
 $5 = $4;
 $6 = HEAP32[$5>>2]|0;
 $7 = (_bitshift64Lshr(($3|0),($6|0),52)|0);
 $8 = tempRet0;
 $9 = $7 & 2047;
 $e = $9;
 $10 = $e;
 $tobool = ($10|0)!=(0);
 if (!($tobool)) {
  $11 = $u;
  $12 = $11;
  $13 = HEAP32[$12>>2]|0;
  $14 = (($11) + 4)|0;
  $15 = $14;
  $16 = HEAP32[$15>>2]|0;
  $17 = (_bitshift64Shl(($13|0),($16|0),1)|0);
  $18 = tempRet0;
  $19 = ($17|0)!=(0);
  $20 = ($18|0)!=(0);
  $21 = $19 | $20;
  $cond = $21 ? 3 : 2;
  $retval = $cond;
  $34 = $retval;
  STACKTOP = sp;return ($34|0);
 }
 $22 = $e;
 $cmp = ($22|0)==(2047);
 if ($cmp) {
  $23 = $u;
  $24 = $23;
  $25 = HEAP32[$24>>2]|0;
  $26 = (($23) + 4)|0;
  $27 = $26;
  $28 = HEAP32[$27>>2]|0;
  $29 = (_bitshift64Shl(($25|0),($28|0),12)|0);
  $30 = tempRet0;
  $31 = ($29|0)!=(0);
  $32 = ($30|0)!=(0);
  $33 = $31 | $32;
  $cond8 = $33 ? 0 : 1;
  $retval = $cond8;
  $34 = $retval;
  STACKTOP = sp;return ($34|0);
 } else {
  $retval = 4;
  $34 = $retval;
  STACKTOP = sp;return ($34|0);
 }
 return (0)|0;
}
function ___signbit($x) {
 $x = +$x;
 var $0 = 0.0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $x$addr = 0.0, $y = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $y = sp;
 $x$addr = $x;
 $0 = $x$addr;
 HEAPF64[$y>>3] = $0;
 $1 = $y;
 $2 = $1;
 $3 = HEAP32[$2>>2]|0;
 $4 = (($1) + 4)|0;
 $5 = $4;
 $6 = HEAP32[$5>>2]|0;
 $7 = (_bitshift64Lshr(($3|0),($6|0),63)|0);
 $8 = tempRet0;
 STACKTOP = sp;return ($7|0);
}
function _wcrtomb($s,$wc,$st) {
 $s = $s|0;
 $wc = $wc|0;
 $st = $st|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $and = 0, $and32 = 0, $and36 = 0, $and49 = 0, $and54 = 0, $and58 = 0, $call = 0, $call10 = 0, $call66 = 0, $cmp = 0;
 var $cmp14 = 0, $cmp21 = 0, $cmp24 = 0, $cmp4 = 0, $cmp41 = 0, $cmp7 = 0, $cond = 0, $conv = 0, $conv12 = 0, $conv17 = 0, $conv19 = 0, $conv29 = 0, $conv34 = 0, $conv38 = 0, $conv46 = 0, $conv51 = 0, $conv56 = 0, $conv60 = 0, $incdec$ptr = 0, $incdec$ptr30 = 0;
 var $incdec$ptr35 = 0, $incdec$ptr47 = 0, $incdec$ptr52 = 0, $incdec$ptr57 = 0, $lnot = 0, $lnot3 = 0, $locale = 0, $or = 0, $or18 = 0, $or28 = 0, $or33 = 0, $or37 = 0, $or45 = 0, $or50 = 0, $or55 = 0, $or59 = 0, $retval = 0, $s$addr = 0, $shr = 0, $shr27 = 0;
 var $shr31 = 0, $shr44 = 0, $shr48 = 0, $shr53 = 0, $st$addr = 0, $sub = 0, $sub23 = 0, $sub40 = 0, $tobool = 0, $tobool2 = 0, $wc$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $s$addr = $s;
 $wc$addr = $wc;
 $st$addr = $st;
 $0 = $s$addr;
 $tobool = ($0|0)!=(0|0);
 if (!($tobool)) {
  $retval = 1;
  $29 = $retval;
  STACKTOP = sp;return ($29|0);
 }
 $1 = $wc$addr;
 $cmp = ($1>>>0)<(128);
 if ($cmp) {
  $2 = $wc$addr;
  $conv = $2&255;
  $3 = $s$addr;
  HEAP8[$3>>0] = $conv;
  $retval = 1;
  $29 = $retval;
  STACKTOP = sp;return ($29|0);
 }
 $call = (___pthread_self_849()|0);
 $locale = ((($call)) + 188|0);
 $4 = HEAP32[$locale>>2]|0;
 $5 = HEAP32[$4>>2]|0;
 $tobool2 = ($5|0)!=(0|0);
 $lnot = $tobool2 ^ 1;
 $lnot3 = $lnot ^ 1;
 $cond = $lnot3 ? 4 : 1;
 $cmp4 = ($cond|0)==(1);
 $6 = $wc$addr;
 if ($cmp4) {
  $sub = (($6) - 57216)|0;
  $cmp7 = ($sub>>>0)<(128);
  if ($cmp7) {
   $7 = $wc$addr;
   $conv12 = $7&255;
   $8 = $s$addr;
   HEAP8[$8>>0] = $conv12;
   $retval = 1;
   $29 = $retval;
   STACKTOP = sp;return ($29|0);
  } else {
   $call10 = (___errno_location()|0);
   HEAP32[$call10>>2] = 84;
   $retval = -1;
   $29 = $retval;
   STACKTOP = sp;return ($29|0);
  }
 }
 $cmp14 = ($6>>>0)<(2048);
 $9 = $wc$addr;
 if ($cmp14) {
  $shr = $9 >> 6;
  $or = 192 | $shr;
  $conv17 = $or&255;
  $10 = $s$addr;
  $incdec$ptr = ((($10)) + 1|0);
  $s$addr = $incdec$ptr;
  HEAP8[$10>>0] = $conv17;
  $11 = $wc$addr;
  $and = $11 & 63;
  $or18 = 128 | $and;
  $conv19 = $or18&255;
  $12 = $s$addr;
  HEAP8[$12>>0] = $conv19;
  $retval = 2;
  $29 = $retval;
  STACKTOP = sp;return ($29|0);
 }
 $cmp21 = ($9>>>0)<(55296);
 if (!($cmp21)) {
  $13 = $wc$addr;
  $sub23 = (($13) - 57344)|0;
  $cmp24 = ($sub23>>>0)<(8192);
  if (!($cmp24)) {
   $20 = $wc$addr;
   $sub40 = (($20) - 65536)|0;
   $cmp41 = ($sub40>>>0)<(1048576);
   if ($cmp41) {
    $21 = $wc$addr;
    $shr44 = $21 >> 18;
    $or45 = 240 | $shr44;
    $conv46 = $or45&255;
    $22 = $s$addr;
    $incdec$ptr47 = ((($22)) + 1|0);
    $s$addr = $incdec$ptr47;
    HEAP8[$22>>0] = $conv46;
    $23 = $wc$addr;
    $shr48 = $23 >> 12;
    $and49 = $shr48 & 63;
    $or50 = 128 | $and49;
    $conv51 = $or50&255;
    $24 = $s$addr;
    $incdec$ptr52 = ((($24)) + 1|0);
    $s$addr = $incdec$ptr52;
    HEAP8[$24>>0] = $conv51;
    $25 = $wc$addr;
    $shr53 = $25 >> 6;
    $and54 = $shr53 & 63;
    $or55 = 128 | $and54;
    $conv56 = $or55&255;
    $26 = $s$addr;
    $incdec$ptr57 = ((($26)) + 1|0);
    $s$addr = $incdec$ptr57;
    HEAP8[$26>>0] = $conv56;
    $27 = $wc$addr;
    $and58 = $27 & 63;
    $or59 = 128 | $and58;
    $conv60 = $or59&255;
    $28 = $s$addr;
    HEAP8[$28>>0] = $conv60;
    $retval = 4;
    $29 = $retval;
    STACKTOP = sp;return ($29|0);
   } else {
    $call66 = (___errno_location()|0);
    HEAP32[$call66>>2] = 84;
    $retval = -1;
    $29 = $retval;
    STACKTOP = sp;return ($29|0);
   }
  }
 }
 $14 = $wc$addr;
 $shr27 = $14 >> 12;
 $or28 = 224 | $shr27;
 $conv29 = $or28&255;
 $15 = $s$addr;
 $incdec$ptr30 = ((($15)) + 1|0);
 $s$addr = $incdec$ptr30;
 HEAP8[$15>>0] = $conv29;
 $16 = $wc$addr;
 $shr31 = $16 >> 6;
 $and32 = $shr31 & 63;
 $or33 = 128 | $and32;
 $conv34 = $or33&255;
 $17 = $s$addr;
 $incdec$ptr35 = ((($17)) + 1|0);
 $s$addr = $incdec$ptr35;
 HEAP8[$17>>0] = $conv34;
 $18 = $wc$addr;
 $and36 = $18 & 63;
 $or37 = 128 | $and36;
 $conv38 = $or37&255;
 $19 = $s$addr;
 HEAP8[$19>>0] = $conv38;
 $retval = 3;
 $29 = $retval;
 STACKTOP = sp;return ($29|0);
}
function ___pthread_self_849() {
 var $call = 0, label = 0, sp = 0;
 sp = STACKTOP;
 $call = (_pthread_self()|0);
 return ($call|0);
}
function ___pthread_self_563() {
 var $call = 0, label = 0, sp = 0;
 sp = STACKTOP;
 $call = (_pthread_self()|0);
 return ($call|0);
}
function ___strerror_l($e,$loc) {
 $e = $e|0;
 $loc = $loc|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $arrayidx = 0, $arrayidx1 = 0, $arrayidx15 = 0, $call = 0, $cmp = 0, $conv = 0;
 var $conv2 = 0, $dec = 0, $e$addr = 0, $i = 0, $inc = 0, $incdec$ptr = 0, $loc$addr = 0, $s = 0, $tobool = 0, $tobool5 = 0, $tobool8 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $e$addr = $e;
 $loc$addr = $loc;
 $i = 0;
 while(1) {
  $0 = $i;
  $arrayidx = (1643 + ($0)|0);
  $1 = HEAP8[$arrayidx>>0]|0;
  $conv = $1&255;
  $tobool = ($conv|0)!=(0);
  if (!($tobool)) {
   break;
  }
  $2 = $i;
  $arrayidx1 = (1643 + ($2)|0);
  $3 = HEAP8[$arrayidx1>>0]|0;
  $conv2 = $3&255;
  $4 = $e$addr;
  $cmp = ($conv2|0)!=($4|0);
  if (!($cmp)) {
   break;
  }
  $5 = $i;
  $inc = (($5) + 1)|0;
  $i = $inc;
 }
 $s = 1731;
 while(1) {
  $6 = $i;
  $tobool5 = ($6|0)!=(0);
  if (!($tobool5)) {
   break;
  }
  while(1) {
   $7 = $s;
   $8 = HEAP8[$7>>0]|0;
   $tobool8 = ($8<<24>>24)!=(0);
   $9 = $s;
   $incdec$ptr = ((($9)) + 1|0);
   $s = $incdec$ptr;
   if (!($tobool8)) {
    break;
   }
  }
  $10 = $i;
  $dec = (($10) + -1)|0;
  $i = $dec;
 }
 $11 = $s;
 $12 = $loc$addr;
 $arrayidx15 = ((($12)) + 20|0);
 $13 = HEAP32[$arrayidx15>>2]|0;
 $call = (___lctrans($11,$13)|0);
 STACKTOP = sp;return ($call|0);
}
function ___lctrans($msg,$lm) {
 $msg = $msg|0;
 $lm = $lm|0;
 var $0 = 0, $1 = 0, $call = 0, $lm$addr = 0, $msg$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $msg$addr = $msg;
 $lm$addr = $lm;
 $0 = $msg$addr;
 $1 = $lm$addr;
 $call = (___lctrans_impl($0,$1)|0);
 STACKTOP = sp;return ($call|0);
}
function ___lctrans_impl($msg,$lm) {
 $msg = $msg|0;
 $lm = $lm|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $call = 0, $cond = 0, $lm$addr = 0, $map_size = 0, $msg$addr = 0, $tobool = 0, $tobool1 = 0, $trans = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $msg$addr = $msg;
 $lm$addr = $lm;
 $trans = 0;
 $0 = $lm$addr;
 $tobool = ($0|0)!=(0|0);
 if ($tobool) {
  $1 = $lm$addr;
  $2 = HEAP32[$1>>2]|0;
  $3 = $lm$addr;
  $map_size = ((($3)) + 4|0);
  $4 = HEAP32[$map_size>>2]|0;
  $5 = $msg$addr;
  $call = (___mo_lookup($2,$4,$5)|0);
  $trans = $call;
 }
 $6 = $trans;
 $tobool1 = ($6|0)!=(0|0);
 $7 = $trans;
 $8 = $msg$addr;
 $cond = $tobool1 ? $7 : $8;
 STACKTOP = sp;return ($cond|0);
}
function ___mo_lookup($p,$size,$s) {
 $p = $p|0;
 $size = $size|0;
 $s = $s|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $43 = 0, $44 = 0;
 var $45 = 0, $46 = 0, $47 = 0, $48 = 0, $49 = 0, $5 = 0, $50 = 0, $51 = 0, $52 = 0, $53 = 0, $54 = 0, $55 = 0, $56 = 0, $57 = 0, $58 = 0, $59 = 0, $6 = 0, $60 = 0, $61 = 0, $62 = 0;
 var $63 = 0, $64 = 0, $65 = 0, $66 = 0, $67 = 0, $68 = 0, $69 = 0, $7 = 0, $70 = 0, $71 = 0, $72 = 0, $73 = 0, $74 = 0, $75 = 0, $76 = 0, $77 = 0, $78 = 0, $8 = 0, $9 = 0, $add = 0;
 var $add$ptr = 0, $add$ptr65 = 0, $add16 = 0, $add20 = 0, $add22 = 0, $add23 = 0, $add31 = 0, $add40 = 0, $add42 = 0, $add46 = 0, $add48 = 0, $add49 = 0, $add59 = 0, $add76 = 0, $arrayidx = 0, $arrayidx1 = 0, $arrayidx17 = 0, $arrayidx24 = 0, $arrayidx3 = 0, $arrayidx32 = 0;
 var $arrayidx43 = 0, $arrayidx50 = 0, $arrayidx60 = 0, $b = 0, $call = 0, $call18 = 0, $call2 = 0, $call25 = 0, $call36 = 0, $call4 = 0, $call44 = 0, $call51 = 0, $cmp = 0, $cmp10 = 0, $cmp26 = 0, $cmp29 = 0, $cmp52 = 0, $cmp56 = 0, $cmp6 = 0, $cmp66 = 0;
 var $cmp70 = 0, $conv = 0, $conv61 = 0, $div = 0, $div12 = 0, $div13 = 0, $div14 = 0, $div19 = 0, $div39 = 0, $div45 = 0, $div73 = 0, $div77 = 0, $mo = 0, $mul = 0, $mul15 = 0, $mul21 = 0, $mul41 = 0, $mul47 = 0, $mul8 = 0, $n = 0;
 var $o = 0, $ol = 0, $or = 0, $os = 0, $p$addr = 0, $rem = 0, $retval = 0, $s$addr = 0, $sign = 0, $size$addr = 0, $sub = 0, $sub28 = 0, $sub5 = 0, $sub55 = 0, $sub78 = 0, $sub9 = 0, $sw = 0, $t = 0, $tl = 0, $tobool = 0;
 var $tobool33 = 0, $tobool37 = 0, $tobool62 = 0, $ts = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 64|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(64|0);
 $p$addr = $p;
 $size$addr = $size;
 $s$addr = $s;
 $0 = $p$addr;
 $mo = $0;
 $1 = $mo;
 $2 = HEAP32[$1>>2]|0;
 $sub = (($2) - -1794895138)|0;
 $sw = $sub;
 $b = 0;
 $3 = $mo;
 $arrayidx = ((($3)) + 8|0);
 $4 = HEAP32[$arrayidx>>2]|0;
 $5 = $sw;
 $call = (_swapc($4,$5)|0);
 $n = $call;
 $6 = $mo;
 $arrayidx1 = ((($6)) + 12|0);
 $7 = HEAP32[$arrayidx1>>2]|0;
 $8 = $sw;
 $call2 = (_swapc($7,$8)|0);
 $o = $call2;
 $9 = $mo;
 $arrayidx3 = ((($9)) + 16|0);
 $10 = HEAP32[$arrayidx3>>2]|0;
 $11 = $sw;
 $call4 = (_swapc($10,$11)|0);
 $t = $call4;
 $12 = $n;
 $13 = $size$addr;
 $div = (($13>>>0) / 4)&-1;
 $cmp = ($12>>>0)>=($div>>>0);
 if (!($cmp)) {
  $14 = $o;
  $15 = $size$addr;
  $16 = $n;
  $mul = $16<<2;
  $sub5 = (($15) - ($mul))|0;
  $cmp6 = ($14>>>0)>=($sub5>>>0);
  if (!($cmp6)) {
   $17 = $t;
   $18 = $size$addr;
   $19 = $n;
   $mul8 = $19<<2;
   $sub9 = (($18) - ($mul8))|0;
   $cmp10 = ($17>>>0)>=($sub9>>>0);
   if (!($cmp10)) {
    $20 = $o;
    $21 = $t;
    $or = $20 | $21;
    $rem = (($or>>>0) % 4)&-1;
    $tobool = ($rem|0)!=(0);
    if (!($tobool)) {
     $22 = $o;
     $div12 = (($22>>>0) / 4)&-1;
     $o = $div12;
     $23 = $t;
     $div13 = (($23>>>0) / 4)&-1;
     $t = $div13;
     while(1) {
      $24 = $mo;
      $25 = $o;
      $26 = $b;
      $27 = $n;
      $div14 = (($27>>>0) / 2)&-1;
      $add = (($26) + ($div14))|0;
      $mul15 = $add<<1;
      $add16 = (($25) + ($mul15))|0;
      $arrayidx17 = (($24) + ($add16<<2)|0);
      $28 = HEAP32[$arrayidx17>>2]|0;
      $29 = $sw;
      $call18 = (_swapc($28,$29)|0);
      $ol = $call18;
      $30 = $mo;
      $31 = $o;
      $32 = $b;
      $33 = $n;
      $div19 = (($33>>>0) / 2)&-1;
      $add20 = (($32) + ($div19))|0;
      $mul21 = $add20<<1;
      $add22 = (($31) + ($mul21))|0;
      $add23 = (($add22) + 1)|0;
      $arrayidx24 = (($30) + ($add23<<2)|0);
      $34 = HEAP32[$arrayidx24>>2]|0;
      $35 = $sw;
      $call25 = (_swapc($34,$35)|0);
      $os = $call25;
      $36 = $os;
      $37 = $size$addr;
      $cmp26 = ($36>>>0)>=($37>>>0);
      if ($cmp26) {
       label = 10;
       break;
      }
      $38 = $ol;
      $39 = $size$addr;
      $40 = $os;
      $sub28 = (($39) - ($40))|0;
      $cmp29 = ($38>>>0)>=($sub28>>>0);
      if ($cmp29) {
       label = 10;
       break;
      }
      $41 = $p$addr;
      $42 = $os;
      $43 = $ol;
      $add31 = (($42) + ($43))|0;
      $arrayidx32 = (($41) + ($add31)|0);
      $44 = HEAP8[$arrayidx32>>0]|0;
      $conv = $44 << 24 >> 24;
      $tobool33 = ($conv|0)!=(0);
      if ($tobool33) {
       label = 10;
       break;
      }
      $45 = $s$addr;
      $46 = $p$addr;
      $47 = $os;
      $add$ptr = (($46) + ($47)|0);
      $call36 = (_strcmp($45,$add$ptr)|0);
      $sign = $call36;
      $48 = $sign;
      $tobool37 = ($48|0)!=(0);
      if (!($tobool37)) {
       label = 12;
       break;
      }
      $72 = $n;
      $cmp66 = ($72|0)==(1);
      if ($cmp66) {
       label = 18;
       break;
      }
      $73 = $sign;
      $cmp70 = ($73|0)<(0);
      $74 = $n;
      $div73 = (($74>>>0) / 2)&-1;
      if ($cmp70) {
       $n = $div73;
       continue;
      } else {
       $75 = $b;
       $add76 = (($75) + ($div73))|0;
       $b = $add76;
       $76 = $n;
       $div77 = (($76>>>0) / 2)&-1;
       $77 = $n;
       $sub78 = (($77) - ($div77))|0;
       $n = $sub78;
       continue;
      }
     }
     if ((label|0) == 10) {
      $retval = 0;
      $78 = $retval;
      STACKTOP = sp;return ($78|0);
     }
     else if ((label|0) == 12) {
      $49 = $mo;
      $50 = $t;
      $51 = $b;
      $52 = $n;
      $div39 = (($52>>>0) / 2)&-1;
      $add40 = (($51) + ($div39))|0;
      $mul41 = $add40<<1;
      $add42 = (($50) + ($mul41))|0;
      $arrayidx43 = (($49) + ($add42<<2)|0);
      $53 = HEAP32[$arrayidx43>>2]|0;
      $54 = $sw;
      $call44 = (_swapc($53,$54)|0);
      $tl = $call44;
      $55 = $mo;
      $56 = $t;
      $57 = $b;
      $58 = $n;
      $div45 = (($58>>>0) / 2)&-1;
      $add46 = (($57) + ($div45))|0;
      $mul47 = $add46<<1;
      $add48 = (($56) + ($mul47))|0;
      $add49 = (($add48) + 1)|0;
      $arrayidx50 = (($55) + ($add49<<2)|0);
      $59 = HEAP32[$arrayidx50>>2]|0;
      $60 = $sw;
      $call51 = (_swapc($59,$60)|0);
      $ts = $call51;
      $61 = $ts;
      $62 = $size$addr;
      $cmp52 = ($61>>>0)>=($62>>>0);
      if (!($cmp52)) {
       $63 = $tl;
       $64 = $size$addr;
       $65 = $ts;
       $sub55 = (($64) - ($65))|0;
       $cmp56 = ($63>>>0)>=($sub55>>>0);
       if (!($cmp56)) {
        $66 = $p$addr;
        $67 = $ts;
        $68 = $tl;
        $add59 = (($67) + ($68))|0;
        $arrayidx60 = (($66) + ($add59)|0);
        $69 = HEAP8[$arrayidx60>>0]|0;
        $conv61 = $69 << 24 >> 24;
        $tobool62 = ($conv61|0)!=(0);
        if (!($tobool62)) {
         $70 = $p$addr;
         $71 = $ts;
         $add$ptr65 = (($70) + ($71)|0);
         $retval = $add$ptr65;
         $78 = $retval;
         STACKTOP = sp;return ($78|0);
        }
       }
      }
      $retval = 0;
      $78 = $retval;
      STACKTOP = sp;return ($78|0);
     }
     else if ((label|0) == 18) {
      $retval = 0;
      $78 = $retval;
      STACKTOP = sp;return ($78|0);
     }
    }
   }
  }
 }
 $retval = 0;
 $78 = $retval;
 STACKTOP = sp;return ($78|0);
}
function _swapc($x,$c) {
 $x = $x|0;
 $c = $c|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $and = 0, $and2 = 0, $c$addr = 0, $cond = 0, $or = 0, $or3 = 0, $or5 = 0, $shl = 0, $shl4 = 0, $shr = 0, $shr1 = 0, $tobool = 0, $x$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $x$addr = $x;
 $c$addr = $c;
 $0 = $c$addr;
 $tobool = ($0|0)!=(0);
 $1 = $x$addr;
 if (!($tobool)) {
  $cond = $1;
  STACKTOP = sp;return ($cond|0);
 }
 $shr = $1 >>> 24;
 $2 = $x$addr;
 $shr1 = $2 >>> 8;
 $and = $shr1 & 65280;
 $or = $shr | $and;
 $3 = $x$addr;
 $shl = $3 << 8;
 $and2 = $shl & 16711680;
 $or3 = $or | $and2;
 $4 = $x$addr;
 $shl4 = $4 << 24;
 $or5 = $or3 | $shl4;
 $cond = $or5;
 STACKTOP = sp;return ($cond|0);
}
function ___fwritex($s,$l,$f) {
 $s = $s|0;
 $l = $l|0;
 $f = $f|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $36 = 0, $37 = 0, $38 = 0, $39 = 0, $4 = 0, $40 = 0, $41 = 0, $42 = 0, $5 = 0, $6 = 0;
 var $7 = 0, $8 = 0, $9 = 0, $add = 0, $add$ptr = 0, $add$ptr26 = 0, $arrayidx = 0, $call = 0, $call16 = 0, $call4 = 0, $cmp = 0, $cmp11 = 0, $cmp17 = 0, $cmp6 = 0, $conv = 0, $conv10 = 0, $dec = 0, $f$addr = 0, $i = 0, $l$addr = 0;
 var $lbf = 0, $n = 0, $retval = 0, $s$addr = 0, $sub = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$sub = 0, $sub21 = 0, $tobool = 0, $tobool1 = 0, $tobool13 = 0, $tobool9 = 0, $wend = 0, $wend2 = 0, $wpos = 0, $wpos24 = 0, $wpos25 = 0, $write = 0, $write15 = 0;
 var label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $s$addr = $s;
 $l$addr = $l;
 $f$addr = $f;
 $i = 0;
 $0 = $f$addr;
 $wend = ((($0)) + 16|0);
 $1 = HEAP32[$wend>>2]|0;
 $tobool = ($1|0)!=(0|0);
 if (!($tobool)) {
  $2 = $f$addr;
  $call = (___towrite($2)|0);
  $tobool1 = ($call|0)!=(0);
  if ($tobool1) {
   $retval = 0;
   $42 = $retval;
   STACKTOP = sp;return ($42|0);
  }
 }
 $3 = $l$addr;
 $4 = $f$addr;
 $wend2 = ((($4)) + 16|0);
 $5 = HEAP32[$wend2>>2]|0;
 $6 = $f$addr;
 $wpos = ((($6)) + 20|0);
 $7 = HEAP32[$wpos>>2]|0;
 $sub$ptr$lhs$cast = $5;
 $sub$ptr$rhs$cast = $7;
 $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
 $cmp = ($3>>>0)>($sub$ptr$sub>>>0);
 $8 = $f$addr;
 if ($cmp) {
  $write = ((($8)) + 36|0);
  $9 = HEAP32[$write>>2]|0;
  $10 = $f$addr;
  $11 = $s$addr;
  $12 = $l$addr;
  $call4 = (FUNCTION_TABLE_iiii[$9 & 7]($10,$11,$12)|0);
  $retval = $call4;
  $42 = $retval;
  STACKTOP = sp;return ($42|0);
 }
 $lbf = ((($8)) + 75|0);
 $13 = HEAP8[$lbf>>0]|0;
 $conv = $13 << 24 >> 24;
 $cmp6 = ($conv|0)>=(0);
 do {
  if ($cmp6) {
   $14 = $l$addr;
   $i = $14;
   while(1) {
    $15 = $i;
    $tobool9 = ($15|0)!=(0);
    if (!($tobool9)) {
     break;
    }
    $16 = $s$addr;
    $17 = $i;
    $sub = (($17) - 1)|0;
    $arrayidx = (($16) + ($sub)|0);
    $18 = HEAP8[$arrayidx>>0]|0;
    $conv10 = $18&255;
    $cmp11 = ($conv10|0)!=(10);
    if (!($cmp11)) {
     break;
    }
    $19 = $i;
    $dec = (($19) + -1)|0;
    $i = $dec;
   }
   $20 = $i;
   $tobool13 = ($20|0)!=(0);
   if ($tobool13) {
    $21 = $f$addr;
    $write15 = ((($21)) + 36|0);
    $22 = HEAP32[$write15>>2]|0;
    $23 = $f$addr;
    $24 = $s$addr;
    $25 = $i;
    $call16 = (FUNCTION_TABLE_iiii[$22 & 7]($23,$24,$25)|0);
    $n = $call16;
    $26 = $n;
    $27 = $i;
    $cmp17 = ($26>>>0)<($27>>>0);
    if (!($cmp17)) {
     $29 = $i;
     $30 = $s$addr;
     $add$ptr = (($30) + ($29)|0);
     $s$addr = $add$ptr;
     $31 = $i;
     $32 = $l$addr;
     $sub21 = (($32) - ($31))|0;
     $l$addr = $sub21;
     break;
    }
    $28 = $n;
    $retval = $28;
    $42 = $retval;
    STACKTOP = sp;return ($42|0);
   }
  }
 } while(0);
 $33 = $f$addr;
 $wpos24 = ((($33)) + 20|0);
 $34 = HEAP32[$wpos24>>2]|0;
 $35 = $s$addr;
 $36 = $l$addr;
 _memcpy(($34|0),($35|0),($36|0))|0;
 $37 = $l$addr;
 $38 = $f$addr;
 $wpos25 = ((($38)) + 20|0);
 $39 = HEAP32[$wpos25>>2]|0;
 $add$ptr26 = (($39) + ($37)|0);
 HEAP32[$wpos25>>2] = $add$ptr26;
 $40 = $l$addr;
 $41 = $i;
 $add = (($40) + ($41))|0;
 $retval = $add;
 $42 = $retval;
 STACKTOP = sp;return ($42|0);
}
function ___towrite($f) {
 $f = $f|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add$ptr = 0;
 var $and = 0, $buf = 0, $buf6 = 0, $buf_size = 0, $conv = 0, $conv2 = 0, $conv3 = 0, $f$addr = 0, $mode = 0, $mode1 = 0, $or = 0, $or5 = 0, $rend = 0, $retval = 0, $rpos = 0, $sub = 0, $tobool = 0, $wbase = 0, $wend = 0, $wpos = 0;
 var label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 $0 = $f$addr;
 $mode = ((($0)) + 74|0);
 $1 = HEAP8[$mode>>0]|0;
 $conv = $1 << 24 >> 24;
 $sub = (($conv) - 1)|0;
 $2 = $f$addr;
 $mode1 = ((($2)) + 74|0);
 $3 = HEAP8[$mode1>>0]|0;
 $conv2 = $3 << 24 >> 24;
 $or = $conv2 | $sub;
 $conv3 = $or&255;
 HEAP8[$mode1>>0] = $conv3;
 $4 = $f$addr;
 $5 = HEAP32[$4>>2]|0;
 $and = $5 & 8;
 $tobool = ($and|0)!=(0);
 $6 = $f$addr;
 if ($tobool) {
  $7 = HEAP32[$6>>2]|0;
  $or5 = $7 | 32;
  HEAP32[$6>>2] = $or5;
  $retval = -1;
  $18 = $retval;
  STACKTOP = sp;return ($18|0);
 } else {
  $rend = ((($6)) + 8|0);
  HEAP32[$rend>>2] = 0;
  $8 = $f$addr;
  $rpos = ((($8)) + 4|0);
  HEAP32[$rpos>>2] = 0;
  $9 = $f$addr;
  $buf = ((($9)) + 44|0);
  $10 = HEAP32[$buf>>2]|0;
  $11 = $f$addr;
  $wbase = ((($11)) + 28|0);
  HEAP32[$wbase>>2] = $10;
  $12 = $f$addr;
  $wpos = ((($12)) + 20|0);
  HEAP32[$wpos>>2] = $10;
  $13 = $f$addr;
  $buf6 = ((($13)) + 44|0);
  $14 = HEAP32[$buf6>>2]|0;
  $15 = $f$addr;
  $buf_size = ((($15)) + 48|0);
  $16 = HEAP32[$buf_size>>2]|0;
  $add$ptr = (($14) + ($16)|0);
  $17 = $f$addr;
  $wend = ((($17)) + 16|0);
  HEAP32[$wend>>2] = $add$ptr;
  $retval = 0;
  $18 = $retval;
  STACKTOP = sp;return ($18|0);
 }
 return (0)|0;
}
function _sn_write($f,$s,$l) {
 $f = $f|0;
 $s = $s|0;
 $l = $l|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add$ptr = 0, $cmp = 0, $f$addr = 0, $k = 0, $l$addr = 0;
 var $s$addr = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$sub = 0, $wend = 0, $wpos = 0, $wpos1 = 0, $wpos2 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 $s$addr = $s;
 $l$addr = $l;
 $0 = $f$addr;
 $wend = ((($0)) + 16|0);
 $1 = HEAP32[$wend>>2]|0;
 $2 = $f$addr;
 $wpos = ((($2)) + 20|0);
 $3 = HEAP32[$wpos>>2]|0;
 $sub$ptr$lhs$cast = $1;
 $sub$ptr$rhs$cast = $3;
 $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
 $k = $sub$ptr$sub;
 $4 = $k;
 $5 = $l$addr;
 $cmp = ($4>>>0)>($5>>>0);
 if ($cmp) {
  $6 = $l$addr;
  $k = $6;
 }
 $7 = $f$addr;
 $wpos1 = ((($7)) + 20|0);
 $8 = HEAP32[$wpos1>>2]|0;
 $9 = $s$addr;
 $10 = $k;
 _memcpy(($8|0),($9|0),($10|0))|0;
 $11 = $k;
 $12 = $f$addr;
 $wpos2 = ((($12)) + 20|0);
 $13 = HEAP32[$wpos2>>2]|0;
 $add$ptr = (($13) + ($11)|0);
 HEAP32[$wpos2>>2] = $add$ptr;
 $14 = $l$addr;
 STACKTOP = sp;return ($14|0);
}
function _fopen($filename,$mode) {
 $filename = $filename|0;
 $mode = $mode|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $and = 0, $call = 0, $call1 = 0, $call12 = 0, $call2 = 0;
 var $call3 = 0, $call4 = 0, $cmp = 0, $conv = 0, $f = 0, $fd = 0, $filename$addr = 0, $flags = 0, $mode$addr = 0, $or = 0, $retval = 0, $tobool = 0, $tobool13 = 0, $tobool8 = 0, $vararg_buffer = 0, $vararg_buffer3 = 0, $vararg_buffer8 = 0, $vararg_ptr1 = 0, $vararg_ptr2 = 0, $vararg_ptr6 = 0;
 var $vararg_ptr7 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 64|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(64|0);
 $vararg_buffer8 = sp + 32|0;
 $vararg_buffer3 = sp + 16|0;
 $vararg_buffer = sp;
 $filename$addr = $filename;
 $mode$addr = $mode;
 $0 = $mode$addr;
 $1 = HEAP8[$0>>0]|0;
 $conv = $1 << 24 >> 24;
 $call = (_strchr(3535,$conv)|0);
 $tobool = ($call|0)!=(0|0);
 if (!($tobool)) {
  $call1 = (___errno_location()|0);
  HEAP32[$call1>>2] = 22;
  $retval = 0;
  $14 = $retval;
  STACKTOP = sp;return ($14|0);
 }
 $2 = $mode$addr;
 $call2 = (___fmodeflags($2)|0);
 $flags = $call2;
 $3 = $filename$addr;
 $4 = $3;
 $5 = $flags;
 $or = $5 | 32768;
 HEAP32[$vararg_buffer>>2] = $4;
 $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
 HEAP32[$vararg_ptr1>>2] = $or;
 $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
 HEAP32[$vararg_ptr2>>2] = 438;
 $call3 = (___syscall5(5,($vararg_buffer|0))|0);
 $call4 = (___syscall_ret($call3)|0);
 $fd = $call4;
 $6 = $fd;
 $cmp = ($6|0)<(0);
 if ($cmp) {
  $retval = 0;
  $14 = $retval;
  STACKTOP = sp;return ($14|0);
 }
 $7 = $flags;
 $and = $7 & 524288;
 $tobool8 = ($and|0)!=(0);
 if ($tobool8) {
  $8 = $fd;
  HEAP32[$vararg_buffer3>>2] = $8;
  $vararg_ptr6 = ((($vararg_buffer3)) + 4|0);
  HEAP32[$vararg_ptr6>>2] = 2;
  $vararg_ptr7 = ((($vararg_buffer3)) + 8|0);
  HEAP32[$vararg_ptr7>>2] = 1;
  (___syscall221(221,($vararg_buffer3|0))|0);
 }
 $9 = $fd;
 $10 = $mode$addr;
 $call12 = (___fdopen($9,$10)|0);
 $f = $call12;
 $11 = $f;
 $tobool13 = ($11|0)!=(0|0);
 if ($tobool13) {
  $12 = $f;
  $retval = $12;
  $14 = $retval;
  STACKTOP = sp;return ($14|0);
 } else {
  $13 = $fd;
  HEAP32[$vararg_buffer8>>2] = $13;
  (___syscall6(6,($vararg_buffer8|0))|0);
  $retval = 0;
  $14 = $retval;
  STACKTOP = sp;return ($14|0);
 }
 return (0)|0;
}
function _strchr($s,$c) {
 $s = $s|0;
 $c = $c|0;
 var $0 = 0, $1 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $c$addr = 0, $call = 0, $cmp = 0, $cond = 0, $conv = 0, $conv1 = 0, $conv2 = 0, $r = 0, $s$addr = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $s$addr = $s;
 $c$addr = $c;
 $0 = $s$addr;
 $1 = $c$addr;
 $call = (___strchrnul($0,$1)|0);
 $r = $call;
 $2 = $r;
 $3 = HEAP8[$2>>0]|0;
 $conv = $3&255;
 $4 = $c$addr;
 $conv1 = $4&255;
 $conv2 = $conv1&255;
 $cmp = ($conv|0)==($conv2|0);
 $5 = $r;
 $cond = $cmp ? $5 : 0;
 STACKTOP = sp;return ($cond|0);
}
function ___strchrnul($s,$c) {
 $s = $s|0;
 $c = $c|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add$ptr = 0, $and = 0, $and14 = 0, $and15 = 0, $and9 = 0;
 var $c$addr = 0, $call = 0, $cmp = 0, $cmp26 = 0, $conv = 0, $conv1 = 0, $conv22 = 0, $conv25 = 0, $conv4 = 0, $incdec$ptr = 0, $incdec$ptr19 = 0, $incdec$ptr31 = 0, $k = 0, $lnot = 0, $mul = 0, $neg = 0, $neg13 = 0, $rem = 0, $retval = 0, $s$addr = 0;
 var $sub = 0, $sub11 = 0, $tobool = 0, $tobool10 = 0, $tobool16 = 0, $tobool2 = 0, $tobool23 = 0, $tobool3 = 0, $w = 0, $xor = 0, $xor12 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $s$addr = $s;
 $c$addr = $c;
 $0 = $c$addr;
 $conv = $0&255;
 $conv1 = $conv&255;
 $c$addr = $conv1;
 $1 = $c$addr;
 $tobool = ($1|0)!=(0);
 if (!($tobool)) {
  $2 = $s$addr;
  $3 = $s$addr;
  $call = (_strlen($3)|0);
  $add$ptr = (($2) + ($call)|0);
  $retval = $add$ptr;
  $34 = $retval;
  STACKTOP = sp;return ($34|0);
 }
 while(1) {
  $4 = $s$addr;
  $5 = $4;
  $rem = (($5>>>0) % 4)&-1;
  $tobool2 = ($rem|0)!=(0);
  if (!($tobool2)) {
   break;
  }
  $6 = $s$addr;
  $7 = HEAP8[$6>>0]|0;
  $tobool3 = ($7<<24>>24)!=(0);
  if (!($tobool3)) {
   label = 6;
   break;
  }
  $8 = $s$addr;
  $9 = HEAP8[$8>>0]|0;
  $conv4 = $9&255;
  $10 = $c$addr;
  $cmp = ($conv4|0)==($10|0);
  if ($cmp) {
   label = 6;
   break;
  }
  $12 = $s$addr;
  $incdec$ptr = ((($12)) + 1|0);
  $s$addr = $incdec$ptr;
 }
 if ((label|0) == 6) {
  $11 = $s$addr;
  $retval = $11;
  $34 = $retval;
  STACKTOP = sp;return ($34|0);
 }
 $13 = $c$addr;
 $mul = Math_imul(16843009, $13)|0;
 $k = $mul;
 $14 = $s$addr;
 $w = $14;
 while(1) {
  $15 = $w;
  $16 = HEAP32[$15>>2]|0;
  $sub = (($16) - 16843009)|0;
  $17 = $w;
  $18 = HEAP32[$17>>2]|0;
  $neg = $18 ^ -1;
  $and = $sub & $neg;
  $and9 = $and & -2139062144;
  $tobool10 = ($and9|0)!=(0);
  if ($tobool10) {
   break;
  }
  $19 = $w;
  $20 = HEAP32[$19>>2]|0;
  $21 = $k;
  $xor = $20 ^ $21;
  $sub11 = (($xor) - 16843009)|0;
  $22 = $w;
  $23 = HEAP32[$22>>2]|0;
  $24 = $k;
  $xor12 = $23 ^ $24;
  $neg13 = $xor12 ^ -1;
  $and14 = $sub11 & $neg13;
  $and15 = $and14 & -2139062144;
  $tobool16 = ($and15|0)!=(0);
  $lnot = $tobool16 ^ 1;
  if (!($lnot)) {
   break;
  }
  $25 = $w;
  $incdec$ptr19 = ((($25)) + 4|0);
  $w = $incdec$ptr19;
 }
 $26 = $w;
 $s$addr = $26;
 while(1) {
  $27 = $s$addr;
  $28 = HEAP8[$27>>0]|0;
  $conv22 = $28 << 24 >> 24;
  $tobool23 = ($conv22|0)!=(0);
  if (!($tobool23)) {
   break;
  }
  $29 = $s$addr;
  $30 = HEAP8[$29>>0]|0;
  $conv25 = $30&255;
  $31 = $c$addr;
  $cmp26 = ($conv25|0)!=($31|0);
  if (!($cmp26)) {
   break;
  }
  $32 = $s$addr;
  $incdec$ptr31 = ((($32)) + 1|0);
  $s$addr = $incdec$ptr31;
 }
 $33 = $s$addr;
 $retval = $33;
 $34 = $retval;
 STACKTOP = sp;return ($34|0);
}
function _strlen($s) {
 $s = $s|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $a = 0, $and = 0, $and3 = 0;
 var $incdec$ptr = 0, $incdec$ptr13 = 0, $incdec$ptr7 = 0, $lnot = 0, $neg = 0, $rem = 0, $retval = 0, $s$addr = 0, $sub = 0, $sub$ptr$lhs$cast = 0, $sub$ptr$lhs$cast15 = 0, $sub$ptr$rhs$cast = 0, $sub$ptr$rhs$cast16 = 0, $sub$ptr$sub = 0, $sub$ptr$sub17 = 0, $tobool = 0, $tobool1 = 0, $tobool10 = 0, $tobool4 = 0, $w = 0;
 var label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $s$addr = $s;
 $0 = $s$addr;
 $a = $0;
 while(1) {
  $1 = $s$addr;
  $2 = $1;
  $rem = (($2>>>0) % 4)&-1;
  $tobool = ($rem|0)!=(0);
  $3 = $s$addr;
  if (!($tobool)) {
   break;
  }
  $4 = HEAP8[$3>>0]|0;
  $tobool1 = ($4<<24>>24)!=(0);
  $5 = $s$addr;
  if (!($tobool1)) {
   label = 4;
   break;
  }
  $incdec$ptr = ((($5)) + 1|0);
  $s$addr = $incdec$ptr;
 }
 if ((label|0) == 4) {
  $6 = $a;
  $sub$ptr$lhs$cast = $5;
  $sub$ptr$rhs$cast = $6;
  $sub$ptr$sub = (($sub$ptr$lhs$cast) - ($sub$ptr$rhs$cast))|0;
  $retval = $sub$ptr$sub;
  $16 = $retval;
  STACKTOP = sp;return ($16|0);
 }
 $w = $3;
 while(1) {
  $7 = $w;
  $8 = HEAP32[$7>>2]|0;
  $sub = (($8) - 16843009)|0;
  $9 = $w;
  $10 = HEAP32[$9>>2]|0;
  $neg = $10 ^ -1;
  $and = $sub & $neg;
  $and3 = $and & -2139062144;
  $tobool4 = ($and3|0)!=(0);
  $lnot = $tobool4 ^ 1;
  $11 = $w;
  if (!($lnot)) {
   break;
  }
  $incdec$ptr7 = ((($11)) + 4|0);
  $w = $incdec$ptr7;
 }
 $s$addr = $11;
 while(1) {
  $12 = $s$addr;
  $13 = HEAP8[$12>>0]|0;
  $tobool10 = ($13<<24>>24)!=(0);
  $14 = $s$addr;
  if (!($tobool10)) {
   break;
  }
  $incdec$ptr13 = ((($14)) + 1|0);
  $s$addr = $incdec$ptr13;
 }
 $15 = $a;
 $sub$ptr$lhs$cast15 = $14;
 $sub$ptr$rhs$cast16 = $15;
 $sub$ptr$sub17 = (($sub$ptr$lhs$cast15) - ($sub$ptr$rhs$cast16))|0;
 $retval = $sub$ptr$sub17;
 $16 = $retval;
 STACKTOP = sp;return ($16|0);
}
function ___fmodeflags($mode) {
 $mode = $mode|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $call = 0, $call5 = 0, $call9 = 0;
 var $cmp = 0, $cmp15 = 0, $cmp21 = 0, $cmp27 = 0, $conv = 0, $conv14 = 0, $conv20 = 0, $conv26 = 0, $flags = 0, $mode$addr = 0, $or = 0, $or12 = 0, $or18 = 0, $or24 = 0, $or30 = 0, $tobool = 0, $tobool10 = 0, $tobool6 = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $mode$addr = $mode;
 $0 = $mode$addr;
 $call = (_strchr($0,43)|0);
 $tobool = ($call|0)!=(0|0);
 do {
  if ($tobool) {
   $flags = 2;
  } else {
   $1 = $mode$addr;
   $2 = HEAP8[$1>>0]|0;
   $conv = $2 << 24 >> 24;
   $cmp = ($conv|0)==(114);
   if ($cmp) {
    $flags = 0;
    break;
   } else {
    $flags = 1;
    break;
   }
  }
 } while(0);
 $3 = $mode$addr;
 $call5 = (_strchr($3,120)|0);
 $tobool6 = ($call5|0)!=(0|0);
 if ($tobool6) {
  $4 = $flags;
  $or = $4 | 128;
  $flags = $or;
 }
 $5 = $mode$addr;
 $call9 = (_strchr($5,101)|0);
 $tobool10 = ($call9|0)!=(0|0);
 if ($tobool10) {
  $6 = $flags;
  $or12 = $6 | 524288;
  $flags = $or12;
 }
 $7 = $mode$addr;
 $8 = HEAP8[$7>>0]|0;
 $conv14 = $8 << 24 >> 24;
 $cmp15 = ($conv14|0)!=(114);
 if ($cmp15) {
  $9 = $flags;
  $or18 = $9 | 64;
  $flags = $or18;
 }
 $10 = $mode$addr;
 $11 = HEAP8[$10>>0]|0;
 $conv20 = $11 << 24 >> 24;
 $cmp21 = ($conv20|0)==(119);
 if ($cmp21) {
  $12 = $flags;
  $or24 = $12 | 512;
  $flags = $or24;
 }
 $13 = $mode$addr;
 $14 = HEAP8[$13>>0]|0;
 $conv26 = $14 << 24 >> 24;
 $cmp27 = ($conv26|0)==(97);
 if (!($cmp27)) {
  $16 = $flags;
  STACKTOP = sp;return ($16|0);
 }
 $15 = $flags;
 $or30 = $15 | 1024;
 $flags = $or30;
 $16 = $flags;
 STACKTOP = sp;return ($16|0);
}
function ___fdopen($fd,$mode) {
 $fd = $fd|0;
 $mode = $mode|0;
 var $0 = 0, $1 = 0, $10 = 0, $11 = 0, $12 = 0, $13 = 0, $14 = 0, $15 = 0, $16 = 0, $17 = 0, $18 = 0, $19 = 0, $2 = 0, $20 = 0, $21 = 0, $22 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0;
 var $27 = 0, $28 = 0, $29 = 0, $3 = 0, $30 = 0, $31 = 0, $32 = 0, $33 = 0, $34 = 0, $35 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $add$ptr = 0, $add$ptr31 = 0, $and = 0, $and33 = 0;
 var $buf = 0, $buf_size = 0, $call = 0, $call1 = 0, $call12 = 0, $call2 = 0, $call22 = 0, $call35 = 0, $call43 = 0, $call6 = 0, $close = 0, $cmp = 0, $cmp18 = 0, $cond = 0, $conv = 0, $conv17 = 0, $conv9 = 0, $f = 0, $fd$addr = 0, $fd30 = 0;
 var $flags21 = 0, $lbf = 0, $lbf38 = 0, $lock = 0, $mode$addr = 0, $or = 0, $or28 = 0, $read = 0, $retval = 0, $seek = 0, $tobool = 0, $tobool13 = 0, $tobool23 = 0, $tobool3 = 0, $tobool34 = 0, $tobool36 = 0, $tobool40 = 0, $tobool7 = 0, $vararg_buffer = 0, $vararg_buffer12 = 0;
 var $vararg_buffer3 = 0, $vararg_buffer7 = 0, $vararg_ptr1 = 0, $vararg_ptr10 = 0, $vararg_ptr11 = 0, $vararg_ptr15 = 0, $vararg_ptr16 = 0, $vararg_ptr2 = 0, $vararg_ptr6 = 0, $write = 0, $wsz = 0, dest = 0, label = 0, sp = 0, stop = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 80|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(80|0);
 $vararg_buffer12 = sp + 40|0;
 $vararg_buffer7 = sp + 24|0;
 $vararg_buffer3 = sp + 16|0;
 $vararg_buffer = sp;
 $wsz = sp + 72|0;
 $fd$addr = $fd;
 $mode$addr = $mode;
 $0 = $mode$addr;
 $1 = HEAP8[$0>>0]|0;
 $conv = $1 << 24 >> 24;
 $call = (_strchr(3535,$conv)|0);
 $tobool = ($call|0)!=(0|0);
 if (!($tobool)) {
  $call1 = (___errno_location()|0);
  HEAP32[$call1>>2] = 22;
  $retval = 0;
  $35 = $retval;
  STACKTOP = sp;return ($35|0);
 }
 $call2 = (_malloc(8224)|0);
 $f = $call2;
 $tobool3 = ($call2|0)!=(0|0);
 if (!($tobool3)) {
  $retval = 0;
  $35 = $retval;
  STACKTOP = sp;return ($35|0);
 }
 $2 = $f;
 dest=$2; stop=dest+124|0; do { HEAP32[dest>>2]=0|0; dest=dest+4|0; } while ((dest|0) < (stop|0));
 $3 = $mode$addr;
 $call6 = (_strchr($3,43)|0);
 $tobool7 = ($call6|0)!=(0|0);
 if (!($tobool7)) {
  $4 = $mode$addr;
  $5 = HEAP8[$4>>0]|0;
  $conv9 = $5 << 24 >> 24;
  $cmp = ($conv9|0)==(114);
  $cond = $cmp ? 8 : 4;
  $6 = $f;
  HEAP32[$6>>2] = $cond;
 }
 $7 = $mode$addr;
 $call12 = (_strchr($7,101)|0);
 $tobool13 = ($call12|0)!=(0|0);
 if ($tobool13) {
  $8 = $fd$addr;
  HEAP32[$vararg_buffer>>2] = $8;
  $vararg_ptr1 = ((($vararg_buffer)) + 4|0);
  HEAP32[$vararg_ptr1>>2] = 2;
  $vararg_ptr2 = ((($vararg_buffer)) + 8|0);
  HEAP32[$vararg_ptr2>>2] = 1;
  (___syscall221(221,($vararg_buffer|0))|0);
 }
 $9 = $mode$addr;
 $10 = HEAP8[$9>>0]|0;
 $conv17 = $10 << 24 >> 24;
 $cmp18 = ($conv17|0)==(97);
 if ($cmp18) {
  $11 = $fd$addr;
  HEAP32[$vararg_buffer3>>2] = $11;
  $vararg_ptr6 = ((($vararg_buffer3)) + 4|0);
  HEAP32[$vararg_ptr6>>2] = 3;
  $call22 = (___syscall221(221,($vararg_buffer3|0))|0);
  $flags21 = $call22;
  $12 = $flags21;
  $and = $12 & 1024;
  $tobool23 = ($and|0)!=(0);
  if (!($tobool23)) {
   $13 = $fd$addr;
   $14 = $flags21;
   $or = $14 | 1024;
   HEAP32[$vararg_buffer7>>2] = $13;
   $vararg_ptr10 = ((($vararg_buffer7)) + 4|0);
   HEAP32[$vararg_ptr10>>2] = 4;
   $vararg_ptr11 = ((($vararg_buffer7)) + 8|0);
   HEAP32[$vararg_ptr11>>2] = $or;
   (___syscall221(221,($vararg_buffer7|0))|0);
  }
  $15 = $f;
  $16 = HEAP32[$15>>2]|0;
  $or28 = $16 | 128;
  HEAP32[$15>>2] = $or28;
 }
 $17 = $fd$addr;
 $18 = $f;
 $fd30 = ((($18)) + 60|0);
 HEAP32[$fd30>>2] = $17;
 $19 = $f;
 $add$ptr = ((($19)) + 124|0);
 $add$ptr31 = ((($add$ptr)) + 8|0);
 $20 = $f;
 $buf = ((($20)) + 44|0);
 HEAP32[$buf>>2] = $add$ptr31;
 $21 = $f;
 $buf_size = ((($21)) + 48|0);
 HEAP32[$buf_size>>2] = 8092;
 $22 = $f;
 $lbf = ((($22)) + 75|0);
 HEAP8[$lbf>>0] = -1;
 $23 = $f;
 $24 = HEAP32[$23>>2]|0;
 $and33 = $24 & 8;
 $tobool34 = ($and33|0)!=(0);
 if (!($tobool34)) {
  $25 = $fd$addr;
  $26 = $wsz;
  HEAP32[$vararg_buffer12>>2] = $25;
  $vararg_ptr15 = ((($vararg_buffer12)) + 4|0);
  HEAP32[$vararg_ptr15>>2] = 21523;
  $vararg_ptr16 = ((($vararg_buffer12)) + 8|0);
  HEAP32[$vararg_ptr16>>2] = $26;
  $call35 = (___syscall54(54,($vararg_buffer12|0))|0);
  $tobool36 = ($call35|0)!=(0);
  if (!($tobool36)) {
   $27 = $f;
   $lbf38 = ((($27)) + 75|0);
   HEAP8[$lbf38>>0] = 10;
  }
 }
 $28 = $f;
 $read = ((($28)) + 32|0);
 HEAP32[$read>>2] = 6;
 $29 = $f;
 $write = ((($29)) + 36|0);
 HEAP32[$write>>2] = 2;
 $30 = $f;
 $seek = ((($30)) + 40|0);
 HEAP32[$seek>>2] = 3;
 $31 = $f;
 $close = ((($31)) + 12|0);
 HEAP32[$close>>2] = 1;
 $32 = HEAP32[(4580)>>2]|0;
 $tobool40 = ($32|0)!=(0);
 if (!($tobool40)) {
  $33 = $f;
  $lock = ((($33)) + 76|0);
  HEAP32[$lock>>2] = -1;
 }
 $34 = $f;
 $call43 = (___ofl_add($34)|0);
 $retval = $call43;
 $35 = $retval;
 STACKTOP = sp;return ($35|0);
}
function ___ofl_add($f) {
 $f = $f|0;
 var $0 = 0, $1 = 0, $10 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $6 = 0, $7 = 0, $8 = 0, $9 = 0, $call = 0, $f$addr = 0, $head = 0, $next = 0, $prev = 0, $tobool = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(16|0);
 $f$addr = $f;
 $call = (___ofl_lock()|0);
 $head = $call;
 $0 = $head;
 $1 = HEAP32[$0>>2]|0;
 $2 = $f$addr;
 $next = ((($2)) + 56|0);
 HEAP32[$next>>2] = $1;
 $3 = $head;
 $4 = HEAP32[$3>>2]|0;
 $tobool = ($4|0)!=(0|0);
 if ($tobool) {
  $5 = $f$addr;
  $6 = $head;
  $7 = HEAP32[$6>>2]|0;
  $prev = ((($7)) + 52|0);
  HEAP32[$prev>>2] = $5;
 }
 $8 = $f$addr;
 $9 = $head;
 HEAP32[$9>>2] = $8;
 ___ofl_unlock();
 $10 = $f$addr;
 STACKTOP = sp;return ($10|0);
}
function ___ofl_lock() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 ___lock((4884|0));
 return (4892|0);
}
function ___ofl_unlock() {
 var label = 0, sp = 0;
 sp = STACKTOP;
 ___unlock((4884|0));
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
 $8 = HEAP32[66]|0;
 $tobool5 = ($8|0)!=(0|0);
 if ($tobool5) {
  $9 = HEAP32[66]|0;
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
function _fprintf($f,$fmt,$varargs) {
 $f = $f|0;
 $fmt = $fmt|0;
 $varargs = $varargs|0;
 var $0 = 0, $1 = 0, $2 = 0, $ap = 0, $call = 0, $f$addr = 0, $fmt$addr = 0, $ret = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 32|0; if ((STACKTOP|0) >= (STACK_MAX|0)) abortStackOverflow(32|0);
 $ap = sp;
 $f$addr = $f;
 $fmt$addr = $fmt;
 HEAP32[$ap>>2] = $varargs;
 $0 = $f$addr;
 $1 = $fmt$addr;
 $call = (_vfprintf($0,$1,$ap)|0);
 $ret = $call;
 $2 = $ret;
 STACKTOP = sp;return ($2|0);
}
function runPostSets() {
}
function _i64Subtract(a, b, c, d) {
    a = a|0; b = b|0; c = c|0; d = d|0;
    var l = 0, h = 0;
    l = (a - c)>>>0;
    h = (b - d)>>>0;
    h = (b - d - (((c>>>0) > (a>>>0))|0))>>>0; // Borrow one from high word to low word on underflow.
    return ((tempRet0 = h,l|0)|0);
}
function _i64Add(a, b, c, d) {
    /*
      x = a + b*2^32
      y = c + d*2^32
      result = l + h*2^32
    */
    a = a|0; b = b|0; c = c|0; d = d|0;
    var l = 0, h = 0;
    l = (a + c)>>>0;
    h = (b + d + (((l>>>0) < (a>>>0))|0))>>>0; // Add carry from low word to high word on overflow.
    return ((tempRet0 = h,l|0)|0);
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
function _bitshift64Lshr(low, high, bits) {
    low = low|0; high = high|0; bits = bits|0;
    var ander = 0;
    if ((bits|0) < 32) {
      ander = ((1 << bits) - 1)|0;
      tempRet0 = high >>> bits;
      return (low >>> bits) | ((high&ander) << (32 - bits));
    }
    tempRet0 = 0;
    return (high >>> (bits - 32))|0;
}
function _bitshift64Shl(low, high, bits) {
    low = low|0; high = high|0; bits = bits|0;
    var ander = 0;
    if ((bits|0) < 32) {
      ander = ((1 << bits) - 1)|0;
      tempRet0 = (high << bits) | ((low&(ander << (32 - bits))) >>> (32 - bits));
      return low << bits;
    }
    tempRet0 = low << (bits - 32);
    return 0;
}
function _llvm_cttz_i32(x) {
    x = x|0;
    var ret = 0;
    ret = ((HEAP8[(((cttz_i8)+(x & 0xff))>>0)])|0);
    if ((ret|0) < 8) return ret|0;
    ret = ((HEAP8[(((cttz_i8)+((x >> 8)&0xff))>>0)])|0);
    if ((ret|0) < 8) return (ret + 8)|0;
    ret = ((HEAP8[(((cttz_i8)+((x >> 16)&0xff))>>0)])|0);
    if ((ret|0) < 8) return (ret + 16)|0;
    return (((HEAP8[(((cttz_i8)+(x >>> 24))>>0)])|0) + 24)|0;
}
function ___udivmoddi4($a$0, $a$1, $b$0, $b$1, $rem) {
    $a$0 = $a$0 | 0;
    $a$1 = $a$1 | 0;
    $b$0 = $b$0 | 0;
    $b$1 = $b$1 | 0;
    $rem = $rem | 0;
    var $n_sroa_0_0_extract_trunc = 0, $n_sroa_1_4_extract_shift$0 = 0, $n_sroa_1_4_extract_trunc = 0, $d_sroa_0_0_extract_trunc = 0, $d_sroa_1_4_extract_shift$0 = 0, $d_sroa_1_4_extract_trunc = 0, $4 = 0, $17 = 0, $37 = 0, $49 = 0, $51 = 0, $57 = 0, $58 = 0, $66 = 0, $78 = 0, $86 = 0, $88 = 0, $89 = 0, $91 = 0, $92 = 0, $95 = 0, $105 = 0, $117 = 0, $119 = 0, $125 = 0, $126 = 0, $130 = 0, $q_sroa_1_1_ph = 0, $q_sroa_0_1_ph = 0, $r_sroa_1_1_ph = 0, $r_sroa_0_1_ph = 0, $sr_1_ph = 0, $d_sroa_0_0_insert_insert99$0 = 0, $d_sroa_0_0_insert_insert99$1 = 0, $137$0 = 0, $137$1 = 0, $carry_0203 = 0, $sr_1202 = 0, $r_sroa_0_1201 = 0, $r_sroa_1_1200 = 0, $q_sroa_0_1199 = 0, $q_sroa_1_1198 = 0, $147 = 0, $149 = 0, $r_sroa_0_0_insert_insert42$0 = 0, $r_sroa_0_0_insert_insert42$1 = 0, $150$1 = 0, $151$0 = 0, $152 = 0, $154$0 = 0, $r_sroa_0_0_extract_trunc = 0, $r_sroa_1_4_extract_trunc = 0, $155 = 0, $carry_0_lcssa$0 = 0, $carry_0_lcssa$1 = 0, $r_sroa_0_1_lcssa = 0, $r_sroa_1_1_lcssa = 0, $q_sroa_0_1_lcssa = 0, $q_sroa_1_1_lcssa = 0, $q_sroa_0_0_insert_ext75$0 = 0, $q_sroa_0_0_insert_ext75$1 = 0, $q_sroa_0_0_insert_insert77$1 = 0, $_0$0 = 0, $_0$1 = 0;
    $n_sroa_0_0_extract_trunc = $a$0;
    $n_sroa_1_4_extract_shift$0 = $a$1;
    $n_sroa_1_4_extract_trunc = $n_sroa_1_4_extract_shift$0;
    $d_sroa_0_0_extract_trunc = $b$0;
    $d_sroa_1_4_extract_shift$0 = $b$1;
    $d_sroa_1_4_extract_trunc = $d_sroa_1_4_extract_shift$0;
    if (($n_sroa_1_4_extract_trunc | 0) == 0) {
      $4 = ($rem | 0) != 0;
      if (($d_sroa_1_4_extract_trunc | 0) == 0) {
        if ($4) {
          HEAP32[$rem >> 2] = ($n_sroa_0_0_extract_trunc >>> 0) % ($d_sroa_0_0_extract_trunc >>> 0);
          HEAP32[$rem + 4 >> 2] = 0;
        }
        $_0$1 = 0;
        $_0$0 = ($n_sroa_0_0_extract_trunc >>> 0) / ($d_sroa_0_0_extract_trunc >>> 0) >>> 0;
        return (tempRet0 = $_0$1, $_0$0) | 0;
      } else {
        if (!$4) {
          $_0$1 = 0;
          $_0$0 = 0;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
        HEAP32[$rem >> 2] = $a$0 & -1;
        HEAP32[$rem + 4 >> 2] = $a$1 & 0;
        $_0$1 = 0;
        $_0$0 = 0;
        return (tempRet0 = $_0$1, $_0$0) | 0;
      }
    }
    $17 = ($d_sroa_1_4_extract_trunc | 0) == 0;
    do {
      if (($d_sroa_0_0_extract_trunc | 0) == 0) {
        if ($17) {
          if (($rem | 0) != 0) {
            HEAP32[$rem >> 2] = ($n_sroa_1_4_extract_trunc >>> 0) % ($d_sroa_0_0_extract_trunc >>> 0);
            HEAP32[$rem + 4 >> 2] = 0;
          }
          $_0$1 = 0;
          $_0$0 = ($n_sroa_1_4_extract_trunc >>> 0) / ($d_sroa_0_0_extract_trunc >>> 0) >>> 0;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
        if (($n_sroa_0_0_extract_trunc | 0) == 0) {
          if (($rem | 0) != 0) {
            HEAP32[$rem >> 2] = 0;
            HEAP32[$rem + 4 >> 2] = ($n_sroa_1_4_extract_trunc >>> 0) % ($d_sroa_1_4_extract_trunc >>> 0);
          }
          $_0$1 = 0;
          $_0$0 = ($n_sroa_1_4_extract_trunc >>> 0) / ($d_sroa_1_4_extract_trunc >>> 0) >>> 0;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
        $37 = $d_sroa_1_4_extract_trunc - 1 | 0;
        if (($37 & $d_sroa_1_4_extract_trunc | 0) == 0) {
          if (($rem | 0) != 0) {
            HEAP32[$rem >> 2] = 0 | $a$0 & -1;
            HEAP32[$rem + 4 >> 2] = $37 & $n_sroa_1_4_extract_trunc | $a$1 & 0;
          }
          $_0$1 = 0;
          $_0$0 = $n_sroa_1_4_extract_trunc >>> ((_llvm_cttz_i32($d_sroa_1_4_extract_trunc | 0) | 0) >>> 0);
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
        $49 = Math_clz32($d_sroa_1_4_extract_trunc | 0) | 0;
        $51 = $49 - (Math_clz32($n_sroa_1_4_extract_trunc | 0) | 0) | 0;
        if ($51 >>> 0 <= 30) {
          $57 = $51 + 1 | 0;
          $58 = 31 - $51 | 0;
          $sr_1_ph = $57;
          $r_sroa_0_1_ph = $n_sroa_1_4_extract_trunc << $58 | $n_sroa_0_0_extract_trunc >>> ($57 >>> 0);
          $r_sroa_1_1_ph = $n_sroa_1_4_extract_trunc >>> ($57 >>> 0);
          $q_sroa_0_1_ph = 0;
          $q_sroa_1_1_ph = $n_sroa_0_0_extract_trunc << $58;
          break;
        }
        if (($rem | 0) == 0) {
          $_0$1 = 0;
          $_0$0 = 0;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
        HEAP32[$rem >> 2] = 0 | $a$0 & -1;
        HEAP32[$rem + 4 >> 2] = $n_sroa_1_4_extract_shift$0 | $a$1 & 0;
        $_0$1 = 0;
        $_0$0 = 0;
        return (tempRet0 = $_0$1, $_0$0) | 0;
      } else {
        if (!$17) {
          $117 = Math_clz32($d_sroa_1_4_extract_trunc | 0) | 0;
          $119 = $117 - (Math_clz32($n_sroa_1_4_extract_trunc | 0) | 0) | 0;
          if ($119 >>> 0 <= 31) {
            $125 = $119 + 1 | 0;
            $126 = 31 - $119 | 0;
            $130 = $119 - 31 >> 31;
            $sr_1_ph = $125;
            $r_sroa_0_1_ph = $n_sroa_0_0_extract_trunc >>> ($125 >>> 0) & $130 | $n_sroa_1_4_extract_trunc << $126;
            $r_sroa_1_1_ph = $n_sroa_1_4_extract_trunc >>> ($125 >>> 0) & $130;
            $q_sroa_0_1_ph = 0;
            $q_sroa_1_1_ph = $n_sroa_0_0_extract_trunc << $126;
            break;
          }
          if (($rem | 0) == 0) {
            $_0$1 = 0;
            $_0$0 = 0;
            return (tempRet0 = $_0$1, $_0$0) | 0;
          }
          HEAP32[$rem >> 2] = 0 | $a$0 & -1;
          HEAP32[$rem + 4 >> 2] = $n_sroa_1_4_extract_shift$0 | $a$1 & 0;
          $_0$1 = 0;
          $_0$0 = 0;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
        $66 = $d_sroa_0_0_extract_trunc - 1 | 0;
        if (($66 & $d_sroa_0_0_extract_trunc | 0) != 0) {
          $86 = (Math_clz32($d_sroa_0_0_extract_trunc | 0) | 0) + 33 | 0;
          $88 = $86 - (Math_clz32($n_sroa_1_4_extract_trunc | 0) | 0) | 0;
          $89 = 64 - $88 | 0;
          $91 = 32 - $88 | 0;
          $92 = $91 >> 31;
          $95 = $88 - 32 | 0;
          $105 = $95 >> 31;
          $sr_1_ph = $88;
          $r_sroa_0_1_ph = $91 - 1 >> 31 & $n_sroa_1_4_extract_trunc >>> ($95 >>> 0) | ($n_sroa_1_4_extract_trunc << $91 | $n_sroa_0_0_extract_trunc >>> ($88 >>> 0)) & $105;
          $r_sroa_1_1_ph = $105 & $n_sroa_1_4_extract_trunc >>> ($88 >>> 0);
          $q_sroa_0_1_ph = $n_sroa_0_0_extract_trunc << $89 & $92;
          $q_sroa_1_1_ph = ($n_sroa_1_4_extract_trunc << $89 | $n_sroa_0_0_extract_trunc >>> ($95 >>> 0)) & $92 | $n_sroa_0_0_extract_trunc << $91 & $88 - 33 >> 31;
          break;
        }
        if (($rem | 0) != 0) {
          HEAP32[$rem >> 2] = $66 & $n_sroa_0_0_extract_trunc;
          HEAP32[$rem + 4 >> 2] = 0;
        }
        if (($d_sroa_0_0_extract_trunc | 0) == 1) {
          $_0$1 = $n_sroa_1_4_extract_shift$0 | $a$1 & 0;
          $_0$0 = 0 | $a$0 & -1;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        } else {
          $78 = _llvm_cttz_i32($d_sroa_0_0_extract_trunc | 0) | 0;
          $_0$1 = 0 | $n_sroa_1_4_extract_trunc >>> ($78 >>> 0);
          $_0$0 = $n_sroa_1_4_extract_trunc << 32 - $78 | $n_sroa_0_0_extract_trunc >>> ($78 >>> 0) | 0;
          return (tempRet0 = $_0$1, $_0$0) | 0;
        }
      }
    } while (0);
    if (($sr_1_ph | 0) == 0) {
      $q_sroa_1_1_lcssa = $q_sroa_1_1_ph;
      $q_sroa_0_1_lcssa = $q_sroa_0_1_ph;
      $r_sroa_1_1_lcssa = $r_sroa_1_1_ph;
      $r_sroa_0_1_lcssa = $r_sroa_0_1_ph;
      $carry_0_lcssa$1 = 0;
      $carry_0_lcssa$0 = 0;
    } else {
      $d_sroa_0_0_insert_insert99$0 = 0 | $b$0 & -1;
      $d_sroa_0_0_insert_insert99$1 = $d_sroa_1_4_extract_shift$0 | $b$1 & 0;
      $137$0 = _i64Add($d_sroa_0_0_insert_insert99$0 | 0, $d_sroa_0_0_insert_insert99$1 | 0, -1, -1) | 0;
      $137$1 = tempRet0;
      $q_sroa_1_1198 = $q_sroa_1_1_ph;
      $q_sroa_0_1199 = $q_sroa_0_1_ph;
      $r_sroa_1_1200 = $r_sroa_1_1_ph;
      $r_sroa_0_1201 = $r_sroa_0_1_ph;
      $sr_1202 = $sr_1_ph;
      $carry_0203 = 0;
      while (1) {
        $147 = $q_sroa_0_1199 >>> 31 | $q_sroa_1_1198 << 1;
        $149 = $carry_0203 | $q_sroa_0_1199 << 1;
        $r_sroa_0_0_insert_insert42$0 = 0 | ($r_sroa_0_1201 << 1 | $q_sroa_1_1198 >>> 31);
        $r_sroa_0_0_insert_insert42$1 = $r_sroa_0_1201 >>> 31 | $r_sroa_1_1200 << 1 | 0;
        _i64Subtract($137$0 | 0, $137$1 | 0, $r_sroa_0_0_insert_insert42$0 | 0, $r_sroa_0_0_insert_insert42$1 | 0) | 0;
        $150$1 = tempRet0;
        $151$0 = $150$1 >> 31 | (($150$1 | 0) < 0 ? -1 : 0) << 1;
        $152 = $151$0 & 1;
        $154$0 = _i64Subtract($r_sroa_0_0_insert_insert42$0 | 0, $r_sroa_0_0_insert_insert42$1 | 0, $151$0 & $d_sroa_0_0_insert_insert99$0 | 0, ((($150$1 | 0) < 0 ? -1 : 0) >> 31 | (($150$1 | 0) < 0 ? -1 : 0) << 1) & $d_sroa_0_0_insert_insert99$1 | 0) | 0;
        $r_sroa_0_0_extract_trunc = $154$0;
        $r_sroa_1_4_extract_trunc = tempRet0;
        $155 = $sr_1202 - 1 | 0;
        if (($155 | 0) == 0) {
          break;
        } else {
          $q_sroa_1_1198 = $147;
          $q_sroa_0_1199 = $149;
          $r_sroa_1_1200 = $r_sroa_1_4_extract_trunc;
          $r_sroa_0_1201 = $r_sroa_0_0_extract_trunc;
          $sr_1202 = $155;
          $carry_0203 = $152;
        }
      }
      $q_sroa_1_1_lcssa = $147;
      $q_sroa_0_1_lcssa = $149;
      $r_sroa_1_1_lcssa = $r_sroa_1_4_extract_trunc;
      $r_sroa_0_1_lcssa = $r_sroa_0_0_extract_trunc;
      $carry_0_lcssa$1 = 0;
      $carry_0_lcssa$0 = $152;
    }
    $q_sroa_0_0_insert_ext75$0 = $q_sroa_0_1_lcssa;
    $q_sroa_0_0_insert_ext75$1 = 0;
    $q_sroa_0_0_insert_insert77$1 = $q_sroa_1_1_lcssa | $q_sroa_0_0_insert_ext75$1;
    if (($rem | 0) != 0) {
      HEAP32[$rem >> 2] = 0 | $r_sroa_0_1_lcssa;
      HEAP32[$rem + 4 >> 2] = $r_sroa_1_1_lcssa | 0;
    }
    $_0$1 = (0 | $q_sroa_0_0_insert_ext75$0) >>> 31 | $q_sroa_0_0_insert_insert77$1 << 1 | ($q_sroa_0_0_insert_ext75$1 << 1 | $q_sroa_0_0_insert_ext75$0 >>> 31) & 0 | $carry_0_lcssa$1;
    $_0$0 = ($q_sroa_0_0_insert_ext75$0 << 1 | 0 >>> 31) & -2 | $carry_0_lcssa$0;
    return (tempRet0 = $_0$1, $_0$0) | 0;
}
function ___udivdi3($a$0, $a$1, $b$0, $b$1) {
    $a$0 = $a$0 | 0;
    $a$1 = $a$1 | 0;
    $b$0 = $b$0 | 0;
    $b$1 = $b$1 | 0;
    var $1$0 = 0;
    $1$0 = ___udivmoddi4($a$0, $a$1, $b$0, $b$1, 0) | 0;
    return $1$0 | 0;
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
function ___uremdi3($a$0, $a$1, $b$0, $b$1) {
    $a$0 = $a$0 | 0;
    $a$1 = $a$1 | 0;
    $b$0 = $b$0 | 0;
    $b$1 = $b$1 | 0;
    var $rem = 0, __stackBase__ = 0;
    __stackBase__ = STACKTOP;
    STACKTOP = STACKTOP + 16 | 0;
    $rem = __stackBase__ | 0;
    ___udivmoddi4($a$0, $a$1, $b$0, $b$1, $rem) | 0;
    STACKTOP = __stackBase__;
    return (tempRet0 = HEAP32[$rem + 4 >> 2] | 0, HEAP32[$rem >> 2] | 0) | 0;
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
var FUNCTION_TABLE_iiii = [b1,b1,___stdio_write,___stdio_seek,___stdout_write,_sn_write,___stdio_read,b1];

  return { _main: _main, ___emscripten_pthread_data_constructor: ___emscripten_pthread_data_constructor, _i64Subtract: _i64Subtract, ___udivdi3: ___udivdi3, setThrew: setThrew, _bitshift64Lshr: _bitshift64Lshr, _bitshift64Shl: _bitshift64Shl, _fflush: _fflush, ___errno_location: ___errno_location, _memset: _memset, _sbrk: _sbrk, _memcpy: _memcpy, stackAlloc: stackAlloc, ___uremdi3: ___uremdi3, getTempRet0: getTempRet0, setTempRet0: setTempRet0, _i64Add: _i64Add, dynCall_iiii: dynCall_iiii, _emscripten_get_global_libc: _emscripten_get_global_libc, dynCall_ii: dynCall_ii, stackSave: stackSave, _free: _free, runPostSets: runPostSets, establishStackSpace: establishStackSpace, stackRestore: stackRestore, _malloc: _malloc };
})
// EMSCRIPTEN_END_ASM

if (!ENVIRONMENT_IS_BROWSIX) {
  asm = asmModule(Module.asmGlobalArg, Module.asmLibraryArg, buffer);
}
function initReceiving () {
var real__main = asm["_main"]; asm["_main"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__main.apply(null, arguments);
};

var real____emscripten_pthread_data_constructor = asm["___emscripten_pthread_data_constructor"]; asm["___emscripten_pthread_data_constructor"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real____emscripten_pthread_data_constructor.apply(null, arguments);
};

var real_getTempRet0 = asm["getTempRet0"]; asm["getTempRet0"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_getTempRet0.apply(null, arguments);
};

var real____udivdi3 = asm["___udivdi3"]; asm["___udivdi3"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real____udivdi3.apply(null, arguments);
};

var real_setThrew = asm["setThrew"]; asm["setThrew"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_setThrew.apply(null, arguments);
};

var real__bitshift64Lshr = asm["_bitshift64Lshr"]; asm["_bitshift64Lshr"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__bitshift64Lshr.apply(null, arguments);
};

var real__bitshift64Shl = asm["_bitshift64Shl"]; asm["_bitshift64Shl"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__bitshift64Shl.apply(null, arguments);
};

var real__fflush = asm["_fflush"]; asm["_fflush"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__fflush.apply(null, arguments);
};

var real____errno_location = asm["___errno_location"]; asm["___errno_location"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real____errno_location.apply(null, arguments);
};

var real__sbrk = asm["_sbrk"]; asm["_sbrk"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__sbrk.apply(null, arguments);
};

var real_stackAlloc = asm["stackAlloc"]; asm["stackAlloc"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_stackAlloc.apply(null, arguments);
};

var real____uremdi3 = asm["___uremdi3"]; asm["___uremdi3"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real____uremdi3.apply(null, arguments);
};

var real__i64Subtract = asm["_i64Subtract"]; asm["_i64Subtract"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__i64Subtract.apply(null, arguments);
};

var real_setTempRet0 = asm["setTempRet0"]; asm["setTempRet0"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_setTempRet0.apply(null, arguments);
};

var real__i64Add = asm["_i64Add"]; asm["_i64Add"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__i64Add.apply(null, arguments);
};

var real__emscripten_get_global_libc = asm["_emscripten_get_global_libc"]; asm["_emscripten_get_global_libc"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__emscripten_get_global_libc.apply(null, arguments);
};

var real_stackSave = asm["stackSave"]; asm["stackSave"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_stackSave.apply(null, arguments);
};

var real__free = asm["_free"]; asm["_free"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__free.apply(null, arguments);
};

var real_establishStackSpace = asm["establishStackSpace"]; asm["establishStackSpace"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_establishStackSpace.apply(null, arguments);
};

var real_stackRestore = asm["stackRestore"]; asm["stackRestore"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real_stackRestore.apply(null, arguments);
};

var real__malloc = asm["_malloc"]; asm["_malloc"] = function() {
  assert(runtimeInitialized, 'you need to wait for the runtime to be ready (e.g. wait for main() to be called)');
  assert(!runtimeExited, 'the runtime was exited (use NO_EXIT_RUNTIME to keep it alive after main() exits)');
  return real__malloc.apply(null, arguments);
};
_main = Module["_main"] = asm["_main"];
___emscripten_pthread_data_constructor = Module["___emscripten_pthread_data_constructor"] = asm["___emscripten_pthread_data_constructor"];
getTempRet0 = Module["getTempRet0"] = asm["getTempRet0"];
___udivdi3 = Module["___udivdi3"] = asm["___udivdi3"];
setThrew = Module["setThrew"] = asm["setThrew"];
_bitshift64Lshr = Module["_bitshift64Lshr"] = asm["_bitshift64Lshr"];
_bitshift64Shl = Module["_bitshift64Shl"] = asm["_bitshift64Shl"];
_fflush = Module["_fflush"] = asm["_fflush"];
___errno_location = Module["___errno_location"] = asm["___errno_location"];
_memset = Module["_memset"] = asm["_memset"];
_sbrk = Module["_sbrk"] = asm["_sbrk"];
_memcpy = Module["_memcpy"] = asm["_memcpy"];
stackAlloc = Module["stackAlloc"] = asm["stackAlloc"];
___uremdi3 = Module["___uremdi3"] = asm["___uremdi3"];
_i64Subtract = Module["_i64Subtract"] = asm["_i64Subtract"];
setTempRet0 = Module["setTempRet0"] = asm["setTempRet0"];
_i64Add = Module["_i64Add"] = asm["_i64Add"];
_emscripten_get_global_libc = Module["_emscripten_get_global_libc"] = asm["_emscripten_get_global_libc"];
stackSave = Module["stackSave"] = asm["stackSave"];
_free = Module["_free"] = asm["_free"];
runPostSets = Module["runPostSets"] = asm["runPostSets"];
establishStackSpace = Module["establishStackSpace"] = asm["establishStackSpace"];
stackRestore = Module["stackRestore"] = asm["stackRestore"];
_malloc = Module["_malloc"] = asm["_malloc"];
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



