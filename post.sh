write_post() {
  ruby .blog_seed.rb
}

test_server() {
  ruby -run -ehttpd . -p8000
}

## Coming soon.

#chatbot_poetry() {
#}

#chatbot_whimsy() {
#}
