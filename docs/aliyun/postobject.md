# [PostObject](https://help.aliyun.com/document_detail/31988.html)

## Post Object

Post Object 使用HTML表单上传文件到指定 bucket。Post 作为 Put 的替代品，使得基于浏览器上传文件到bucket 成为可能。Post Object的消息实体通过多重表单格式（multipart/form-data）编码，在 Put Object 操作中参数通过 HTTP 请求头传递，在 Post 操作中参数则作为消息实体中的表单域传递。

## 请求语法

```
POST / HTTP/1.1 
Host: BucketName.oss-cn-hangzhou.aliyuncs.com
User-Agent: browser_data
Content-Length：ContentLength
Content-Type: multipart/form-data; boundary=9431149156168

--9431149156168
Content-Disposition: form-data; name="key"
key
--9431149156168
Content-Disposition: form-data; name="success_action_redirect"
success_redirect
--9431149156168
Content-Disposition: form-data; name="Content-Disposition"
attachment;filename=oss_download.jpg
--9431149156168
Content-Disposition: form-data; name="x-oss-meta-uuid"
myuuid
--9431149156168
Content-Disposition: form-data; name="x-oss-meta-tag"
mytag
--9431149156168
Content-Disposition: form-data; name="OSSAccessKeyId"
access-key-id
--9431149156168
Content-Disposition: form-data; name="policy"
encoded_policy
--9431149156168
Content-Disposition: form-data; name="Signature"
signature
--9431149156168
Content-Disposition: form-data; name="file"; filename="MyFilename.jpg"
Content-Type: image/jpeg
file_content
--9431149156168
Content-Disposition: form-data; name="submit"
Upload to OSS
--9431149156168--
```

## 表单域

名称 | 描述 | 必填
--- | --- | ---
OSSAccessKeyId | Bucket 拥有者的 Access Key Id。 | 有条件的
policy | policy规定了请求的表单域的合法性。不包含policy表单域的请求被认为是匿名请求，并且只能访问public-read-write的bucket。限制：当bucket非public-read-write或者提供了OSSAccessKeyId（或Signature）表单域时，必须提供该表单域。 | 有条件的
Signature | 根据 Access Key Secret 和 policy 计算的签名信息，OSS 验证该签名信息从而验证该 Post 请求的合法性。 | 有条件的
file | 文件或文本内容，必须是表单中的最后一个域。浏览器会自动根据文件类型来设置Content-Type，会覆盖用户的设置。 OSS一次只能上传一个文件。| 必须
key | 上传文件的object名称。 如果需要使用用户上传的文件名称作为object名，使用${filename}变量。 | 必须
