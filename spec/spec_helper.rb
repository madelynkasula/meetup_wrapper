require_relative '../lib/meetup_wrapper'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'purdytest'

# VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/meetup_wrapper_cassettes'
  c.hook_into :webmock
end
