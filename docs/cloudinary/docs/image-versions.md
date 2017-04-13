# 图像版本

来源：http://cloudinary.com/documentation/image_transformations#image_versions

Cloudinary 默认会给每张上传的图像随机分配一个唯一公开ID。你也可以使用自定义的公开ID或者基于原始上传文件名生成公开ID。如果上传图像的公开 ID 已经存在，原有文件会被覆盖。注意，CDN 可能保留原始图像的缓存。

为了强制 CDN 始终显示最新的上传图像，可以在 Cloudinary 的 URL 上增加版本组件。Cloudinary 返回的版本值作为图像上传的回应的一部分，代表上传的时间戳。可以通过设置 `version` 参数（URLs 中的 v）增加版本组件：

```
http://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg
```

作为版本的替代方案，可以上传图片时设置 `invalidate` 参数为 `true` ，这样就能在 CDN 中使旧图像失效。注意，失效操作一般需要几分钟（也可能1个小时左右），才能在全部的 CDN 中传播，但是 `version` 组件会立即生效。

注意：使用失效功能时，还需要考虑其他一些重要因素。比如，如果一个 URL 包含文件夹结构，没有 version 值，默认这些 URL 不会被失效。对于图像失效的详情，参考 [Invalidating cached images on the CDN](http://cloudinary.com/documentation/upload_images#invalidating_cached_images_on_the_cdn)。