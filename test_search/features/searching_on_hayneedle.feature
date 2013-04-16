Feature: Hayneedle Search

  As a customer
  I want to search for a product
  So I can find a specific product

  Scenario: Searching for a product
    Given I am on Hayneedles website
    When I enter a search term
    And I click the Go button
    Then I should see a list of related products