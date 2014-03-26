$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gamification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gamification"
  s.version     = Gamification::VERSION
  s.authors     = ["Johannes Gorset"]
  s.email       = ["johannes@hyper.no"]
  s.homepage    = "http://github.com/hyperoslo/gamification"
  s.summary     = "Gamification is a collection of models for Ruby on Rails that allows you to make anything a game"
  s.description = "Gamification is a collection of models for Ruby on Rails that allows you to make anything a game"
  s.license     = "MIT"

  s.files      = Dir["{app,config,db,lib}/**/*", "spec/factories/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "carrierwave", "~> 0.10"
  s.add_dependency "configatron", "~> 3.0"
  s.add_dependency "mini_magick"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "timecop"
  s.add_development_dependency "faker"
end
