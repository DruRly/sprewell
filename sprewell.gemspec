# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sprewell"
  spec.version       = "0.0.2"
  spec.authors       = ["Dru Riley"]
  spec.email         = ["dru@drurly.com"]
  spec.description   = "Sprewell"
  spec.summary       = "Run tests without fear of touching your code."
  spec.homepage      = "https://github.com/DruRly/sprewell"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard-rspec"
end

