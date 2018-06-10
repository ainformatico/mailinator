# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailinator/version'

Gem::Specification.new do |spec|
  spec.name          = 'mailinator'
  spec.version       = Mailinator::VERSION
  spec.authors       = ['Alejandro Dev.']
  spec.email         = ['aeinformatico@gmail.com']
  spec.summary       = 'Mailinator REST API wrapper'
  spec.homepage      = 'https://github.com/ainformatico/mailinator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'hashie', '~> 3.4.4'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 11.1.2'
end
