Feature: Viewing links
  In order to avoid having a huge memory
  As a person who loves surfing the web
  I want to view the links I saved before

  Scenario: Viewing a link
    Given I have saved the following links:
      |title       |uri               |description          |
      |Superpage   |http://example.com|Really useful linkage|
    And I am on the homepage
    Then I should see Superpage