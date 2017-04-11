'use strict';

/**
 * from https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain
 * Square.js
 */

class Polygon {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }
}

class Square extends Polygon {
    constructor(sideLength) {
        super(sideLength, sideLength);
    }

    get area() {
        return this.height * this.width;
    }

    set sideLength(newLength) {
        this.height = newLength;
        this.width = newLength;
    }
}

var square = new Square(2);
console.log(`area: ${square.area}`);
square.sideLength = 4;
console.log(`area: ${square.area}`);