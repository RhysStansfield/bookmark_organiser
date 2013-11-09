Feature: Reseting password
  In order to access my account if I forget my password
  As someone who is forgetful
  I need to be able to reset my password

  Background: User exists but is not signed in
    Given I am an existing user
    And I click the sign in button

  Scenario: Forgetting password
    And I follow the "Forgotten Password?" link
    When I request a new password
    Then I should be able to set a new password
    And log in
