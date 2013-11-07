Feature: Signing Up
  In order to repeatedly access my saved bookmarks
  As a user
  I need to be able to sign up

  Scenario: User signs up
    Given I am on the home page
    When I click on the sign up button
    And Enter my details
    Then I should have an account
    And I should see a welcome message

  Scenario: User gives wrong password in password confirmation
    Given I am on the sign up page
    When I enter some different in the password confirmation box
    Then I should not have an account
    And I should still be on the sign up page

  Scenario: If user tries to sign up with an already taken email address
    Given I already have an account
    When I try to sign up with the same email
    Then I should still be on the sign up page and see an error message