# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eventum/version"

Gem::Specification.new do |spec|
  spec.name          = "eventum"
  spec.version       = Eventum::VERSION
  spec.authors       = ["Enrique Gonzalez"]
  spec.email         = ["enriikke@gmail.com"]

  spec.summary       = "A Ruby wrapper for the Event Store API."
  spec.description   = "A Ruby wrapper for the Event Store API."
  spec.homepage      = "http://github.com/Skookum/eventum"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.files         = `git ls-files -z`.split("\x0").reject do |file|
    file.match(%r{^(test|spec|features|png|svg)/})
  end

  spec.required_ruby_version = ">= 2.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "webmock", "~> 1.21"
  spec.add_development_dependency "vcr", "~> 2.9"

  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "faraday", "~> 0.9"
end
