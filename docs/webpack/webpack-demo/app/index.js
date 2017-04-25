// import _ from 'lodash';
import foo from './foo';

function component() {
    var element = document.createElement('div');

    foo();

    return element;
}

document.body.appendChild(component());
