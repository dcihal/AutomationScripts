Feature: Hayneedle Search

  As a customer
  I want to search for a product
  So I can find a specific product

  Scenario: Searching for a product
    Given I am on Hayneedles website on "http://www.hayneedle.com/" environment
    When I enter "Red Couch" into the search box
    And I click the Go button
    Then I should see a list of related products and "Red Couch" at the top of the result list