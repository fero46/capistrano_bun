# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-bun'
  spec.version       = '1.0.4'
  spec.authors       = ['Ferhat Ziba']
  spec.email         = ['fero.ziba@gmail.com']
  spec.description   = %q{bun support for Capistrano 3.x}
  spec.summary       = %q{bun support for Capistrano 3.x}
  spec.homepage      = 'https://github.com/fero46/bun'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
