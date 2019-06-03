require_relative "lib/opal/d3/version"

Gem::Specification.new do |s|
  s.name         = "opal-d3"
  s.version      = Opal::D3::VERSION
  s.author       = "Tomasz Wegrzanowski"
  s.email        = "Tomasz.Wegrzanowski@gmail.com"
  s.homepage     = "https://github.com/taw/opal-d3"
  s.summary      = "Ruby bindings for D3"
  s.description  = "Opal wrapper library for D3 library"

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ["lib"]

  s.add_runtime_dependency "opal", "~> 0.11.0"
  s.add_runtime_dependency "opal-activesupport", "= 0.3.1"
  s.add_development_dependency "rake", ">= 11.3.0"
  s.add_development_dependency "opal-rspec", ">= 0.7.0"
end
