## Integration into Parliament Applications

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

18. Find all instances of the Helpers mentioned below (in entire project) and replace as required:

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
