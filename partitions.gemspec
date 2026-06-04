# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'partitions/version'

Gem::Specification.new do |spec|
  spec.name          = "partitions"
  spec.version       = Partitions::VERSION
  spec.authors       = ["NagaChaitanya Vellanki"]
  spec.email         = ["nagachaitanya.vellanki.com"]

  spec.summary       = %q{A Ruby gem to generate partitions.}
  spec.description   = %q{Generate integer, set and multiset partitions.}
  spec.homepage      = "https://github.com/chaitanyav/partitions"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "source_code_uri" => spec.homepage,
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md"
  }

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 6.0"
  spec.add_development_dependency "simplecov", "~> 0.22"
end
