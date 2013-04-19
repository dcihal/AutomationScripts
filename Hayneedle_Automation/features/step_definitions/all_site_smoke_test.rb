require_relative 'master_method_tests'

include MasterMethodTests

#Given(/^I am on Hayneedles website$/) do
#
#end

When(/^the sign in modal pops up, close it$/) do
   close_popup
end

And(/^enter the "(.*?)" into the browser$/) do |url|

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

  @changingURL = env + url + tld

  @browser.goto(@changingURL)
end

Then(/^verify that page loaded and report any sites that didnt load$/) do

  #begin
    @browser.img(:src, /nicheLogo/).wait_until_present(5) #do
  #end
  #rescue Exception => e
  #  puts "Site #{@changingURL} Did not load! #{e}" #if not @browser.img(:src, /nicheLogo/).exists?
  #end
end
