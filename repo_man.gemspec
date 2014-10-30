# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'repo_man/version'

Gem::Specification.new do |spec|
  spec.name          = "repo_man"
  spec.version       = RepoMan::VERSION
  spec.authors       = ["Brook Riggio"]
  spec.email         = ["brook@codefellows.org"]
  spec.summary       = %q{Keep the repos under one roof.}
  spec.description   = %q{Track all the repos for a GitHub user from one parent directory}
  spec.homepage      = "https://github.com/brookr/repo_man"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "github_api", "~> 0.12"
end
