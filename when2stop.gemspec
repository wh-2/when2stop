$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "when2stop/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "when2stop"
  spec.version     = When2stop::VERSION
  spec.authors     = ["Pablo Cha"]
  spec.email       = ["pabloc@fulljaus.com"]
  spec.homepage    = "https://github.com/wh-2/when2stop"
  spec.summary     = "A gem to iterate for a given time"
  spec.description = "A gem to iterate for a given time"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/wh-2"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"
end
