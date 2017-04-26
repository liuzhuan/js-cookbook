# jQuery - Getting started guide

http://cloudinary.com/documentation/jquery_integration#jquery_getting_started_guide

## 1. Installation

You can download **jquery.cloudinary.js** from the **js** folder of the [GitHub](https://github.com/cloudinary/cloudinary_js) project. In your HTML pages, include jquery.cloudinary.js after including the jQuery library.

```html
<script src="jquery.min.js" type="text/javascript"></script>
<script src="jquery.cloudinary.js" type="text/javascript"></script>
```

If you want to perform direct uploading from the browser, download the following files from the js folder of the GitHub project as well. These files belong to the jQuery File Upload plugin.

```
jquery.ui.widget.js
jquery.iframe-transport.js
jquery.fileupload.js
```

Include all required jQuery files in your HTML page:

```html
<script src="jquery.min.js" type="text/javascript"></script>
<script src="jquery.ui.widget.js" type="text/javascript"></script>
<script src="jquery.iframe-transport.js" type="text/javascript"></script>
<script src="jquery.fileupload.js" type="text/javascript"></script>
<script src="jquery.cloudinary.js" type="text/javascript"></script>
```

## 2. Configuration

Your **cloud\_name** account parameter is required to build image URLs. The public **api\_key** is needed to perform direct uploading to Cloudinary (e.g., image uploads.) The private **api\_secret** parameter should not be included in your client-side HTML or JavaScript code. 

Setting the configuration parameters can be done either programmatically in each call to a Cloudinary method or globally using the `$.cloudinary.config` method.

Here's an example of setting configuration parameters globally in your JavaScript code:

```javascript
$.cloudinary.config({ cloud_name: 'sample', api_key: '874837483274837' });
```

## 3. Upload media assets

You can upload images, videos, or any other files directly from the browser to Cloudinary. Uploading is done over HTTPS using a secure protocol based on the api\_key and api\_secret parameters of your account.

However, Cloudinary requires upload requests to be signed with your private api\_secret, which should not be exposed in public web pages. Therefore, a signature needs to be generated in your server-side application for authorizing direct uploading.

The following file input tag will be automatically converted by Cloudinary's jQuery plugin to perform direct uploading to the cloud:

```html
<input name="file" type="file"
    class="cloudinary-fileupload" data-cloudinary-field="image_id"
    data-form-data="... html-escaped JSON data ..." > </input>
```

The unescaped JSON content of data-form-data includes all upload parameters and the signature for authorizing upload. Here's an example:

```json
{
    "timestamp": 1345719094,
    "callback": "https://www.example.com/cloudinary_cors.html",
    "signature": "7ac8c75...a7a",
    "api_key": "1234567890"
}
```

Users can upload one or more images or non-image files. Alternatively, you can specify a remote HTTP URL for uploading resources. Each media asset uploaded to Cloudinary is assigend a unique **Public ID** and is available for immediate delivery and transformation. The upload method returns a hash with content similar to that shown in the following example:

```javascript
{
    url: 'http://res.cloudinary.com/demo/image/upload/v1371281596/sample.jpg',
    secure_url: 'https://res.cloudinary.com/demo/image/upload/v1371281596/sample.jpg',
    public_id: 'sample',
    version: '1312461204',
    format: 'jpg',
    width: 864,
    height: 564,
    bytes: 120253
}
```

As you can see in the following form data example, with a single call you can define your own Public ID, apply an incoming transformation before storing the resource file in the cloud, generate derived resources eagerly and assign tags to uploaded resources:

```json
{
    "api_key": "1234567890",
    "callback": "https://www.example.com/cloudinary_cors.html",
    "timestamp": 1372419182,
    "signature": "f5caf4b413...f74",
    "eager": "c_thumb,g_face,h_200,w_200|c_fit,f_png,h_150,w_100",
    "public_id": "sample_id",
    "transformation": "c_limit,h_2000,w_1200",
    "tags": "special,for_homepage"
}
```

Many more upload options as well as direct uploading from the browser are details here: [jQuery image upload](./jquery_image_upload.md) and [jQuery video upload](./jquery_video_upload.md).

## 4. Display and manipulate images and videos

Adding images and video to your Java application is quite straightforward.

For example, you can use the `$.cloudinary.image` helper method. This method generates the full image resource URL based on the given parameters and creates an IMG tag you can add to your HTML code:

```javascript
$.cloudinary.image('sample.jpg', { alt: 'Sample Image' });
```

Now, let's say that you wish to display a small thumbnail of this uploaded image. Simply add the transformation instructions to your call. For example, displaying the 'sample' image transformed to fill a 100x150 rectangle:

```javascript
$.cloudinary.image('sample.jpg', { width:100, height:150, crop: 'fill' });
```

This is equivalent to:

```html
<img width="100" height="150"
    src="http://res.cloudinary.com/demo/image/upload/c_fill,h_150,w_100/sample.jpg" />
```

## 5. Sample projects

To find additional useful code samples and learn how to integrate Cloudinary with your web applications, take a look at our sample projects for [Ruby on Rails](https://github.com/cloudinary/cloudinary_gem/tree/master/samples), [PHP](https://github.com/cloudinary/cloudinary_php/tree/master/samples) and [Django](https://github.com/cloudinary/cloudinary-django-sample).

You should also take a look at the following fully working example that performs direct uploading from the browser with uploading progress and preview with advanced transformations and embeds in a dynamic HTML page using Cloudinary's jQuery plugin.

https://github.com/cloudinary/cloudinary_pubnub_demo/blob/master/server/views/index.haml

> What is [haml](./haml.md)?