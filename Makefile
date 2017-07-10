gemset:
	rvm gemset create parliament-utils
	rvm --force gemset empty parliament-utils
	rvm gemset use parliament-utils

test: gemset
	bundle install
	bundle exec rake

build:
	rm -f parliament-utils-*.gem
	gem build parliament-utils.gemspec

release: build test
	gem push parliament-utils-*.gem
	rm parliament-utils-*.gem