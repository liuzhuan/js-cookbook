# jQuery image upload

http://cloudinary.com/documentation/jquery_image_upload

## Direct uploading from the browser

Uploading directly from the browser is done using Cloudinary's open-source jQuery plugin. To ensure that all uploads were authorized by your application, a secure signature must first be generated in your server-side code.

The Cloudinary JavaScript library utilizes the Blueimp File Upload library to support uploading media directly from the browser. You must explicitly initialize this library:

```javascript
$(function(){
    if ($.fn.cloudinary_fileupload !== undefined) {
        $('input.cloudinary-fileupload[type=file]').cloudinary_fileupload();
    }
});
```

Direct uploading from the browser is performed using XHR CORS request. In order to support older browsers that do not support CORS, the jQuery plugin will gracefully degrade to an iframe based solution.

When uploading is completed, the identifier of the uploaded image is set as the value of a hidden input field of your selected name.

Users can upload one or more images or non-image files. 

Having stored the image_id, you can now display a directly uploaded image in the same way you would display any other Cloudinary hosted image:

```javascript
$.cloudinary.image(response.public_id + '.jpg', { width: 120, height: 80, crop: 'fill' });
```

## Public ID

Each uploaded image is assigned with a unique idenitfier called **Public ID**. It is a URL-safe string that is used to reference the uploaded resource as well as building dynamic delivery and transformation URLs.

## Preview thumbnail, progress indication, multiple images

Cloudinary's jQuery library also enables an enhanced uploading experience - show a progress bar, display a thumbnail of the uploaded image, drag & drop support, upload multiple files and more.

Bind to Cloudinary's cloudinarydone event if you want to be notified when an upload to Cloudinary has completed. 

The following sample code creates a 150x100 thumbnail of an uploaded image and updates an input field with the public ID of this images:

```javascript
$('.cloudinary-fileupload').bind('cloudinarydone', function(e, data){
    $('.preview').html(
        $.cloudinary.image(data.result.public_id, {
            format: data.result.format,
            version: data.result.version,
            crop: 'fill',
            width: 150,
            height: 100
        })
    );

    $('.image_public_id').val(data.result.public_id);

    return true;
});
```

You can track the upload progress by binding to the following events: fileuploadsend, fileuploadprogress, fileuploaddone and fileuploadfail. You can find more details and options in the [documentation of jQuery-File-Upload](https://github.com/blueimp/jQuery-File-Upload/wiki).

The following JavaScript code updates a progress bar according to the data of the fileuploadprogress event.

```javascript
$('.cloudinary-fileupload').bind('fileuploadprogress', function(e, data){
    $('.progress_bar').css('width', Math.round((data.loaded * 100.0) / data.total) + '%');
});
```

You can find some more examples as well as an upload button style customization in our [Photo Album sample project for Ruby on Rails](https://github.com/cloudinary/cloudinary_gem/blob/master/samples/photo_album/app/views/photos/new_direct.html.erb).

The file input field can be configured to support simultaneous multiple file uploading. Setting the multiple HTML parameter allows uploading multiple files. Here's an example:

```html
<input name="file" type="file" multiple="multiple"
    class="cloudinary-fileupload" data-cloudinary-field="image_id"
    data-form-data="... html-escaped JSON data ..."></input>
```

Cloudinary demo in action

http://cloudinary-pubnub-demo.herokuapp.com/