require "watir-webdriver"

	browser = Watir::Browser.new :chrome
		
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

			#sign in process begins	
			browser.div(:id, "HN_Accounts_Btn").click
			browser.div(:id, "HN_Accounts_DD").a(:href, "/templates/hn_modals.cfm?mode=sign_in").click
				
				browser.wait_until {browser.text.include? "HAYNEEDLE ACCOUNTS"}

			browser.frame(:id, "SignInUpIframe").text_field(:id, "si_email").set("automation@test.com")
			browser.frame(:id, "SignInUpIframe").text_field(:id, "si_password").set("Hayneedle1")
			browser.frame(:id, "SignInUpIframe").button(:class, "floatLeft").click

			#Search, filter, and verify it worked
			browser.form(:id, "searchCatPri").text_field(:id, "HN_Search").set("chair")
			browser.form(:id, "searchCatPri").button(:id, "HN_SearchSubmit").click
			
				browser.wait_until {browser.div(:class, "HN_RL_Filters facets").exists?}

			browser.div(:class, "HN_RL_Filters facets")
			browser.span(:id, "cell_price_underd500").click

			if browser.text.include?("Under $500")
    			puts "Test passed"
    		else
   				puts "TEST FAILED!!!"
   			end
