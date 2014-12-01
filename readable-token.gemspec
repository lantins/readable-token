require './lib/readable-token/version'

spec = Gem::Specification.new do |s|
  # gem information/details
  s.name                = 'readable-token'
  s.version             = ReadableToken::Version
  s.date                = Time.now.strftime('%Y-%m-%d')
  s.summary             = 'Generate human readable "tokens".'
  s.license             = 'MIT'
  s.homepage            = 'https://github.com/lantins/readable-token'
  s.authors             = ['Luke Antins']
  s.email               = ['luke@float64.uk']

  # gem settings for what files to include.
  s.files               = %w(Rakefile README.md HISTORY.md Gemfile readable-token.gemspec)
  s.files              += Dir.glob('{test/**/*,lib/**/*}')
  s.require_paths       = ['lib']

  # development dependencies
  s.add_development_dependency('bundler',        '~> 1.0')
  s.add_development_dependency('rake',           '~> 9.0')
  s.add_development_dependency('minitest',       '~> 5.0')
  s.add_development_dependency('simplecov',      '~> 0.7.1')
  s.add_development_dependency('yard',           '~> 0.8')
  s.add_development_dependency('inch',           '~> 0.3')

  # long description.
  s.description       = <<-EOL
A tiny Ruby library that generates human readable "tokens" that are easy to read and remember.
end
EOL

end
