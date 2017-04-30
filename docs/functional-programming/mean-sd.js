var sum = function(x, y) { return x + y; }
var square = function(x) { return x * x; }

var data = [1, 1, 3, 5, 5];
var mean = data.reduce(sum)/data.length;
var deviations = data.map(function(x){ return x - mean });
var stddev = Math.sqrt(deviations.map(square).reduce(sum)/(data.length-1));

console.log(`mean: ${mean}, stddev: ${stddev}`);