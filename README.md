# Blog application and Acceptance-Unit Test Cycle with Ruby on Rails

## at CraftAcademy bootcamp week 5

**Assignment**

**Setting up the application**

1. Perform the following actions in your terminal:
* `gem install rails` (to install Rails if not yet done)
* `rails new rails_demo --database=postgresql --skip-test --skip-bundle`
* `cd rails_demo`

2. To set up Version Control:
* In your terminal run `git init`
* Head over to your GitHub account and create a new repository *rails_bdd*
* In your terminal run `git remote add origin <repo url>`
* Add, commit and push your code to GitHub

3. In Gemfile add *rspec-rails* gem to the dev and test group:
* ```
group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end
```
* Run `bundle install`
* Run `bundle exec rails generate rspec:install`
4. Open spec/rails_helper.rb and add the following block:
```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```
5. Make the following modification to the config/application.rb file:
```
class Application < Rails::Application
  # Disable generation of helpers, javascripts, css, and view, helper, routing and controller specs
  config.generators do |generate|
    generate.helper false
    generate.assets false
    generate.view_specs false
    generate.helper_specs false
    generate.routing_specs false
    generate.controller_specs false
  end
  ...
end
```
6. Open .rspec file and add the following lines at the top:
```
--color
--format documentation
```
7. Run `bundle exec rspec` to check if rspec works
8. Modify Gemfile with *cucumber-rails* and *database_cleaner* gems:
* ```
group :development, :test do
  [...]
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end
```
* Run `bundle install`
* Run `bundle exec rails generate cucumber:install`
9. Run `rails db:create` & `rails db:migrate`
10. Run `bundle exec cucumber`to check if cucumber works





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
