
Feature: All Site Smoke Test

  As a tester
  I want to go to every active niche site
  So that I can verify the site is working

  Scenario: Smoke Test
    Given I am on Hayneedles website
    When the sign in modal pops up, close it
    And open the list of active niche sites
    And verify that page loaded
    Then the results will display what sites did not load if any

