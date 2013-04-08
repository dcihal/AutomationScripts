#Read txt file with list of active relevancy pages. Navigates to each page verify that each page will load correctly.
#Some pages may not be merchandized but still checking for errors.

require "watir-webdriver"

	browser = Watir::Browser.new :chrome

		#testing environment Endpoint
		url = "http://www.hayneedle.com/"
		
		browser.goto(url)

		if browser.a(:id, "hn_modal_close").exists?
			browser.a(:id, "hn_modal_close").wait_until_present
		end

		#open relevancy text file and read each line
		counter = 1
		file = File.new("Data/relevancy_pages.txt", "r")
			while (line = file.gets)
					puts "#{counter}: #{line}"
					counter = counter + 1
					browser.goto(url + line)
					
					browser.img(:src, /Hayneedle_Logo.gif/).wait_until_present

					if browser.img(:src, /errorBanner.gif/).exists?
						puts "Relevancy Page 404"
					end
			end
		file.close()
		

