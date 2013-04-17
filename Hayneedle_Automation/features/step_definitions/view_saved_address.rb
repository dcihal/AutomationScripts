When(/^I click on the Account drop down and click Sign In$/) do
  pending # express the regexp above with the code you wish you had
end

And(/^when the sign in modal pops up, I enter "(.*?)" and "(.*?)" for the username and password before clicking the sign in button$/) do |username, password|
    pending # express the regexp above with the code you wish you had
end

And(/^now hayneedle should be welcoming "(.*?)"$/) do |name|
    pending # express the regexp above with the code you wish you had
end

And(/^when I click the welcoming text, I will click to manager my profile$/) do
   pending # express the regexp above with the code you wish you had
end

And(/^I click Manage Your Address Book to see my saved address$/) do
   pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" with my saved addresses$/) do |expected|
  @browser.text.should include expected
 end