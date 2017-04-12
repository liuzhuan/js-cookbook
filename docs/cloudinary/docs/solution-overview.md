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

Cloudinary 的安全云方案可用通过安全和验证的 HTTPS API，有灵活的访问密钥配置。Cloudinary 的安全特性包括：

* 自动备份资源到辅助受保护的地址
* 完整的[资源访问控制](./control-access-to-images.md)
* 通过 Cloudinary 管理控制台的[安全设置](https://cloudinary.com/console/settings/security)，依据特定形变，文件类型和来源网址限制资源的访问。
* 通过 [signed URLs](http://cloudinary.com/blog/on_the_fly_image_manipulations_secured_with_signed_urls)验证图片访问
* 通过 Cloudinary 管理控制台的[用户设置](http://cloudinary.com/console/settings/users)控制多用户角色和权限，启用双因素验证。

### APIs

Cloudinary 提供了 3 类 API，用来上传、管理和传递资源，如下：

* 上传 API - 上传资源，创建新资源比如文字图像，ZIP 文件和精灵图片，还可以操作现存的资源。
* 管理 API - 安全 API，可用浏览、删除、恢复现存资源，管理上传预设，上传映射和形变。
* URL API - 基于 URL 的传递资源的 API。包括动态资源变形，获取远程图形，优化资源的传递。资源的 URL 会动态映射到 CDN 。

### 管理控制台和媒体库

Cloudinary 网络端的管理控制台可以管理你的 Cloudinary 账号。控制台包括如下特性：

* 仪表盘
* 媒体库
* 变形
* 报告
* 插件
* 设置

## 账号和 API 设置

### 标识符

为了使用 Cloudinary 服务，每个 Cloudinary 客户都会分配唯一的 `cloud names` 和 `access identifiers`。

#### Cloud name

`cloud name` 标识符是你的 Cloudinary 账户的名称，一个用于构造 URL 和 API 的唯一公开标识符。因为你的 `cloud name` 用于构建所有资源公开 URL（比如，http://res.cloudinary.com/my\_cloud\_name），务必选择一个合适的名称。

如果使用我们的 SDK，需要在开发框架中设置 cloud name。举个例子，如果你使用了 Ruby GEM, 你的 cloud name 假如是 "demo"，只需将如下内容放入 `cloudinary.yml` 文件即可（位于 Rails 的 `config/` 目录下）:

```yml
development:
    cloud_name: "demo"

production:
    cloud_name: "demo"
```

#### Access identifiers

通过 Cloudinary API 上传和管理资源需要安全认证 that uses a standard method for signing API request parameters with your unique secret.

Cloudinary 自动生成一对 access identifiers, 分别是 `API Key` 和 `API Secret`，使用 Cloudinary API 通信和签名请求时需要用到两者。

