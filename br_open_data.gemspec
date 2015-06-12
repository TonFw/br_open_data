# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'br_open_data/version'

Gem::Specification.new do |spec|
  spec.name          = 'br_open_data'
  spec.version       = BROpenData::VERSION
  spec.authors       = ['Ilton Garcia dos Santos Silveira', 'Gilson Cordeiro da Silva']
  spec.email         = %w['ton.garcia.jr@gmail.com', 'gil_wind@hotmail.com']

  spec.summary       = 'Brazil OpenData WebService ruby Client'
  spec.description   = 'Brazil OpenData WebService ruby Client'
  spec.homepage      = 'http://tonfw.github.io/br_open_data'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  #================== GEMs to build it GEM, so its improve the development ==============================
  # Base GEMs to build it gem
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'

  # RSpec for tests
  spec.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
  # Coverage
  spec.add_development_dependency 'simplecov', '~> 0.7', '>= 0.7.1'
  # Create readable attrs values
  spec.add_development_dependency 'faker', '~> 1.4', '>= 1.4.2'

  #================== GEMs to be used when it is called on a project ====================================
  # HTTP REST Client
  spec.add_dependency 'rest-client', '~> 1.7', '>= 1.7.2'
  # Easy JSON create
  spec.add_dependency 'multi_json', '~> 1.10', '>= 1.10.1'
  # To pretty print on console
  spec.add_dependency 'colorize', '~> 0.7.3', '>= 0.7.3'
end
