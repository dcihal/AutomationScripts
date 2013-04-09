#This will be a smoke test that hits every active site have verifies that it is run and running at the least.

require "watir-webdriver"

	browser = Watir::Browser.new :chrome

		#testing environment Endpoint
		url = "http://www.hayneedle.com/"
		
		browser.goto(url)

		if browser.a(:id, "hn_modal_close").exists?
			browser.a(:id, "hn_modal_close").wait_until_present
		end

		sleep 2
		#open relevancy text file and read each line

		File.open("Data/activeSites.txt").each_line.with_index do |line, counter|
			line.strip!
			puts "#{counter + 1}: #{line}"

			changingURL = "http://www.#{line}.com/"

					browser.goto(changingURL)
					
					begin
						browser.img(:src, /nicheLogo/).wait_until_present(5) do
					end

						#Catch a error if that element does not exist. Display something to a log instead of crapping out the test.
						rescue Exception => e
							puts "Not a Active Site"
							if browser.img(:src, /nicheLogo/).exists?
								puts "Redirected to " + browser.url
							end
						end
			end
		file.close()