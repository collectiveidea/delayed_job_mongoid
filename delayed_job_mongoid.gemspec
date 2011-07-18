# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name              = 'delayed_job_mongoid'
  s.summary           = "Mongoid backend for delayed_job"
  s.version           = '1.0.2'
  s.authors           = ['Chris Gaffney', 'Brandon Keepers']
  s.date              = Date.today.to_s
  s.email             = ['chris@collectiveidea.com', 'brandon@opensoul.com']
  s.extra_rdoc_files  = ["LICENSE", "README.md"]
  s.files             = Dir.glob("{lib,spec}/**/*") + %w[LICENSE README.md]
  s.homepage          = 'http://github.com/collectiveidea/delayed_job_mongoid'
  s.rdoc_options      = ['--charset=UTF-8']
  s.require_paths     = ['lib']
  s.test_files        = Dir.glob('spec/**/*')

  s.add_runtime_dependency      'mongoid',      '>= 2.0.0'
  s.add_runtime_dependency      'delayed_job',  '~> 2.1.1'
  s.add_development_dependency  'rspec',        '>= 2.0'
end

