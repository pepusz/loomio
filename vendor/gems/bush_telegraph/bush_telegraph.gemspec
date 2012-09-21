$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bush_telegraph/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bush_telegraph"
  s.version     = BushTelegraph::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BushTelegraph."
  s.description = "TODO: Description of BushTelegraph."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
