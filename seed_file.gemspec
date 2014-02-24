Gem::Specification.new do |gem|
  gem.name          = 'seed_file'
  gem.version       = '0.1.0'
  gem.date          = '2014-02-23'
  gem.summary       = 'Seed ActiveRecord objects'
  gem.description   = 'Create ActiveRecord objects using a CSV file'
  gem.authors       = ['James Zhang']
  gem.email         = 'jamesfzhang@icloud.com'
  gem.homepage      = 'https://github.com/jamesfzhang/seed_file'
  gem.license       = 'MIT'
  gem.files         = Dir['README.md', 'MIT-LICENSE', 'lib/**/*', 'spec/**/*']
  gem.test_files    = Dir['spec/**/*']
  gem.require_paths = ['lib']

  gem.add_dependency             'activerecord'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'
end
