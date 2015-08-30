Gem::Specification.new do |spec|
  spec.name          = 'lita-whois'
  spec.version       = '1.0.0'
  spec.authors       = ['glebtv', 'Eric Sigler']
  spec.email         = ['glebtv@gmail.com', 'me@esigler.com']
  spec.description   = 'WHOIS handler for lita chat bot'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/glebtv/lita-whois'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4.2'
  spec.add_runtime_dependency 'whois'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
