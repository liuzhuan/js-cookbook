# 图像上传 API 手册

来源：http://cloudinary.com/documentation/image_upload_api_reference#upload

授权上传通过 HTTPS 使用安全协议，基于你账号的 `cloud_name`, `api_key`, 和 `api_secret` 参数。

上传 API 包括以下方法：

* Upload
* Rename - to rename an image (change its Public ID) 
* Destroy - to delete an image
* Tags - for managing image tags
* Context - for managing the context metadata attached to an image
* Explicit - to update or apply actions to an already uploaded image.
* Explode - to generate an image for each page in a PDF file
* Generate_archive - to create or download an archive file (currently only ZIP supported)
* Generate_sprite - for generating a single large image from multiple smaller images.
* Multi - to create an animated GIF from multiple images
* Text - to create an image from text.

[Upload images](./upload-images.md)