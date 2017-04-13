# 快速入门

来源：http://cloudinary.com/documentation/node_integration#node_js_getting_started_guide

## 1. 安装

```
npm install cloudinary
```

在代码中引用 Cloudinary

```javascript
var cloudinary = require('cloudinary');
```

## 2. 配置

```javascript
cloudinary.config({
    cloud_name: 'sample',
    api_key: '',
    api_secret: ''
});
```

## 3. 上传图片和视频

```javascript
cloudinary.uploader.upload('my_picture.jpg', function(result){
    console.log(result);
});
```