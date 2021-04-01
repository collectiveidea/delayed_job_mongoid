Gem::Specification.new do |spec|
  spec.add_dependency 'delayed_job', ['>= 3.0', '< 5']
  spec.add_dependency 'mongoid', '>= 5.0'
  spec.authors        = ['Chris Gaffney', 'Brandon Keepers', 'Erik Michaels-Ober']
  spec.email          = ['chris@collectiveidea.com', 'brandon@opensoul.com', 'sferik@gmail.com']
  spec.files          = %w[CHANGELOG.md CONTRIBUTING.md LICENSE.md README.md delayed_job_mongoid.gemspec] + Dir['lib/**/*.rb']
  spec.homepage       = 'http://github.com/collectiveidea/delayed_job_mongoid'
  spec.licenses       = ['MIT']
  spec.name           = 'delayed_job_mongoid'
  spec.require_paths  = ['lib']
  spec.summary        = 'Mongoid backend for delayed_job'
  spec.version        = '3.0.0'
end
