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

			#search for product begin
			browser.form(:id, "searchCatPri").text_field(:id, "HN_Search").set("hn-alz079")
			browser.form(:id, "searchCatPri").button(:id, "HN_SearchSubmit").click

			#on product page
			browser.div(:id, "ALZ079_AddToCart").click
						
				browser.wait_until {browser.text.include? "Added To Cart"}

			#clicking checkout in popup modal
			browser.a(:class, "HN_BtnLgP HN_Btn_RI block marginTopOnly10px").click
			
				browser.wait_until {browser.text.include? "ENTER YOUR SHIPPING & DELIVERY INFORMATION"}

			#On shipping info page, filling out shipping address

			browser.text_field(:name, "postalCode").set("68102")
			browser.text_field(:name, "address1").set("9394 W Dodge Rd")
			browser.text_field(:name, "address2").set("STE 300")
			browser.text_field(:name, "firstName").set("Dan")
			browser.text_field(:name, "lastName").set("Tester")
			browser.text_field(:name, "shipPhone").set("4021234567")

			#click proceed to billing
			browser.span(:class, "icon-right-open").click
			
			#make sure the billing address is filled out
			#will put conditional statement here later to make sure it equals the same on the shipping page
			browser.text_field(:id, "firstName").value

			#fill out billing address
			browser.wait_until {browser.text.include? "ENTER YOUR BILLING INFORMATION"}
			browser.wait_until {browser.text.include? "PAYMENT METHOD"}
			browser.text_field(:id, "cardNumber").set("4111111111111111")
			browser.select_list(:id, "expirationMonth").select("12 - December")
			browser.select_list(:id, "expirationYear").select("2023")
			browser.text_field(:id, "securityCode").set("123")

			#click review order
			browser.a(:class, "HN_BtnLgP HN_Btn_RI block reviewYourOrderButton marginTopOnly5px marginSides5px").click

      		if browser.text.include?("PLACE MY ORDER")
		    	puts "Test passed"
		    else
		   		puts "TEST FAILED!!!"
		   	end

