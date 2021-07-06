/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const { scale } = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n\nconst RADIUS = 5;\nconst COLOR = '#808080';\n\n\nconst Asteroid = function(options){\n    \n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = RADIUS;\n    this.color = COLOR;\n}\nUtil.inherits(Asteroid, MovingObject);\n//WHAT IS LENGTH? AND WHY?\nconst vec = Util.randomVec(10);\nscale(vec, 5);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst { randomVec } = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nconst Game = function(){\n    this.DIM_X = 600; \n    this.DIM_Y = 600;\n    this.NUM_ASTEROIDS = 10;\n    this.asteroids = [];\n}\n\nGame.prototype.addAsteroids = function(){\n    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        let asteroid  = new Asteroid({pos: this.randomPosition, vec: Util.randomVec(10)});\n        this.asteroids.push(asteroid);\n    }\n};\n\nGame.prototype.randomPosition = function(){\n    \n    const x =  Math.floor(Math.random() * 600);\n    const y = Math.floor(Math.random() * 600);\n    return [x,y];\n}\n\nGame.prototype.draw = function(ctx){\n    ctx.clearRect(0,0,600,600);\n\n    for (let i = 0; i < this.asteroids.length; i++) {\n        let asteroid = this.asteroids[i];\n        asteroid.draw(ctx);\n    }\n}\n\n\nGame.prototype.moveObjects = function() {\n\n    for (let i = 0; i < this.asteroids.length; i++) {\n\n        this.asteroids[i].move();\n    }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\r\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\n\r\n\r\nwindow.MovingObject = MovingObject;\r\n\r\nwindow.addEventListener('DOMContentLoaded', (event) => {\r\n    console.log('testing');\r\n    const c = document.getElementById('game-canvas');\r\n    const ctx = c.getContext('2d');\r\n\r\n    const g = new Game();\r\n    g.addAsteroids();\r\n    g.draw(ctx);\r\n    g.moveObjects();\r\n    \r\n\r\n})\r\nconsole.log(\"Hello\");\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("const MovingObject = function (options) {\r\n    this.pos = options.pos;\r\n    this.vel = options.vel;\r\n    this.radius = options.radius;\r\n    this.color = options.color;\r\n}\r\n// const MovingObject = function (pos,vel,radius,color) {\r\n//     this.pos = pos;\r\n//     this.vel = vel;\r\n//     this.radius = radius;\r\n//     this.color = color;\r\n// }\r\n\r\nMovingObject.prototype.draw = function(ctx) {\r\n    ctx.fillStyle = this.color;\r\n    ctx.beginPath();\r\n    ctx.arc(\r\n        this.pos[0],\r\n        this.pos[1], \r\n        this.radius,\r\n        0,\r\n        2* Math.PI,\r\n        false\r\n    );\r\n    ctx.fill();\r\n}\r\n\r\nMovingObject.prototype.move = function() {\r\n    this.pos[0] += this.vel[0];\r\n    this.pos[1] += this.vel[1];\r\n}\r\n\r\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\r\n    inherits(childClass, parentClass) {\r\n      const Surrogate = function() {};\r\n      Surrogate.prototype = parentClass.prototype;\r\n      childClass.prototype = new Surrogate();\r\n      childClass.prototype.constructor = childClass;\r\n    },\r\n\r\n    randomVec(length) {\r\n      const deg = 2 * Math.PI * Math.random();\r\n      return Util.scale([Math.sin(deg), Math.cos(deg)], length);\r\n    },\r\n      \r\n    // Scale the length of a vector by the given amount.\r\n    scale(vec, m) {\r\n    return [vec[0] * m, vec[1] * m];\r\n    //[5,6]\r\n  }\r\n};\r\n\r\n  module.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;