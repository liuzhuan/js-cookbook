const first = document.querySelector('#first');
const second = document.querySelector('#second');
const result = document.querySelector('.result');

const worker = new Worker('./worker.js');

first.oninput = second.oninput = function(e) {
    worker.postMessage([first.value, second.value]);
}

worker.onmessage = function(e) {
    console.log('[main.js]', e.data);
    result.textContent = e.data;
}