# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.add_dependency    'delayed_job', ['>= 3.0', '< 5']
  spec.add_dependency    'mongoid', ['>= 3.0', '< 5']
  spec.authors         = ["Chris Gaffney", "Brandon Keepers", "Erik Michaels-Ober"]
  spec.email           = ['chris@collectiveidea.com', 'brandon@opensoul.com', 'sferik@gmail.com']
  spec.files           = %w(CHANGELOG.md CONTRIBUTING.md LICENSE.md README.md Rakefile delayed_job_mongoid.gemspec)
  spec.files          += Dir.glob("lib/**/*.rb")
  spec.files          += Dir.glob("spec/**/*")
  spec.homepage        = 'http://github.com/collectiveidea/delayed_job_mongoid'
  spec.licenses        = ['MIT']
  spec.name            = 'delayed_job_mongoid'
  spec.require_paths   = ['lib']
  spec.summary         = "Mongoid backend for delayed_job"
  spec.test_files      = Dir.glob('spec/**/*')
  spec.version         = '2.0.0'
end

