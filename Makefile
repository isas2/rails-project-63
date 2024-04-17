# Makefile
install:
	bundle install

lint:
	bundle exec rubocop .

lint-fix:
	bundle exec rubocop . -A

test:
	rake test

say-hello:
	echo "Hello, World!"

.PHONY: test
