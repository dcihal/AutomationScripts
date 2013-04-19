require 'watir-webdriver'


  browser = Watir::Browser.new :chrome
Before do
  @browser = browser
end


After do
  #@browser.close
end