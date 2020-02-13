# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'municipitaly/version'

Gem::Specification.new do |spec|
  spec.name          = 'municipitaly'
  spec.version       = Municipitaly::VERSION
  spec.authors       = ['NatyDev']
  spec.email         = ['natydev@aol.com']

  spec.summary       = 'Municipitaly'
  spec.description   = 'Codes (postal, istat, cadastrian, ...) about Italian ' \
                       'subdivisions and municipalities'
  spec.homepage      = 'https://github.com/natydev/municipitaly'
  spec.license       = 'MIT'
  spec.metadata = {
    'documentation_uri' => 'https://www.rubydoc.info/github/natydev/municipitaly/master'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.77'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
end
