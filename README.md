# Blog application and Acceptance-Unit Test Cycle with Ruby on Rails

## at CraftAcademy bootcamp week 5

**Assignment**

**Setting up the application**

1. Perform the following actions in your terminal:
* `gem install rails` (to install Rails if not yet done)
* `rails new *rails_demo* --database=postgresql --skip-test --skip-bundle`
* `cd rails_demo`
2. To set up Version Control:
* In your terminal run `git init`
* Head over to your GitHub account and create a new repository *rails_bdd*
* In your terminal run `git remote add origin <repo url>`
* Add, commit and push your code to GitHub
3. In Gemfile add *rspec-rails gem* to the dev and test group:
* ```group :development, :test do
    gem 'rspec-rails'
    gem 'should-matchers'
    gem 'factory_bot_rails'
  end```



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
