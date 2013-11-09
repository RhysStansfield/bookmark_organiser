Feature: Signing In
  In order to access my saved bookmarks
  As a user
  I need to be able to log in

  Background: User navigates to sign in page
    Given I am an existing user
    Given I click the sign in button


  Scenario: User signs in
    When I enter my details correctly and click the sign in button
    Then I should be welcomed back

  Scenario: User attempts to log in with incorrect details
    When I enter my details incorrectly and click the sign in button
    Then I should not be logged in
    And I should see an error message 
