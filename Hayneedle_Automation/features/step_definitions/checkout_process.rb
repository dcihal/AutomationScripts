require_relative 'master_method_tests'

include MasterMethodTests

#Given(/^I am on Hayneedles website$/) do

#goto_hayneedle_site
#close_popup

#end

When (/^the sign in modal pops up, I enter "(.*?)" and "(.*?)" for the username and password before clicking the sign in button$/) do |username, password|
  @browser.div(:id, 'HN_Accounts_Btn').click
  @browser.div(:id, 'HN_Accounts_DD').a(:href, '/templates/hn_modals.cfm?mode=sign_in').click
  sign_in(username, password)
end

# And statement 'And now hayneedle should be welcoming "Automation"' included because of view_saved_address.feature
#And(/^now hayneedle should be welcoming "(.*?)"$/) do |name|
  #@browser.img(:src, /Hayneedle_Logo.gif/).wait_until_present
  #@browser.text.should include name
#end


And(/^I enter SKU "(.*?)" into the search box$/) do |sku|
  @browser.form(:id, "searchCatPri").text_field(:id, "HN_Search").set(sku)
  @browser.form(:id, "searchCatPri").button(:id, "HN_SearchSubmit").click
end

And(/^I click the Add To Cart button$/) do
  @browser.div(:id, "ALZ079_AddToCart").click
  @browser.wait_until {@browser.text.include? "Added To Cart"}
end

And(/^I click the checkout button$/) do
  @browser.a(:class, "HN_BtnLgP HN_Btn_RI block marginTopOnly10px").click
  @browser.wait_until {@browser.text.include? "ENTER YOUR SHIPPING & DELIVERY INFORMATION"}
end

And(/^I fill in all my shipping information with "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |postal_code, address1, address2, first_name, last_name, shipping_phone|
  @browser.text_field(:name, "postalCode").set(postal_code)
  @browser.text_field(:name, "address1").set(address1)
  @browser.text_field(:name, "address2").set(address2)
  @browser.text_field(:name, "firstName").set(first_name)
  @browser.text_field(:name, "lastName").set(last_name)
  @browser.text_field(:name, "shipPhone").set(shipping_phone)
  @browser.span(:class, "icon-right-open").click
end

And(/^I fill in all my billing information with "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |card_number, expiration_month, expiration_year, security_code|
  @browser.wait_until {@browser.text.include? "ENTER YOUR BILLING INFORMATION"}
  @browser.wait_until {@browser.text.include? "PAYMENT METHOD"}
  @browser.text_field(:id, "cardNumber").set(card_number)
  @browser.select_list(:id, "expirationMonth").select(expiration_month)
  @browser.select_list(:id, "expirationYear").select(expiration_year)
  @browser.text_field(:id, "securityCode").set(security_code)
  @browser.a(:class, "HN_BtnLgP HN_Btn_RI block reviewYourOrderButton marginTopOnly5px marginSides5px").click
end

Then(/^I should be able to review my order prior to placing the order$/) do
  @browser.text.should include ("PLACE MY ORDER")
end