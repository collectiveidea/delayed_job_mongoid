Gem::Specification.new do |spec|
  spec.add_dependency 'delayed_job', ['>= 3', '< 5']
  spec.add_dependency 'mongoid', '>= 7'
  spec.authors        = ['Chris Gaffney', 'Brandon Keepers', 'Erik Berlin']
  spec.email          = %w[chris@collectiveidea.com brandon@opensoul.com sferik@gmail.com]
  spec.files          = %w[CHANGELOG.md CONTRIBUTING.md LICENSE.md README.md delayed_job_mongoid.gemspec] + Dir['lib/**/*.rb']
  spec.homepage       = 'http://github.com/collectiveidea/delayed_job_mongoid'
  spec.licenses       = ['MIT']
  spec.name           = 'delayed_job_mongoid'
  spec.require_paths  = ['lib']
  spec.required_ruby_version = '>= 3.2'
  spec.summary        = 'Mongoid backend for delayed_job'
  spec.version        = '3.0.1'
  spec.metadata       = {
    'changelog_uri' => 'https://github.com/collectiveidea/delayed_job_mongoid/blob/master/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/collectiveidea/delayed_job_mongoid/issues',
    'source_code_uri' => 'https://github.com/collectiveidea/delayed_job_mongoid',
    'rubygems_mfa_required' => 'true'
  }
end
