#
# test_case.rb - A file used to setup the testing enviroment for the library.
#

require 'rubygems'

# --- code coverage on MRI 1.9 ruby only, but disabled by default --------------
if RUBY_VERSION >= '1.9' && RUBY_ENGINE == 'ruby' && ENV['COVERAGE']
  require 'simplecov'
  #SimpleCov.command_name 'test:unit'
  SimpleCov.start do
    # code coverage groups.
    add_filter 'test/'
  end
end

# --- load our dependencies using bundler --------------------------------------
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

# --- Load lib to test ---------------------------------------------------------
require 'readable-token'

# --- Extend Minitest::Test ----------------------------------------------------
class ReadableToken::TestCase < Minitest::Test

  def assert_valid_token(token)
    assert token, 'we should have a token'
    assert_match /^([a-z]+-)+\d+$/i, token, 'token does not match expected pattern'
  end

end
