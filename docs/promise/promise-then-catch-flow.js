function taskA() {
    console.log('Task A');
    throw new Error('throw Error @ Task A');
}

function taskB() {
    console.log('Task B');
    throw new Error('throw Error @ Task B');
}

function onRejected(error) {
    console.log('Catch Error: A or B', error);
}

function finalTask() {
    console.log('Final Task');
}

var promise = Promise.resolve();
promise.then(taskA)
    .then(taskB)
    .catch(onRejected)
    .then(finalTask);