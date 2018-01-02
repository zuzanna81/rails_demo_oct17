Feature: List articles on a landing page
  As a visitor,
  When I visit the application's landing page
  I would like to see a list of all articles

  Background:
    Given the following articles exists
      | title                    | content                                                |
      | Learning Rails           | Rails is a pretty awesome web framework                |
      | 4 weeks down, 8 to go :) | It's week 5 of the camp and I'm still going strong ;-) |

  Scenario: View list of articles on the landing page
    When I visit the landing page
    Then I should see "Learning Rails"
    And I should see "Rails is a pretty awesome web framework"
    Then I should see "4 weeks down, 8 to go :)"
    And I should see "It's week 5 of the camp and I'm still going strong ;-)"
