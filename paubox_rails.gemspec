# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paubox_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'paubox_rails'
  spec.version       = PauboxRails::VERSION
  spec.authors       = ['Paubox, Inc.']
  spec.email         = ['engineering@paubox.com']
  spec.metadata["github_repo"] = "https://github.com/Scandotcom/paubox_rails"
  spec.homepage      = "https://github.com/Scandotcom/paubox_rails"

  spec.summary       = %q{Paubox Transactional Email API adapter for ActionMailer.'}
  spec.description   = %q{The Paubox Rails gem integrates Paubox's Transactional Email HTTP API with ActionMailer.}
  spec.homepage      = 'https://www.paubox.com'
  spec.license       = 'Apache-2.0'
  spec.required_ruby_version = '>= 3.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rake', "~> 12.3"
  spec.add_runtime_dependency('actionmailer', '~> 7.0')
  spec.add_dependency('paubox', '~> 0.3')
end
