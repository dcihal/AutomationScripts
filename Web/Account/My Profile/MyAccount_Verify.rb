require "watir-webdriver"

require 'win32ole' 

	browser = Watir::Browser.new :chrome
		
		excel = WIN32OLE::new("excel.Application")
		path = "C:/Users/dcihal/Documents/GitHub/AutomationScripts/Data/Login.xlsx"
		workbook = excel.Workbooks.Open(path)
		worksheet = workbook.WorkSheets(1) # Get first workbook
		env = worksheet.Range('D2').Value # Get the value at cell in worksheet.

		#Checking environment and setting url to match
			if env == "test"
				url = "http://test.hayneedle.local"
			elsif env == "stage"
				url = "http://stage.hayneedle.local"
			else env == "prod"
				url = "http://www.hayneedle.com"
			end

			if env == "test"
				env2 = "local"
			elsif env == "stage"
				env2 = "local"
			else env == "prod"
				env2 = "com"
			end

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

			browser.wait_until {browser.text.include? "Welcome Automation"}

			#Go to Manage Profile page
			browser.div(:id, "HN_Accounts_Btn").click
			
			#browser.a(:href, "https://accounts.hayneedle.com/account/global)_account.cfm")
			
			if env == "test"
				browser.div(:id, "HN_Accounts_DD").a(:href, "https://" + env + "accounts.hayneedle." + env2 + "/account/global_account.cfm").click
			elsif env == "stage"
				browser.div(:id, "HN_Accounts_DD").a(:href, "https://" + env + "accounts.hayneedle." + env2 + "/account/global_account.cfm").click
			else env == "prod"
				browser.div(:id, "HN_Accounts_DD").a(:href, "https://accounts.hayneedle." + env2 + "/account/global_account.cfm").click	
			end
						
			if browser.text.include?("Update Your Profile Information")
		    	puts "Test passed"
		    else
		   		puts "TEST FAILED!!!"
		   	end		
