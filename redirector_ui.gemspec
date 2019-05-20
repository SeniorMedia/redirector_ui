$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'redirector_ui/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'redirector_ui'
  s.version     = RedirectorUi::VERSION
  s.authors     = ['Fabien Dobat']
  s.email       = ['fabien.dobat@seniormedia.fr']
  s.homepage    = 'https://github.com/SeniorMedia/redirector_ui'
  s.summary     = 'Redirector gem interface'
  s.description = 'A simple Rails engine that provides an interface for redirector gem'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'bootstrap', '>= 4.0.0'
  s.add_dependency 'datagrid'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'kaminari'
  s.add_dependency 'rails', '>= 3.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'awesome_print'
end
