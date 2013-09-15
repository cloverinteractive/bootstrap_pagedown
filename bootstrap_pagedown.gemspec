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

  s.summary     = "Bootstrap Pagedown for Rails."
  s.description = "It's Bootstrap Pagedown for the Rails asset pipeline."

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency "rails", ">= 3.2"
end
