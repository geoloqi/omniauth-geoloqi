require './lib/omniauth-geoloqi/version'
Gem::Specification.new do |s|
  s.name = 'geoloqi'
  s.version = OmniAuth::Geoloqi::VERSION
  s.authors = ['Kyle Drake']
  s.email = ['kyledrake@gmail.com']
  s.homepage = 'http://github.com/geoloqi/omniauth-geoloqi'
  s.summary = 'Geoloqi adapter for Omniauth'
  s.description = 'Geoloqi adapter for Omniauth, which is an amazing library for doing multi-source auth easily'

  s.files = `git ls-files`.split("\n")
  s.require_paths = %w[lib]
  s.rubyforge_project = s.name
  s.required_rubygems_version = '>= 1.3.4'

  s.add_dependency 'omniauth-oauth2', '> 1.0.0'
end