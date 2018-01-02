# Blog application and Acceptance-Unit Test Cycle with Ruby on Rails

## at CraftAcademy bootcamp week 5

**Assignment**
The purpose of this assignment is to get you familiar with how routes, controllers, and views interact with each other within the context of a rails application

**Set up the application**

1. Perform the following actions in your **terminal**:
* `gem install rails` (to install Rails if not yet done)
* `rails new rails_demo --database=postgresql --skip-test --skip-bundle`
* `cd rails_demo`
2. To set up **Version Control**:
* In your terminal run `git init`
* Head over to your GitHub account and create a new repository *rails_bdd*
* In your terminal run `git remote add origin <repo url>`
* Add, commit and push your code to GitHub
3. Modify **Gemfile** with gems:
```
group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end
```
* Run `bundle install`
* Run `bundle exec rails generate rspec:install`
4. Open **spec/rails_helper.rb** and add the following block:
```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```
5. Make the following modification to the **config/application.rb** file:
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
6. Open **.rspec** file and add the following lines:
```
--color
--format documentation
```
7. Run `bundle exec rspec` to check if rspec works
8. Modify **Gemfile** with new gems:
```
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

**Display list of articles on the landing page - Acceptance-Unit Test Cycle**

1. Create a high-level test file:
* `touch features/list_articles.feature`
2. Add Feature and Scenario
```
Feature: List articles on landing page
  As a visitor,
  when I visit the application's landing page,
  I would like to see a list of articles

  Scenario: Viewing list of articles on application's landing page
    When I am on the landing page
    Then I should see "A breaking news item"
    And I should see "Some really breaking action"
```
* Run `bundle exec cucumber features/list_articles.feature`
3. Copy the snippets
4. Create a new file:
* `touch features/step_definitions/landing_page_steps.rb`
* Add the snippets and modify step_definitions:
```
When(/^I am on the landing page$/) do
  visit root_path
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end
```
* Run `cucumber`
5. Modify **config/routes.rb**:
```
Rails.application.routes.draw do
  root controller: :landing, action: :index
end
```
6. Run `rails generate controller landing index `, it will:
```
    create app/controllers/landing_controller.rb
    route get 'landing/index'
    invoke erb
    create app/views/landing
    create app/views/landing/index.html.erb
    invoke rspec
```
7. Add some html paragraph to the **app/views/landing/index.html.erb** file. All tests should now be green.
8. Modify **features/list_articles.feature** with Background (below Feature description, nested):
```
Background:
  Given the following articles exists
    | title                | content                            |
    | A breaking news item | Some really breaking action        |
    | Learn Rails 5        | Build awesome rails applications   |
```
9. Run cucumber and copy the snippet to the **features/step_definitions/landing_page_steps.rb** file, modify the file:
```
Given(/^the following articles exists$/) do |table|
  table.hashes.each do |hash|
    Article.create!(hash)
  end
end
```
10. Create a lower-level test file (rspec):
* `touch spec/models/article_spec.rb`
11. Add specs to the file:
```
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end
end
```
12. Create a model: `rails generate model Article title:string content:text`
13. Run `rails db:migrate`
14. Modify **app/models/article.rb**:
```
class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
end
```
* Run rspec and cucumber
15. Modify **landing_controller**:
```
class LandingController < ApplicationController
  def index
    @articles = Article.all
  end
end
```
16. Modify **app/views/landing/index.html.erb**:
```
<ul>
  <% @articles.each do |article| %>
    <li>
      <%= article.title %><br />
      <%= article.content %>
    </li>
  <% end %>
</ul>
```
