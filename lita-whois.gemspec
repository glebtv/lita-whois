Gem::Specification.new do |spec|
  spec.name          = "lita-whois"
  spec.version       = "0.0.4"
  spec.authors       = ["glebtv"]
  spec.email         = ["glebtv@gmail.com"]
  spec.description   = %q{WHOIS handler for lita chat bot}
  spec.summary       = %q{WHOIS handler for lita chat bot}
  spec.homepage      = "https://github.com/glebtv/lita-whois"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 2.4"
  spec.add_runtime_dependency "cocaine"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14"
end
