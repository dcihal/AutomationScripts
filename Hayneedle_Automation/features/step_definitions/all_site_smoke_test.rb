require_relative 'master_method_tests'

include MasterMethodTests

#Given(/^I am on Hayneedles website$/) do
#
#end

When(/^the sign in modal pops up, close it$/) do
   close_popup
end

And(/^open the list of active niche sites$/) do

  if @browser.url == 'http://www.hayneedle.com/'
    env = 'http://www.'
    tld = '.com/'
  elsif @browser.url == 'http://stage.hayneedle.local/'
    env = 'http://stage.'
    tld = '.local/'
  elsif @browser.url == 'http://test.hayneedle.local/'
    env = 'http://test.'
    tld = '.local/'
  end

  open_txt_file('activeSites.txt')

  changingURL = env + line + tld

  @browser.goto(changingURL)
end

And(/^verify that page loaded$/) do

end

Then(/^the results will display what sites did not load if any$/) do

end