//const _ = require('lodash');
//
//function sayHello() {
//  console.log(calculate(12));
//}
//
//_.times(5, sayHello);

function calculate(num) {
  return num / 3 - 2;
}

var Mocha = require('mocha');
var assert = require('assert');
var mocha = new Mocha();

// Bit of a hack, sorry!
mocha.suite.emit('pre-require', this, 'solution', mocha);

describe('Test suite', function() {
  it('should calculate', function() {
    assert.equal(calculate(12), 2);
  })
})

mocha.run();

