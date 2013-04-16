Given(/^I am on Hayneedles website on "(.*?)" environment$/) do |url|
  @browser.goto(url)

  sleep 1
  #check to see if survey modal pops up
  if @browser.a(:id, 'hn_modal_close').exists?
    @browser.a(:id, 'hn_modal_close').click
  end
  sleep 1

end

When(/^I enter "(.*?)" into the search box$/) do |search_term|
  @browser.text_field(:id, 'HN_Search').set(search_term)
end

And(/^I click the Go button$/) do
  @browser.button(:id, 'HN_SearchSubmit').click
end

Then(/^I should see a list of related products$/) do
  fail unless @browser.text.include? 'Red Couch'
end