This is a simple rails app to return an image generated from two letters.

#### Build and run with docker

`docker build --t ego .`
`docker run -d ego`

#### Request and image

`curl <host>/generate/ab/size/123`
