require "watir-webdriver"

	browser = Watir::Browser.new :chrome

		browser.goto("www.hayneedle.com")

			browser.a(:href => "/templates/hn_modals.cfm?mode=sign_in").click
				sleep 3
				
			browser.iframe(:id, "SignInUpIframe").text_field(:id, "si_email").set("automation@test.com")
			browser.iframe(:id, "SignInUpIframe").text_field(:id, "si_password").set("Hayneedle1")
			browser.iframe(:id, "SignInUpIframe").button(:class, "floatLeft").click
			
				sleep 3

			browser.form(:id, "searchCatPri").text_field(:id, "HN_Search").set("blah")
			browser.form(:id, "searchCatPri").button(:id, "HN_SearchSubmit").click

			if browser.text.include?("Update Your Profile Information")
		    	puts "Test passed"
		    else
		   		puts "TEST FAILED!!!"
		   	end		

