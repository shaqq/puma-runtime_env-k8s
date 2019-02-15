
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "puma-runtime_env-k8s"
  spec.version       = "0.0.2"
  spec.authors       = ["shaker"]
  spec.email         = ["shakerislam@gmail.com"]

  spec.summary       = %q{Update ENV vars at runtime through k8s mounted secrets}
  spec.description   = %q{Update ENV vars at runtime through k8s mounted secrets}
  spec.homepage      = "https://github.com/shaqq/puma-runtime_env-k8s"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'puma-runtime_env'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
