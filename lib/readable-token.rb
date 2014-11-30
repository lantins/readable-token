require 'readable-token/version'

class ReadableToken

  def initialize
    @records = []
  end

  def self.generate(opts = {})
    options = {
      min: 8,
      max: nil
    }.merge(opts)

    words = %w{music venue talk top spoon fork tea coffee soup eat drink chat social happy doughnut beans bistro cafe lunch java ruby penguin lion leopard cake tiger crab fish moo milk owl roast aroma balance barista blend body decaf espresso flavor mocha latte organic friend}

    segments = []

    # add number
    segments << rand(1..9).to_s

    looped = 0
    while current_length_of(segments) < options[:min]
      segments.delete_if(&:nil?).delete_if(&:empty?)
      looped += 1
      break if looped > 20

      new_word = ''

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
    segments.delete_if(&:nil?).delete_if(&:empty?)

    # join it all together to give us a token
    segments.reverse.join('-')
  end

  private

  def self.current_length_of(segments)
    segments.join('-').length
  end

  def self.filter_by_length(words, max)
    filtered = words.select { |w| w.length <= max }
    filtered
  end

end
