Feature: Add comments to article
  As a visitor
  In order to share my thoughts about an article
  I would like to add comments to an article

  Background:
    Given the following articles exists
      | title           | content                                 |
      | Learning Rails  | Rails is a pretty awesome web framework |


  Scenario: Adding comments to article [Happy Path]
    Given I visit the "Learning Rails" page
    When I fill in "Body" with "This looks sweet!"
    And I click the "Create Comment" button
    Then I should see "Comment was successfully created."
    And I should see "This looks sweet!"
