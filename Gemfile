source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "cssbundling-rails"
gem "devise"
gem "devise-i18n"
gem "font-awesome-rails"
gem "jsbundling-rails"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "rails-i18n"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "web-console"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :production do
  gem "pg"
end
