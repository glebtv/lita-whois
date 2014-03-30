Gem::Specification.new do |spec|
  spec.name          = "lita-whois"
  spec.version       = "0.1.0"
  spec.authors       = ["glebtv", "Eric Sigler"]
  spec.email         = ["glebtv@gmail.com", "me@esigler.com"]
  spec.description   = %q{WHOIS handler for lita chat bot}
  spec.summary       = %q{WHOIS handler for lita chat bot}
  spec.homepage      = "https://github.com/glebtv/lita-whois"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.0"
  spec.add_runtime_dependency "whois"
  spec.add_runtime_dependency "ipaddress"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta2"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rubocop"
end
