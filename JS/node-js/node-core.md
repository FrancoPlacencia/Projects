# Node Js
A `runtime environment` for executing JavaScript code outside of the browser.

Node its use to build back-end services.

**API**
- **A**plication 
- **P**rogramming 
- **I**nterfaces

Node its ideal for Highly-scalabe, data-intensive and real-time apps.

## Pros
- Great for prototyping and agile development
- Superfast and highly scalable
- Based on Javascript
- Cleaner and more consisten codebase 
- Large ecosystem of open-source libs
- Ideal for I/O-intensive apps

## Cons
- Its NOT a programming language
- Its NOT a framework
- Its NOT recommended for CPU-intensive apps

## Architecture
Node its a javascript runtime-environment, outside of the browser.

The usual browser have their own JSRE:
- Edge (Chakra)
- Firefox (SpiderMonkey)
- Chrome (v8)

Node its a v8 JSRE inside a C++ program.

## Node Core

### Global Object

The global object its not as in a browser. In the browser the global object its `window` that its prefferd of the global function used.

```js
console.log();

setTimeout()
clearTimeout()

setInterval()
clearInterval()
```
This functions are part of window global object, but needs to be specified to use the `global` object.
```js
// global function
console.log()

// console.log its a function of the windows object
window.console.log('Hello World');
// > window is not defined

// different from the browser there its not window global object

global.console.log('Hello World');
// > Hello World
```

The scope of the variables declare on node are not global.
```js
var message = 'Francisco';
console.log('Hello ' + global.message);
// > Hello undefined

console.log('Hello ' + message);
// > Hello Francisco
```
### Module Scope
Since the function declared are linked to the global scope, it can be occur that one function already exist on the global scope.

That its why the need of the `Module Scope`, similar to private variables and functions.

#### Main Module
The main module its referred on the `app.js`. All other modules are referred on each file that its NOT the app.js.

```js
// app.js
console.log(module);

/*
Module {
  id: '.',
  exports: {},
  loaded: false,
  children: [],
}
*/
```

To create a new module, create a new file and export the information to the main module using `require`

```js
// app.js
// -----------------------------------------------
require('./another.js');
// it can ommit the .js
require('./another');
// parent folder
require('../another');
// sub folder
require('../sub-folder/another');
// to make a reference we need to assign it to a variable
var anotherModule = require('./another');

anotherModule.processFunctionURL()

// another.js
// -----------------------------------------------
var url = "webpage.url";

function processURL() {
    console.log(url);
}

module.exports.processFunctionURL = processURL;
module.exports.processURL = url;
```

Since the variables on JS can be overwritten its recommend that when the modules are declared as `const`.

```js
var anotherModule = require('./another');

var anotherModule = "breaking";
anotherModule.processFunctionURL()
// > anotherModule.processFunctionURL is not a function

// -----------------------------------------------
const anotherModule = require('./another');

var anotherModule = "breaking";
// > Identifier 'anotherModule' has already been declared
anotherModule.processFunctionURL()

// -----------------------------------------------
const anotherModule = require('./another');

anotherModule = "breaking";
// > Assignment to constant variable.
anotherModule.processFunctionURL()
```

The module can be an object or only a funtion.
```js
// app.js
// -----------------------------------------------
const anotherModule = require('./another');

anotherModule();

// another.js
// -----------------------------------------------
var url = "webpage.url";

function processURL() {
    console.log(url);
}

module.exports = processURL;
```

#### Module Wrapper Module
Node will generate a `Module Wrapper Function` per each module. So each module have his own exports, require, module and its directories.
```js
(function(
    exports,
    require,
    module,
    __filename,
    __dirname)) {
    // block of code

})
```