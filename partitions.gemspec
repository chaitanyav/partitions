# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'partitions/version'

Gem::Specification.new do |spec|
  spec.name          = "partitions"
  spec.version       = Partitions::VERSION
  spec.authors       = ["NagaChaitanya Vellanki"]
  spec.email         = ["nagachaitanya.vellanki.com"]

  spec.summary       = %q{a rubygem to generate partitions.}
  spec.description   = %q{Generate integer, set and multiset partitions}
  spec.homepage      = "https://github.com/chaitanyav/partitions"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.4.18"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "minitest", "~> 5.19.0"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
end
