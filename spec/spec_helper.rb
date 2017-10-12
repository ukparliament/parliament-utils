# Application Files
require 'parliament'
require 'parliament/ntriple'
require 'parliament/utils'
require 'bandiera/client'
require 'parliament/grom/decorator'

# Set an environment variable spcifically for testing the gem using VCR.
# We only include VCR helpers if the host application is running VCR,
# however we require VCR for testing this gem itself so we set a VCR environment variable and
# reload Parliament::Utils::TestHelpers which will include VCR for our tests.
ENV['RUN_VCR_IN_GEM'] = 'true'
load File.expand_path('../../lib/parliament/utils/test_helpers.rb', __FILE__)

# Load RSpec configurations held within all test helper modules included in the
# overarching Parliament::Utils::TestHelpers module
RSpec.configure do |config|
  Parliament::Utils::TestHelpers.included_modules.each do |m|
    m.load_rspec_config(config)
  end
end
