Feature: Saving links
  In order to save links
  As a person who wants to save links
  I want to be able to enter links to be saved

  Background:
    Given I am on the homepage
    When I follow "Add Link"
    And I fill in "title" with "Drummery"
    And I fill in "uri" with "http://www.youtube.com/watch?v=CL_6gb4fVHo"
    And I fill in "description" with "George Kollias freaking out"

  Scenario: Saving a link
    And I press "Add Link"
    Then I should have a link in my database
    And I should see "Drummery"

  Scenario: Saving a link with a description
    Given I am using the bookmark manager
    When I add a link with a description
    Then the link should have a description

  Scenario: Saving a link with a tag
    And I fill in "tags" with "drum badassery"
    And I press "Add Link"
    Then I should have a link in my database
    And I should see "Drummery"
    And I should see "drum"