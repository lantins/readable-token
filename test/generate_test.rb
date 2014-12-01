require 'readable-token/test_case'

class GenerateTest < ReadableToken::TestCase

  N_TIMES = 0..1000

  def test_generate_with_defaults
    (N_TIMES).each do
      token = ReadableToken.generate
      assert_valid_token(token)
    end
  end

  def test_generate_min_length
    @min = 20
    (N_TIMES).each do
      token = ReadableToken.generate(min: @min)
      assert_valid_token(token)
      assert_operator token.length, :>=, @min, 'token does not meet minimum length'
    end
  end

  def test_generate_max_length
    @max = 8
    (N_TIMES).each do
      token = ReadableToken.generate(max: @max)
      assert_valid_token(token)
      assert_operator token.length, :<=, @max, 'token exceeds maximum length'
    end
  end

  def test_custom_word_list
    words = %w(random another lividpenguin)
    ReadableToken.words = words
    (N_TIMES).each do
      token = ReadableToken.generate
      assert_valid_token(token)

      first_word = token.split('-').first
      assert_includes words, first_word, 'token not built from our word list'
    end
  end

end
