# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sisik/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["hasarin"]
  gem.email         = ["hasarin@iname.com"]
  gem.description   = %q{Simple ruby OpenSSL wrapper for symmetric cryptography}
  gem.summary       = %q{Simple ruby OpenSSL wrapper for symmetric cryptography. Currently support AES only.}
  gem.homepage      = ""
  gem.add_development_dependency 'rspec', '~> 2.8'
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sisik"
  gem.require_paths = ["lib"]
  gem.version       = Sisik::VERSION
end
