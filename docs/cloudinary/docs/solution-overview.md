# 方案概述

来源：http://cloudinary.com/documentation/solution_overview

## 介绍

Cloudinary is a Software-as-a-Service(SaaS) solution for managing all your web or mobile application's media assets in the cloud.

## 快速案例

以下样例展示了如何使用一行代码将图片上传到 Cloudinary 账户，然后通过一行代码将图片传送到用户（包括动态的变形）。

上传图片 `http://www.example.com/sample.jpg`，将其 public\_id（标识符）设定为 `sample_woman`: 

```javascript
// for Node.js
cloudinary.v2.uploader.upload('http://www.example.com/sample.jpg', { public_id: 'sample_woman' }, function(error, result){ console.log(result) });
```

传输 `sample_image`，同时动态增加如下变形：

* 裁切为宽度 400px 高度 350px，并自动聚焦到图片中最大的脸
* 圆角半径 20px
* 5px 黑边
* 添加 `cloudinary_icon` 作为覆盖物：缩放至大图宽度的 25%，距离东北角 10px 内边距，50% 透明度。
* 自动质量编码，为了尽量减小文件体积，同时保留最佳视觉效果
* 基于用户浏览器自动选择图片格式：Chrome/Opera 选择 WebP，IE 选择 JPEG-XR，其他都是 JPEG

```javascript
// for Node.js
cloudinary.image('sample_woman.jpg', {
    transformation: [
        { width: 400, height: 350, gravity: 'face', crop: 'crop' },
        { radius: 20, border: '5px_solid_black' },
        { overlay: 'cloudinary_icon', opacity: 50, width: 0.25, flags: 'relative', gravity: 'north_east', y: 10, x: 10 },
        { quality: 'auto', fetch_format: 'auto' }
    ]
});
```

```javascript
// for jQuery
$.cloudinary.image('sample_woman.jpg', {
    transformation: [
        { width: 400, height: 350, gravity: 'face', crop: 'crop' },
        { radius: 20, border: '5px_solid_black' },
        { overlay: 'cloudinary_icon', opacity: 50, width: 0.25, flags: 'relative', gravity: 'north_east', y: 10, x: 10 },
        { quality: 'auto', fetch_format: 'auto' }
    ]
})
```

## 构架和概念

Cloudinary 的资源管理方案包括：

* 位于弹性负载均衡器后的高性能服务器，支持高速上传下载
* 高可用存储可以保证资源的安全和随时可用
* 高性能资源处理服务器，产生请求的图片和视频

资源存储到 S3 buckets 中，私有可写。

### 服务架构

![Cloudinary service architecture](http://res.cloudinary.com/demo/image/upload/service_architecture.jpg)

### 传递生命周期

资源传递生命周期包括 5 个阶段：上传（Upload），存储（Storage），管理（Administration），操作（Manipulation）和传递（Delivery）。

第一次通过动态传递 URL 请求变形资源的步骤如下：

1. 浏览器请求资源
2. 资源请求抵达最近的 CDN 边缘服务器
3. CDN 边缘服务器检查资源是否被缓存 - 并没有
4. CDN 边缘服务器向 Cloudinary 请求资源
5. Cloudinary 根据动态 URL 指令产生变形资源
6. Cloudinary 将资源返回至 CDN 边缘服务器
7. CDN 边缘服务器缓存图像，然后返回至用户浏览器

后续通过同一个动态变形 URL 请求变形资源的步骤如下：

1. 浏览器请求资源
2. 资源请求抵达最近的 CDN 边缘服务器
3. CDN 边缘服务器检查资源是否被缓存 - 确实有
4. CDN 边缘服务器将图像返回至用户浏览器

![cloud architecture](http://res.cloudinary.com/demo/image/multi/c_scale,dl_1000,e_trim,w_700/CloudArch.gif)

可用查看所有的[图片变形](./image-transformations.md)和[视频变形](./video-transformations.md)。

### 扩容

速度高，存储无上限。

### 安全

