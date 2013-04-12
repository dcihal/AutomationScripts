require "watir-webdriver"
require 'test/unit'

class Test1 < Test::Unit::TestCase

    def test_SearchAndNarrow()
    	
    	browser = Watir::Browser.new :chrome    

    	url = "http://test.hayneedle.local"

        browser.goto(url)

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
			browser.span(:id, "cell_price_underd600").click

			assert(browser.text.include?("Under $600"))
			  
			browser.close

    end

    def test_SearchSubCategory

    	browser = Watir::Browser.new :chrome

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

    		assert(browser.text.include?("Arbor Accessories"))	

    		browser.close

    end
    
end