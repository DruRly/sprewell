# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprewell/version'

Gem::Specification.new do |spec|
  spec.name          = "sprewell"
  spec.version       = Gemrat::VERSION
  spec.authors       = ["Dru Riley"]
  spec.email         = ["dru@drurly.com"]
  spec.description   = ""
  spec.summary       = ""
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

