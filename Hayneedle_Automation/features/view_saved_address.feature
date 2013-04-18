@regression, @signin
Feature: Signing into Hayneedle Account

  As a customer
  I want to sign into my account
  So that I can see my saved addresses

  Scenario: Signing in
    Given I am on Hayneedles website
    When I click on the Account drop down and click Sign In
    And when the sign in modal pops up, I enter "automation@test.com" and "Hayneedle1" for the username and password before clicking the sign in button
    And now hayneedle should be welcoming "Automation"
    And when I click the welcoming text, I will click to manage my profile
    And I click Manage Your Address Book to see my saved address
    Then I should see "Address Book" with my saved addresses
