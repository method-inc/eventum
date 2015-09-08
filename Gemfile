source "https://rubygems.org"
gemspec

group :test do
  gem "coveralls", require: false
  gem "simplecov", require: false
end

group :development, :test do
  gem "pry-byebug"
  gem "guard"
  gem "guard-rspec", require: false
  gem "guard-rubocop", require: false
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end
