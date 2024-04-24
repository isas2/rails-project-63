# Makefile
install:
	bundle install

lint:
	bundle exec rubocop .

lint-fix:
	bundle exec rubocop . -A

test:
	rake test

test-rspec:
	bundle exec rspec

.PHONY: test
