
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yun-pian/version"

Gem::Specification.new do |spec|
  spec.name          = "yun-pian"
  spec.version       = YunPian::VERSION
  spec.authors       = ["glz"]
  spec.email         = ["glzztt@gmail.com"]

  spec.summary       = %q{Ruby SDK for https://www.yunpian.com/ }
  spec.description   = %q{Ruby SDK for https:://www.yunpian.com/v2 api}
  spec.homepage      = "https://github.com/Gaolz/yun-pian"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "webmock", "~> 3"
end
