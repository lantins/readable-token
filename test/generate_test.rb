require 'readable-token/test_case'

class GenerateTest < ReadableToken::TestCase

  N_TIMES = 0..1000

  def assert_valid_token(token)
    assert token, 'we should have a token'
    assert_match /^([a-z]+-)+\d+$/i, token, 'token does not match expected pattern'
  end

  def test_generate_with_defaults
    (N_TIMES).each do
      token = ReadableToken.generate
      assert_valid_token(token)
    end
  end

  def test_generate_min_length
    (N_TIMES).each do
      @min = 20
      token = ReadableToken.generate(min: @min)
      assert_valid_token(token)
      assert_operator token.length, :>=, @min, 'token does not meet minimum length'
    end
  end

  def test_generate_max_length
    (N_TIMES).each do
      @max = 8
      token = ReadableToken.generate(max: @max)
      assert_valid_token(token)
      assert_operator token.length, :<=, @max, 'token exceeds maximum length'
    end

  end

end
