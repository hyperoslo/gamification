$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gamification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gamification"
  s.version     = Gamification::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Gamification."
  s.description = "TODO: Description of Gamification."
  s.license     = "MIT"

  s.files      = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.0.rc1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
