'use strict';

var promiseCount = 0;

function testPromise() {
    let thisPromiseCount = ++promiseCount;

    let log = document.getElementById('log');
    log.insertAdjacentHTML('beforeend', thisPromiseCount + 
        ') Started (<small>Sync code started</small>)<br/>');
    let p1 = new Promise((resolve, reject) => {
        log.insertAdjacentHTML('beforeend', thisPromiseCount + 
            ') Promise stared (<small>Async code started</small>)<br/>');
        setTimeout(function(){
            resolve(thisPromiseCount);
        }, Math.random() * 2000 + 1000);
    });

    p1.then(
        function(val) {
            log.insertAdjacentHTML('beforeend', val + 
                ') Promise fulfilled (<small>Async code terminated</small>)<br/>');
        }
    ).catch(
        (reason) => {
            console.log('Handle rejected promise (' + reason + ') here.');
        }
    );

    log.insertAdjacentHTML('beforeend', thisPromiseCount + 
        ') Promise made (<small>Sync code terminated</small>) <br/>');
}