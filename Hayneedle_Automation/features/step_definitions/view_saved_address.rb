require_relative 'master_method_tests'

include MasterMethodTests

#Given(/^I am on Hayneedles website$/) do

  #goto_hayneedle_site
  #close_popup

#end

When(/^I click on the Account drop down and click Sign In$/) do
  @browser.div(:id, "HN_Accounts_Btn").click
  @browser.div(:id, "HN_Accounts_DD").a(:href, "/templates/hn_modals.cfm?mode=sign_in").click
end

And(/^when the sign in modal pops up, I enter "(.*?)" and "(.*?)" for the username and password before clicking the sign in button$/) do |username, password|
  sign_in(username, password)
end

And(/^now hayneedle should be welcoming "(.*?)"$/) do |name|
  @browser.img(:src, /Hayneedle_Logo.gif/).wait_until_present
  @browser.text.should include ("Welcome")
end

And(/^when I click the welcoming text, I will click to manager my profile$/) do
  @browser.div(:id, "HN_Accounts_Btn").click
  @browser.div(:id, "HN_Accounts_DD").a(:text, "Manage Profile").click
end

And(/^I click Manage Your Address Book to see my saved address$/) do
  @browser.a(:title, "Manage Your Address Book").click
end

Then(/^I should see "(.*?)" with my saved addresses$/) do |expected|
  @browser.text.should include expected
 end