# Parliament::Utils

[parliament-utils][parliament-utils], created by the Parliamentary Digital Service, holds all reusable application configuration, test set up and generic helper methods. It is intended to be used across all applications making up the UK Parliament's website.

> **NOTE:** This gem is in active development and is likely to change at short notice. It is not recommended that you use this in any production environment.

## Requirements

[parliament-utils][parliament-utils] requires the following:

* [Ruby][ruby] - [click here][ruby-version] for the exact version
* [Bundler][bundler]

## Installation

Within your application, add this line to your application's `Gemfile`:

```ruby
gem 'parliament-utils'
```

Once you add the gem to your `Gemfile` run:

```ruby
bundle install
```

### Usage

Follow installation instructions below to integrate the [parliament-utils][parliament-utils] gem into an existing application

Now all application configuration, test set up and helper methods should be available within your application.

### Instructions

The following steps can be followed to include this gem in your application:

*Gemfile*

1. Add `gem 'parliament-utils'` to Gemfile, below `parliament-grom-decorators`
2. Ensure latest version of `pugin` gem _version tbc_

*config*
3. Delete `config/initializers` folder
4. Delete `config/puma.rb` file
5. Add `require 'parliament/utils'` to `config/application.rb` file, below `require 'pugin'`

*spec/spec_helper*
5. Remove all contents from `spec/spec_helper`

*spec/rails_helper*
6. Remove VCR and RSpec configuration blocks
7. Remove the following code, if it exists

```ruby
`require 'parliament/ntriple'`
`require 'vcr'`
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```

8. Add the following code:

```ruby
require 'parliament/utils/test_helpers'
RSpec.configure do |config|
  Parliament::Utils::TestHelpers.included_modules.each do |m|
    m.load_rspec_config(config)
  end
end
```

*spec/helpers*

9. Delete `flag_helper_spec.rb` file, if it exists

*spec/controllers/concerns*

10. Delete `postcode_helper_spec.rb` file, if it exists

*app/controllers/concerns*

11. Delete `format_helper.rb`, `houses_helper.rb`, `parliament_helper.rb`, `postcode_helper.rb`, `request_helper.rb`, `v_card_helper.rb` files, if they exist

*app/controllers/application_controller*
12. Remove the following references to Helpers, if they exist

```
require 'houses_helper'
require 'request_helper'
require 'parliament_helper'
require 'format_helper'
require 'v_card_helper'
include HousesHelper
include RequestHelper
include ParliamentHelper
include FormatHelper
include VCardHelper
```

14. Add `require 'parliament/utils'`
15. Add the following `include` statements to the `ApplicationController` class (ResourceHelper and VCardHelper may not be required in all apps)

```ruby
include ResourceHelper
include Parliament::Utils::Helpers::ApplicationHelper
include Parliament::Utils::Helpers::VCardHelper
```

16. Remove `data_check`, `data_url`, `build_request`, `populate_alternates` methods, if they exist

*app/helpers*

17. Delete `application_helper.rb`, `flag_helper.rb` files, if they exist

*Referencing new gem modules*

18. Find all instances of the Helpers mentioned below (in entire project) and replace/use as required:

```
Replace `ApplicationHelper` with `Parliament::Utils::Helpers::ApplicationHelper`
Replace `FlagHelper` with `Parliament::Utils::Helpers::FlagHelper`
Replace `FormatHelper` with `Parliament::Utils::Helpers::FormatHelper`
Replace `HousesHelper` with `Parliament::Utils::Helpers::HousesHelper`
Replace `ParliamentHelper` with `Parliament::Utils::Helpers::ParliamentHelper`
Replace `PostcodeHelper` with `Parliament::Utils::Helpers::PostcodeHelper`
Replace `RequestHelper` with `Parliament::Utils::Helpers::RequestHelper`
Replace `VCardHelper` with `Parliament::Utils::Helpers::VCardHelper`
```

## Getting Started with Development

To clone the repository and set up the dependencies, run the following:

```bash
git clone https://github.com/ukparliament/parliament-utils.git
cd parliament-utils
bundle install
```

### Running Tests

We use [Rspec][rspec] as our testing framework and tests can be run using:

```bash
bundle exec rake
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Ensure your changes are tested using [Rspec][rspec]
6. Create a new Pull Request

## License

[parliament-utils][parliament-utils] is licensed under the [Open Parliament Licence][info-license].

[ruby]:                   https://www.ruby-lang.org/en/
[bundler]:                http://bundler.io
[rspec]:                  http://rspec.info
[parliament-utils]: 	    https://github.com/ukparliament/parliament.uk-parliament-utils
[pds]:                    https://www.parliament.uk/mps-lords-and-offices/offices/bicameral/parliamentary-digital-service/
[ruby-version]:           https://github.com/ukparliament/pugin/blob/master/.ruby-version
[rails]:                  http://rubyonrails.org
[haml]:                   http://haml.info

[info-travis]:            https://travis-ci.org/ukparliament/pugin
[shield-travis]:          https://img.shields.io/travis/ukparliament/pugin.svg

[info-coveralls]:         https://coveralls.io/github/ukparliament/pugin
[shield-coveralls]:       https://img.shields.io/coveralls/ukparliament/pugin.svg

[info-license]:           http://www.parliament.uk/site-information/copyright/open-parliament-licence/
[shield-license]:         https://img.shields.io/badge/license-Open%20Parliament%20Licence-blue.svg
