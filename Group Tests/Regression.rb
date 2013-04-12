require "watir-webdriver"
require 'test/unit'
require 'win32ole'

class Test1 < Test::Unit::TestCase

    def test_SearchAndNarrow()
    	
    	browser = Watir::Browser.new :chrome    

    	excel = WIN32OLE::new("excel.Application")
    	path = File.expand_path("../Data/Login.xlsx") 
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


        browser.goto(url)

sleep 1
        	if browser.a(:id, "hn_modal_close").exists?
				browser.a(:id, "hn_modal_close").click
			end
sleep 1

			#Enter 0 into the wrench tool to clear any session
			browser.img(:class, "floatLeft marginTopOnly1px").click
			browser.text_field(:id, "SRSInput").set("0")
			browser.form(:action, url + "/csi.cfm").submit
			
			#Search, filter, and verify it worked
			browser.form(:id, "searchCatPri").text_field(:id, "HN_Search").set("chair")
			browser.form(:id, "searchCatPri").button(:id, "HN_SearchSubmit").click
			
				browser.wait_until {browser.div(:class, "HN_RL_Filters facets").exists?}

			browser.div(:class, "HN_RL_Filters facets")
			browser.span(:id, "cell_price_underd600").click

			assert(browser.text.include?("Under $600"))
			  
			browser.close

    end

    def test_SearchSubCategory

    	browser = Watir::Browser.new :chrome

    	excel = WIN32OLE::new("excel.Application")
    	path = File.expand_path("../Data/Login.xlsx") 
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

    	browser.goto(url)

sleep 1
			#check to see if survey modal pops up	
			if browser.a(:id, "hn_modal_close").exists?
				browser.a(:id, "hn_modal_close").click
			end
sleep 1

			#Enter 0 into the wrench tool to clear any session
			browser.img(:class, "floatLeft marginTopOnly1px").click
			browser.text_field(:id, "SRSInput").set("0")
			browser.form(:action, url + "/csi.cfm").submit

			#Hover Outdoor section and click Arbors
			browser.div(:id, "HN_Tab_1")
			browser.link(:class, "HN_Tab siteCategory1BD1 HN_TabF").hover
		
				browser.wait_until {browser.text.include? "Arbors"}

			browser.link(:text, "Arbors").click

    		assert(browser.text.include?("Arbor Accessories"))	

    		browser.close

    end
    
    def test_CheckOutProcess

    browser = Watir::Browser.new :chrome
		
		excel = WIN32OLE::new("excel.Application")
    	path = File.expand_path("../Data/Login.xlsx") 
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

		browser.goto(url)

sleep 1
			#check to see if survey modal pops up	
			if browser.a(:id, "hn_modal_close").exists?
				browser.a(:id, "hn_modal_close").click
			end
sleep 1

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
						
				browser.wait_until {browser.text.include? "Cart Subtotal"}

			#clicking checkout in popup modal
			browser.img(:class, "floatRight marginRight1px").click
			
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
      	
      		assert(browser.text.include?("PLACE MY ORDER"))
			  
			browser.close	

    end	

    def test_MyAccountVerify

    	browser = Watir::Browser.new :chrome
		
		excel = WIN32OLE::new("excel.Application")
    	path = File.expand_path("../Data/Login.xlsx") 
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

		browser.goto(url)

sleep 1
			#check to see if survey modal pops up	
			if browser.a(:id, "hn_modal_close").exists?
				browser.a(:id, "hn_modal_close").click
			end
sleep 1

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

sleep 2

			browser.wait_until {browser.text.include? "Welcome Automation"}

			#Go to Manage Profile page
			browser.div(:id, "HN_Accounts_Btn").click
			
			#browser.a(:href, "https://accounts.hayneedle.com/account/global)_account.cfm")
			
			browser.div(:id, "HN_Accounts_DD").a(:text, "Manage Profile").click			
			
			assert(browser.text.include?("Update Your Profile Information"))			

			browser.close

    end	

end