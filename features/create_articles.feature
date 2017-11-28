Feature: Create articles
  As a blogger
  In order to share my content with everyone
  I would like to be able to create Articles

  Background:
    Given I visit the landing page
    When I click "new article" link

  Scenario: Successfully create an article [Happy Path]
    When I fill in "Title" with "Learning Rails 5"
    And I fill in "Content" with "Excited about learning a new framework"
    And I click "Create Article" button
    Then I should be on "Learning Rails 5" page
    And I should see "Article was successfully created."
    And I should see "Learning Rails 5"

  Scenario: creating another article works the same
    When I fill in "Title" with "Too much magic"
    And I fill in "Content" with "Trying to wrap my head around rails magic"
    And I click "Create Article" button
    Then I should be on "Too much magic" page
    And I should see "Too much magic"
    And I should see "Trying to wrap my head around rails magic"

  # Scenario: Blogger doesn't enter a title for the article [Sad Path]
  #   When I fill in "Content" with "Excited about learning a new framework"
  #   And I click "Create Article" button
  #   Then I should see "Title can't be blank"
