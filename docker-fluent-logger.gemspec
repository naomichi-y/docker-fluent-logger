# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker-fluent-logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'docker-fluent-logger'
  spec.version       = DockerFluentLogger::VERSION
  spec.authors       = ['naomichi-y']
  spec.email         = ['n.yamakita@gmail.com']

  spec.summary       = 'Transfer docker log to Flutend'
  spec.description   = 'Transfer utiltity for docker log to Fluentd'
  spec.homepage      = 'https://github.com/naomichi-y/docker-fluent-logger'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = ""
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 5.0.0'
  spec.add_dependency 'lograge', '~> 0.5'
  spec.add_dependency 'oj', '~> 3.10.0'
  spec.add_dependency 'thor', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.48'
end
