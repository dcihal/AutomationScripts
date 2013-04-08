require "watir-webdriver"

	browser = Watir::Browser.new :chrome
		
		#testing environment Endpoint
		url = "http://stage.hayneedle.local"
		
		browser.goto(url)

			#check to see if survey modal pops up	
			if browser.a(:id, "hn_modal_close").exists?
				browser.a(:id, "hn_modal_close").click
			end

			#Enter 0 into the wrench tool to clear any session
			browser.img(:class, "floatLeft marginTopOnly1px").click
			browser.text_field(:id, "SRSInput").set("0")
			browser.form(:action, url + "/csi.cfm").submit

			#sign in process begins	
			browser.div(:id, "HN_Accounts_Btn").click
			browser.div(:id, "HN_Accounts_DD").a(:href, "/templates/hn_modals.cfm?mode=sign_in").click
				
				browser.wait_until {browser.text.include? "HAYNEEDLE ACCOUNTS"}
	
			browser.frame(:id, "SignInUpIframe").text_field(:id, "si_email").set("automation@test.com")
			browser.frame(:id, "SignInUpIframe").text_field(:id, "si_password").set("Hayneedle1")
			browser.frame(:id, "SignInUpIframe").button(:class, "floatLeft").click

				sleep 3

			#Go to Manage Profile page
			browser.div(:id, "HN_Accounts_Btn").click
			browser.a(:href, "https://accounts.hayneedle.com/account/global)_account.cfm")
			browser.link(:text, "Manage Profile").click
						
			if browser.text.include?("Update Your Profile Information")
		    	puts "Test passed"
		    else
		   		puts "TEST FAILED!!!"
		   	end		
