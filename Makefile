# Makefile
install:
	bundle install

lint:
	bundle exec rubocop .

test:
	rake test

say-hello:
	echo "Hello, World!"

.PHONY: test
