# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'optinnow_api/version'

Gem::Specification.new do |spec|
  spec.name          = "optinnow_api"
  spec.version       = OptinnowApi::VERSION
  spec.authors       = ["Joe Weber"]
  spec.email         = ["wosephjeber@gmail.com"]
  spec.summary       = %q{API wrapper for OptINnow}
  spec.description   = %q{Sanely make calls to the OptINnow API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_runtime_dependency "faraday", "~> 0.9.2"
end