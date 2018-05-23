
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "timed_deprecation/version"

Gem::Specification.new do |spec|
  spec.name          = "timed_deprecation"
  spec.version       = TimedDeprecation::VERSION
  spec.authors       = ["Drivy", "Tim Petricola", "Marc G Gauthier"]
  spec.email         = ["oss@drivy.com"]

  spec.summary       = "Defining future deprecations"
  spec.description   = ""
  spec.homepage      = "https://github.com/drivy/timed_deprecation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "simplecov"

  spec.add_runtime_dependency "activesupport", "~>5.1", "<5.2"
end
