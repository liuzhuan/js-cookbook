// app.js
var cloudinary = require('cloudinary');

console.log('start uploading....');
cloudinary.v2.uploader.unsigned_upload('images/fence.jpg', 'preset1', 
    { cloud_name: 'liuz' },
    function(error, result) { 
        console.log('upload complete');
        console.log(error);
        console.log(result); 
    });