#Read txt file with list of active relevancy pages. Navigates to each page verify that each page will load correctly.
#Some pages may not be merchandized but still checking for errors.

require "watir-webdriver"

	browser = Watir::Browser.new :chrome

		#testing environment Endpoint
		url = "http://www.hayneedle.com/"
		
		browser.goto(url)

		#wait for that stupid modal to pop up if on production and if there close it
		sleep 1
		if browser.a(:id, "hn_modal_close").exists?
			browser.a(:id, "hn_modal_close").click
		end

		#open relevancy text file and read each line
		File.open("../../Data/relevancy_pages.txt", "r").each_line.with_index do |line, counter|
			line.strip!
			put "#{counter + 1}: #{line}"

			changingURL = "http://www.#{line}.com/"

			browser.goto(changingURL)
			
			#check if hayneedle even loaded by looking for the hayneedle logo		
			begin 
				browser.img(:src, /Hayneedle_Logo.gif/).wait_until_present do
			end
				#if looking for logo times out, catch the error so that the test keeps running
				rescue Exception => e 
					puts "Site failed to load"
				end
			#look for a 404
			if browser.img(:src, /errorBanner.gif/).exists?
				puts "Relevancy Page 404"
			end

		file.close()
		

