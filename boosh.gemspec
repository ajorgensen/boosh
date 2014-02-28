lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boosh/version'

Gem::Specification.new do |s|
  s.name = 'boosh'
  s.version = Boosh::Version
  s.date = '2014-02-26'
  s.summary = 'Boosh!'
  s.description = 'Boosh description'
  s.authors = ["Andrew Jorgensen"]
  s.email = 'andrew@andrewjorgensen.com'
  s.files += Dir.glob('lib/**/*.rb')
  s.files += Dir.glob('spec/**/*.rb')
  s.homepage = 'http://rubygems.org/gems/boosh'
  s.license = 'MIT'


  s.add_development_dependency('rspec')
  s.add_development_dependency('pry')
end
