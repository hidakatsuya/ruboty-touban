lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/touban/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-touban'
  spec.version       = Ruboty::Touban::VERSION
  spec.authors       = ['Katsuya HIDAKA']
  spec.email         = ['hidakatsuya@gmail.com']

  spec.summary       = 'Ruboty plug-in that tells the duty of the specified day.'
  spec.homepage      = 'https://github.com/standfirm/ruboty-touban'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty', '>= 1.3.0'
  spec.add_runtime_dependency 'google_drive', '~> 3.0.7'

  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'minitest', '>= 5.0'
end
