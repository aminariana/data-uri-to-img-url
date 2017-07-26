data-uri-to-img-url
===================

This service takes a Base64 encoded DataURI via a POST request, and responds with a URL representing the decoded image. It's useful as a Javascript API to take a screenshot of an HTML5 canvas and convert it to a URL that can then be shared on social networks.

The way we originally envisioned using this was for a project that generated custom canvas images. We wanted to share a screenshot of the canvas on Facebook. So we used this in combination with the following project to convert the canvas to an image and wrap it in a page with opengraph META tags in real time. See the following complementing project:

https://github.com/aminariana/opengraph-meta-describer


Live production instance
------------------------

The main production instance for your use:
- http://data-uri-to-img-url.herokuapp.com

As of July 26, 2017, the database grew too large to maintain records for free.
I have modified code to only keep the latest 10K uploads, so that I can still
keep it below the free tier. If you want your image resources to remain in cache
permanently, either host your own service or offer me a fee so I can pay
database costs to Heroku.

Documentation
-------------

Author:
- http://www.aminariana.com

Documentation site:
- http://aminariana.github.io/data-uri-to-img-url

The main API is the following path, used in POST requests:
- http://data-uri-to-img-url.herokuapp.com/images.json

**The POST request parameters accepted:**
- 'image[data_uri]': The 64 bit encoded string representing the image

**The expected response:**
A JSON response containing a URL to the decoded image. For example:
```
{ url: 'http://data-uri-to-img-url.herokuapp.com/AdLtqeN_DJc' }
```

Motivation and Benefits
-----------------------
When you have a custom HTML5 canvas, you can use this project to convert the DataURI (the 64 bit JS-serialized screenshot of the canvas) to a globally reachable Image URL.

Example
-------
For some reason you've 64-bit encoded an HTML5 canvas rendering of President Obama giving a speech, using Javascript:

```
var img_uri= canvas.toDataURL("image/png");
```

Yes, you can render this as an IMG tag within the same app. But how would you, say, share it on Facebook? You'd need to convert it to a URL first:

```
  # Make a POST request to 'http://data-uri-to-img-url.herokuapp.com/images.json' with param 'image[data_uri]' set to the above DataURI input.
  # This could be from an HTML form with a textarea, or programmatically using an AJAX POST request.
```

The result:

```
{ url: 'http://data-uri-to-img-url.herokuapp.com/AdLtqeN_DJc' }
```

See example.js.html for source code rendering a canvas in real-time to an image URL.


License
-------
MIT License. Use with credit and care.

i.e.:
![Rendered Image](http://data-uri-to-img-url.herokuapp.com/AdLtqeN_DJc)
