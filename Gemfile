source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'
gem 'rails',                        '~> 6.0.3', '>= 6.0.3.2'
gem 'bcrypt',                       '3.1.12'
gem 'bootstrap-sass',               '3.4.1'
gem 'puma',                         '~> 4.1'
gem 'sass-rails',                   '>= 6'
gem 'webpacker',                    '~> 4.0'
gem 'turbolinks',                   '~> 5'
gem 'jbuilder',                     '~> 2.7'
gem 'bootsnap',                     '>= 1.4.2', require: false

group :development, :test do
  gem 'sqlite3',                    '~> 1.4'
  gem 'byebug',                     platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',                '>= 3.3.0'
  gem 'listen',                     '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',      '~> 2.0.0'
end

group :test do
  gem 'capybara',                   '3.28.0'
  gem 'selenium-webdriver',         '3.142.4'
  gem 'webdrivers',                 '4.1.2'
  gem 'rails-controller-testing',   '1.0.4'
  gem 'minitest',                   '5.11.3'
  gem 'minitest-reporters',         '1.3.8'
  gem 'guard',                      '2.15.0'
  gem 'guard-minitest',             '2.4.6'
end

group :production do
  gem 'pg',                         '1.2.3'
end
