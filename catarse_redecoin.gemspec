$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catarse_redecoin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catarse_redecoin"
  s.version     = CatarseRedecoin::VERSION
  s.authors     = ["Antônio Roberto"]
  s.email       = ["forevertonny@gmail.com"]
  s.homepage    = "https://catarse.me"
  s.summary     = "Redecoin catarse integration"
  s.description = "Catarse gateway integration to process bitcoin"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "rspec-rails", "~> 3.3"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "pg"
  s.add_development_dependency "database_cleaner"
end
