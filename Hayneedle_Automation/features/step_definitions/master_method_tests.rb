####This is our master test file where all basic web navigation is done.####
####If you make changes to this file, make sure you are closes all of your def's correctly####
####Not doing so will break all tests using this file.####

module MasterMethodTests

  #This method will go to the site/environment that you define below.
  def goto_hayneedle_site
    #the @browser variable is being defined the in the hooks.rb file
    @browser.goto('www.hayneedle.com')
  end

  #Calling this method will close the popup that happens when you go to hayneedle with a clean session(first time visitor).

  #This will be where you change the environment (Enter url at line 5)
  def goto_hayneedle_site
    @browser.goto('www.hayneedle.com')
  end

  #This will be where you change the username and password (Lines 10 and 11)
  def signin(username, password)
    @username = "automation@test.com"
    @password = "Hayneedle1"

    @browser.div(:id, "HN_Accounts_Btn").click
    @browser.div(:id, "HN_Accounts_DD").a(:href, "/templates/hn_modals.cfm?mode=sign_in").click
    @browser.wait_until {@browser.text.include? "HAYNEEDLE ACCOUNTS"}
    @browser.frame(:id, "SignInUpIframe").text_field(:id, "si_email").set(@username)
    @browser.frame(:id, "SignInUpIframe").text_field(:id, "si_password").set(@password)
    @browser.frame(:id, "SignInUpIframe").button(:class, "floatLeft").click
  end

  def close_popup
    sleep 1
    #check to see if survey modal pops up
    if @browser.a(:id, 'hn_modal_close').exists?
      @browser.a(:id, 'hn_modal_close').click
    end
    sleep 1
  end

  #This method will close a browser
  def close_browser
    @browser.close
  end

  def search
    @browser.form(:id, "searchCatPri").text_field(:id, "HN_Search").set("chair")
    @browser.form(:id, "searchCatPri").button(:id, "HN_SearchSubmit").click
  end

end