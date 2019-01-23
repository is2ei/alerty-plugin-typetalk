lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alerty/plugin/typetalk/version'

Gem::Specification.new do |spec|
  spec.name          = 'alerty-plugin-typetalk'
  spec.version       = Alerty::Plugin::Typetalk::VERSION
  spec.authors       = ['Issei Horie']
  spec.email         = ['is2ei.horie@gmail.com']

  spec.summary       = 'Alerty plugin for Typetalk'
  spec.description   = 'This plugin will send notification to Typetalk.'
  spec.homepage      = 'https://github.com/is2ei/alerty-plugin-typetalk'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'alerty' '~> 0.4.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
