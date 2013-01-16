# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shitate/version"


Gem::Specification.new do |gem|
  gem.authors       = ["Yoki Okawa"]
  gem.email         = ["okawa@nuwara-eliya.com"]
  gem.description   = %q{ Shitate allows you to set user/record specific preference for ActiveRecord objects. "Shitate" means "custom-made clothing" in Japanese. }
  gem.summary       = %q{Setting user/record specific preference for ActiveRecord objects}
  gem.homepage      = "http://github.com/yoki/shitate"
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "shitate"
  gem.require_paths = ["lib"]
  gem.version       = Shitate::VERSION
  gem.add_development_dependency 'ActiveRecord'
end

