require_relative './test_helpers/rails_helper' if defined?(::Rails)
require_relative './test_helpers/rspec_helper'
require_relative './test_helpers/simplecov_helper'
require_relative './test_helpers/vcr_helper' if defined?(::VCR) || ENV['RUN_VCR_IN_GEM']
require_relative './test_helpers/webmock_helper'
require_relative './test_helpers/bandiera_helper'

module Parliament
  module Utils
    module TestHelpers
      include Parliament::Utils::TestHelpers::RailsHelper if defined?(::Rails)
      include Parliament::Utils::TestHelpers::RSpecHelper
      include Parliament::Utils::TestHelpers::SimpleCovHelper
      include Parliament::Utils::TestHelpers::VCRHelper if defined?(::VCR) || ENV['RUN_VCR_IN_GEM']
      include Parliament::Utils::TestHelpers::WebmockHelper
      include Parliament::Utils::TestHelpers::BandieraHelper
    end
  end
end
