.PHONY: checkout_to_release deploy_to_release

# Github variables
GITHUB_API=https://api.github.com
ORG=ukparliament
REPO=parliament-utils
LATEST_REL=$(GITHUB_API)/repos/$(ORG)/$(REPO)/releases
REL_TAG=$(shell curl -s $(LATEST_REL) | jq -r '.[0].tag_name')


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

checkout_to_release:
	git checkout -b release $(REL_TAG)

deploy_to_release:
	gem build *.gemspec
	gem push *.gem
	rm *.gem

