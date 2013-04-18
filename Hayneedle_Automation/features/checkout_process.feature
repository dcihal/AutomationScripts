@regression, @search, @signin, @checkout
Feature: Hayneedle Checkout Process

  As a customer
  I want to search for a product and sign in
  So I can purchase said product

  Scenario: Checkout process
    Given I am on Hayneedles website
    When the sign in modal pops up, I enter "automation@test.com" and "Hayneedle1" for the username and password before clicking the sign in button
    #And now hayneedle should be welcoming "Automation"
    And I enter SKU "HN-ALZ079" into the search box
    And I click the Add To Cart button
    And I click the checkout button
    And I fill in all my shipping information with postal_code "68102", "9394 W Dodge Rd", "STE 300", "Dan", "Tester", "4021234567"
    And I fill in all my billing information
    Then I should be able to review my order prior to placing the order

