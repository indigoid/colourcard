# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colourcard/version'

Gem::Specification.new do |spec|
  spec.name          = "colourcard"
  spec.version       = Colourcard::VERSION
  spec.authors       = ["John Slee"]
  spec.email         = ["john.slee@fairfaxmedia.com.au"]

  spec.summary       = %q{Generate colour cards in PNG format}
  spec.description   = %q{Generate colour cards in PNG format, with colours chosen either at random or from a supplied input file. The default settings are ideal for desktop backgrounds on good modern laptops, ie. roughly 8:5 aspect}
  spec.homepage      = "https://github.com/indigoid/colourcard"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "png", "~> 1.2"
  spec.add_runtime_dependency "thor", "~> 0.19"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
