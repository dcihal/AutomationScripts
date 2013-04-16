#This test will click through all of the footer links verifing that function as expected.

require "watir-webdriver"
require "win32ole"

require "test/unit"

class FooterLinks < Test::Unit::TestCase
	def test_AboutHayneedle

		browser = Watir::Browser.new :chrome

		excel = WIN32OLE::new("excel.Application")

		path = File.expand_path("../../Data/Login.xlsx")

		workbook = excel.Workbooks.Open(path)
		worksheet = workbook.Worksheets(1)

		env = worksheet.Range('D2').Value #get the value of cell D2

		if env == "test"
			url = "http://test.hayneedle.local"
		elsif env == "stage"
			url = "http://stage.hayneede.local"
		elsif env == "prod"
			url = "http://www.hayneedle.com"
		else
			puts "Not a validate environment name in the login.xlsx file"
		end

		

		#Click through "About Hayneedle" footer links 
			
				browser.goto(url)

		sleep 1
		if browser.a(:id, "hn_modal_close").exists?
			browser.a(:id, "hn_modal_close").click
		end
		sleep 1

				browser.a(:text, "Our Story").click
		
				#read the title of the page and take a screenshot to verify it loaded correctly
				assert(browser.title.include?("Hayneedle, Inc.   » About Us"))
			end
		end

		#browser.a(:text, "In The News").click



		#browser.a(:text, "Careers").click



		#browser.a(:text, "Site Map").click



		#browser.a(:text, "Satisfaction Guarantee").click



