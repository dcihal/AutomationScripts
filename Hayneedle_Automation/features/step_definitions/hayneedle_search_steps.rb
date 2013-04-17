require_relative 'master_method_tests'

include MasterMethodTests

Given(/^I am on Hayneedles website$/) do

  goto_hayneedle_site
  close_popup
  signin(@username, @password)

end

When(/^I enter "(.*?)" into the search box$/) do |search_term|
  @browser.text_field(:id, 'HN_Search').set(search_term)
end

And(/^I click the Go button$/) do
  @browser.button(:id, 'HN_SearchSubmit').click
end

Then(/^I should see a list of related products and "(.*?)" at the top of the result list$/) do |expected|
  @browser.text.should include expected
end