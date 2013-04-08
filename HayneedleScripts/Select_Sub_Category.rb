require "watir-webdriver"

	browser = Watir::Browser.new :chrome
		
		#Testing adding comment
		#testing environment Endpoint
		url = "http://test.hayneedle.local"
		
		browser.goto(url)

			#check to see if survey modal pops up	
			if browser.a(:id, "hn_modal_close").exists?
				browser.a(:id, "hn_modal_close").click
			end

			#Enter 0 into the wrench tool to clear any session
			browser.img(:class, "floatLeft marginTopOnly1px").click
			browser.text_field(:id, "SRSInput").set("0")
			browser.form(:action, url + "/csi.cfm").submit

			#Hover Outdoor section and click Arbors
			browser.div(:id, "HN_Tab_1")
			browser.link(:class, "HN_Tab siteCategory1BD1 HN_TabF").hover
		
				browser.wait_until {browser.text.include? "Arbors"}

			browser.link(:text, "Arbors").click

			if browser.text.include?("Arbor Accessories")
    			puts "Test passed"
    		else
    			puts "TEST FAILED!!!"
  			end

