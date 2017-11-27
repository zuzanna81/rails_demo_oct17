Feature: List articles on a landing page
  As a visitor,
  When I visit the application's landing page
  I would like to see a list of all articles

  Scenario: View list of articles on the landing page
    Given I visit the landing page
    Then I should see "Learning Rails"
    And I should see "Rails is a pretty awesome web framework"
  
