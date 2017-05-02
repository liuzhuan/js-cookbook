'use strict';

let myFirstPromise = new Promise((resolve, reject) => {
    setTimeout(function(){
        resolve('Success!');
    }, 1000);
});

myFirstPromise.then((successMessage) => {
    console.log('Yay! ' + successMessage);
});