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
end