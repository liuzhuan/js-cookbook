onmessage = function(e) {
    const [first, second] = e.data;
    console.info(first, second, e.data);
    postMessage(first * second);
}