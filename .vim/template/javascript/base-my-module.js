(function(global) {
"use strict";

// --- define ----------------------------------------------
// platform detection
var _BROWSER = !!global.self;
var _WORKER  = !!global.WorkerLocation;
var _NODE_JS = !!global.process;
{{_cursor_}}

// --- variable --------------------------------------------

// --- interface -------------------------------------------
function {{_name_}}() {}

// --- implement -------------------------------------------

if (_NODE_JS) {
} else if (_WORKER) {
} else if (_BROWSER) {
}

// --- export ----------------------------------------------
if (_NODE_JS) {
    module.exports = {{_name_}};
}
global.{{_name_}} = {{_name_}};

})(this.self || global);
