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

Data URI example for PNG (Panda face):
```
iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NkFERjMzMkE1NTdEMTFFMTk4RDZCQTk2OUE1NjE1OUUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NkFERjMzMkI1NTdEMTFFMTk4RDZCQTk2OUE1NjE1OUUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2QURGMzMyODU1N0QxMUUxOThENkJBOTY5QTU2MTU5RSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2QURGMzMyOTU1N0QxMUUxOThENkJBOTY5QTU2MTU5RSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pr9slm0AAAoJSURBVHjanFd5cJXV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
```

**The expected response:**
A JSON response containing a URL to the decoded image. For example:
```
{ url: 'http://data-uri-to-img-url.herokuapp.com/507T4tQm70Q' }
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
{ url: 'http://data-uri-to-img-url.herokuapp.com/507T4tQm70Q' }
```

See example.js.html for source code rendering a canvas in real-time to an image URL.


License
-------
MIT License. Use with credit and care.

i.e.:
![Rendered Image](http://data-uri-to-img-url.herokuapp.com/507T4tQm70Q)
