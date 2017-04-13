# Upload images

来源：http://cloudinary.com/documentation/upload_images

## 直接从浏览器或移动应用上传

从浏览器直接上传需要使用 Cloudinary 的 jQuery 插件，需要一些设置：引入 jQuery, Cloudinary 的 jQuery 插件，jQuery-File-Upload 插件，定义你的 cloud name 和 API Key. 可以查看博客文章 [Direct upload made easy, from browser or mobile app to the cloud](http://cloudinary.com/blog/direct_upload_made_easy_from_browser_or_mobile_app_to_the_cloud)，得到更多信息。

在你的 HTML 页面中嵌套一个上传 input 字段，就可以激活签名客户端图片上传。Cloudinary SDK 包含辅助函数（比如，`cl_image_upload_tag` 方法），可以自动创建上传文件字段。比如，在 Ruby on Rails 中：

```ruby
cl_image_upload_tag(:image_id, options = {})
```

注意：如果你手动创建自己的文件上传字段，务必在输入字段中包含 `name="file"` 属性。

## 未签名上传

未签名上传适合从浏览器或移动应用不经验证签名，直接上传，无需经过你的服务器。但是，处于安全考虑，执行未签名上传时不能指定全部参数。

未签名上传选项受 `upload preset` 控制，所以为了使用该特性，你首先需要在 `Upload Settings` 页面开启未签名上传选项。开启未签名上传也创建了一个 `upload preset`，名称唯一。明确允许未经验证直接上传图像。

为了创建一个未签名上传，只需要调用 Cloudinary SDK 的 `unsigned_upload` 方法，设置 `upload_preset` 和 `cloud_name` 参数。