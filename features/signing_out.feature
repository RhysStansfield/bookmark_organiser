Feature: Signing out
  In order to keep my bookmarks secure when I'm not at the computer
  As a busy user who isn't always around
  I need to be able to log out of my account

  Scenario: User signs out
    Given I am logged in
    When I follow log out
    Then I should no longer be on the system