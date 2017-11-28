Given('I visit the landing page') do
  visit '/'
end

Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Given("the following articles exists") do |table|
  table.hashes.each do |article|
    FactoryBot.create(:article, article)
  end
end

When("I click {string} link") do |link|
  click_link link
end

When("I fill in {string} with {string}") do |field_name, content|
  fill_in field_name, with: content
end

When("I click {string} button") do |button|
  click_button button
end

Then("I should be on {string} page") do |article_title|
  article = Article.find_by(title: article_title)
  expect(page.current_path).to eq "/articles/#{article.id}"
end

Then("show me the page") do
  save_and_open_page
end
