source 'http://rubygems.org'

gem 'rails', '3.1.10'
gem 'mysql2'
gem "redcarpet"
gem "albino"
gem 'capistrano', '2.5.19'
gem 'nokogiri'
gem 'authlogic'
gem 'paperclip'
gem 'nested_form'
gem 'aws-s3'
gem 'aws-sdk'

group :production do
  gem "exception_notification"
end

group :development do
  gem 'thin'
  gem 'rspec-rails'
  gem 'bullet'
  gem 'ruby-growl'
  gem 'xmpp4r'
  gem 'jasmine'
  gem 'zencoder-fetcher'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  gem "rspec-rails"
  gem 'turn', '~> 0.8.3', :require => false
end