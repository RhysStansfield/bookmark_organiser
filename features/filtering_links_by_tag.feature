Feature: Filtering links
  In order to find bookmarks easily
  As a person who has a lot of bookmarks
  I want to be able to sort my links by tags

  Scenario: Filtering links by tag
    Given I have the tag "derp"
    When I follow "Tags"
    Then I should see "derp"

  Scenario: Finding links with same tag
    Given I have a link with the tag "derp"
    When I follow "derp"
    Then I should see all links tagged with "derp"