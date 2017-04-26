# Cloudinary

网址：http://cloudinary.com/

云端的图像和视频管理神器

Cloudinary 是面向网络和移动开发者的图片处理后端，可以满足所有的图片相关需求。

Cloudinary 功能总览：

* 图片上传
* 云存储
* 超强管理
* 图片管理。动态处理图片，添加效果，缩放尺寸，裁切，人脸识别，水印和大量图片处理功能。
* 更快速度

## 开发者喜欢的特性

### 基于 URL 的变换

从一个高清图片，Cloudinary 可以使用一个简单的 URL，动态产生所有需要的缩略图。基于人脸检测裁切可以完美裁切你的照片。通过高速图片 CDN 向任意设备和 Retina 显示屏传输自适应图片。

```
http://res.cloudinary.com/demo/image/upload/w_133,h_133,c_thumb,g_face/bike.jpg
```

### 与开发框架无缝整合

Cloudinary 客户端整合库和 SDK 简化了与开发框架的整合：Ruby on Rails, Node.js, Angular, Python & Django, jQuery 等。

```javascript
// for Node.js
cloudinary.image('group.jpg', { width: 365, height: 133, crop: 'fill' });
```

```javascript
// for jQuery
$.cloudinary.image('group.jpg', { width: 365, height: 133, crop: 'fill' });
```

```python
# for django
cloudinary.CloudinaryImage('group.jpg').image(width=365, height=133, crop='fill')
```

### 使用单行代码上传图片

通过 Cloudinary API 上传文件，从访问者浏览器或者移动应用程序直接上传，无需任何服务器组件。提前或动态进行复杂的图片变形处理。

```javascript
// for Node.js
cloudinary.uploader.upload('sheep.jpg', function(result){ console.log(result) },
                            { width: 800, height: 600, crop: 'limit' });
```

```
// for jQuery

<input name="file" type="file"
    class="file-upload" data-cloudinary-field="image_id"
    data-form-data="{ 'transformation': 'c_limit,h_800,w_600', ... }" />

$('.file-upload').cloudinary_fileupload();
```

```python
# for django
cloudinary.uploader.upload('sheep.jpg', width=800, height=600, crop='limit')
```

### 动态获取和处理图片

通过简单的 URL 前缀，就可以动态裁切或者进一步处理你的原有图片。经过处理后，这些图片会通过一个 CDN 传送。可以从任意网址获取图片，包括 Facebook, Twitter 以及更多。

```
http://res.cloudinary.com/demo/image/fetch/w_365,h_140,c_fill,r_20,e_saturation:50,f_auto/http://upload.wikimedia.org/wikipedia/commons/8/81/Waves_lajolla.jpg
```

### 动态实时视频处理和网络优化

将所有视频片段上传到云端。经过调校 URL，Cloudinary 会将视频转码为适合网络播放，兼容所有浏览器和移动设备。可以根据设计稿动态缩放、裁剪和进一步处理你的视频。你的视频会经过高速 CDN 优化和流媒体化。

```
http://res.cloudinary.com/demo/video/upload/w_220,h_220,c_fill,q_50/dog.mp4
```

### 强大的管理后台和 API

动态管理你的媒体库，也可以使用 RESTful API 和 SDK 来自动化图片收藏。使用深度报道、数据来分析和优化图片的使用。

## 关于 Cloudinary

2011 年由一群老司机建立。

## 相关链接
* [Cloudinary 博客](http://cloudinary.com/blog)
* [账户类型](./upgrade-options.md)
* [关于 Cloudinary](http://cloudinary.com/about)
* [免费注册](https://cloudinary.com/users/register/free)
* [开发文档](./docs/README.md)
* [jQuery integration](jquery_integration.md)