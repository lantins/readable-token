require 'readable-token/version'

# A tiny Ruby library for generating human readable "tokens".
module ReadableToken

  # Access to current list of words
  def self.words
    @@words ||= %w{dream season applause music venue talk top spoon fork tea coffee soup eat drink chat social happy doughnut beans bistro cafe lunch java ruby penguin lion leopard cake tiger crab fish moo milk owl roast aroma balance barista blend body decaf espresso flavor mocha latte organic friend}
  end

  # Set list of words to the given array
  def self.words=(vals)
    @@words = vals
  end

  # Generate a new token.
  def self.generate(opts = {})
    # set default options and merge with user provided
    options = {
      min: 8,
      max: nil
    }.merge(opts)

    segments = []

    # add number
    segments << rand(1..9).to_s

    # count number of loops so were not spinning our wheels if we can't meet
    # the criteria requested by the user.
    looped = 0
    while current_length_of(segments) < options[:min]
      new_word = ''
      remove_blanks!(segments)

      looped += 1
      break if looped > 20

      current_length = current_length_of(segments)
      if options[:max] && options[:max] > 0
        remaining = options[:max] - current_length
        new_word = filter_by_length(words, remaining - 1).sample
      else
        new_word = words.sample
      end

      new_length = current_length_of(segments + [new_word])
      next if options[:max] && options[:max] > 0 && new_length > options[:max]

      segments << new_word
    end
    remove_blanks!(segments)

    # join it all together to give us a token
    segments.reverse.join('-')
  end

  private

  # Remove blank, empty, nil array elements
  def self.remove_blanks!(segments)
    segments.delete_if(&:nil?).delete_if(&:empty?)
  end

  # Calculate the current length
  def self.current_length_of(segments)
    segments.join('-').length
  end

  # Filter array of words by their maximum length
  def self.filter_by_length(words, max)
    words.select { |w| w.length <= max }
  end

end
