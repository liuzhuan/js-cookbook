var _ = require('underscore');

var list = [[0, 1], [2, 3], [4, 5]];
var flat = _.reduceRight(list, function(a, b){
    return a.concat(b);
}, []);
console.log(flat);