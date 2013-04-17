require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :chrome
  @url = 'http://www.hayneedle.com/'

end


After do
  @browser.close
end