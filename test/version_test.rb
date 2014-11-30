require 'readable-token/test_case'

class VersionTest < ReadableToken::TestCase

  def test_should_have_a_version
    assert ReadableToken::Version, 'unable to access the version number'
  end

end
