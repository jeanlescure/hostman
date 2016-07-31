# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hostman/version', __FILE__)

Gem::Specification.new do |gem|  
  gem.authors       = ["Jean M. Lescure"]
  gem.email         = ["jean@ticowebmedia.com"]
  gem.description   = %q{Easily block and unblock hosts on your computer}
  gem.summary       = %q{Manage the blocked hosts in /etc/hosts}
  gem.homepage      = "http://jeanlescure.io"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ["hostman"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hostman"
  gem.require_paths = ["lib"]
  gem.version       = Hostman::VERSION

  gem.add_development_dependency "bundler", "~> 1.12"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "minitest", "~> 5.0"
  gem.add_runtime_dependency "slop", "4.3.0"
end
