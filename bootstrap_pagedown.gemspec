$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_pagedown/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_pagedown"
  s.version     = BootstrapPagedown::VERSION
  s.authors     = ["Enrique Vidal"]
  s.email       = ["enrique@cloverinteractive.com"]
  s.homepage    = "https://github.com/cloverinteractive/bootstrap_pagedown"

  s.summary     = "Summary of BootstrapPagedown."
  s.description = "Description of BootstrapPagedown."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'bootstrap-sass'
end
