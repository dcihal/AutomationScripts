module MasterMethodTests

  def goto_hayneedle_site
    #@browser = Watir::Browser.new :chrome
    @browser.goto('www.hayneedle.com')
  end

  def close_popup
    sleep 1
    #check to see if survey modal pops up
    if @browser.a(:id, 'hn_modal_close').exists?
      @browser.a(:id, 'hn_modal_close').click
    end
    sleep 1
  end

  def close_browser
    @browser.close
  end
end