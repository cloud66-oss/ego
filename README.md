<img src="http://cdn2-cloud66-com.s3.amazonaws.com/images/oss-sponsorship.png" width=150/>

# Ego

Ego is a simple Rails based web application that transforms an input of one-two letters into a square image showing those letters.
This is primarily used as an image source for a gravitar-missing fallback.

### Usage

Start the webserver:
```
export CACHE_PATH=/tmp/cache
bundle exec rails s -b 0.0.0.0
```
Then from your browser, navigate to:

`http://localhost:3000/generate/ab/size/30`

You will then see a simple un-styled image of the initials `AB`
