####This is our master test file where all basic web navigation is done.####
####If you make changes to this file, make sure you are closes all of your def's correctly####
####Not doing so will break all tests using this file.####

module MasterMethodTests

  #This method will go to the site/environment that you define below.
  def goto_hayneedle_site
    #@browser.goto('test.hayneedle.local')
    @browser.goto('stage.hayneedle.local')
    #@browser.goto('www.hayneedle.com')
  end

  def sign_in(username, password)
    @browser.wait_until {@browser.text.include? 'HAYNEEDLE ACCOUNTS'}
    @browser.frame(:id, 'SignInUpIframe').text_field(:id, 'si_email').set(username)
    @browser.frame(:id, 'SignInUpIframe').text_field(:id, 'si_password').set(password)
    @browser.frame(:id, 'SignInUpIframe').button(:class, 'floatLeft').click
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

  def search(search_term)
    @browser.form(:id, 'searchCatPri').text_field(:id, 'HN_Search').set(search_term)
    @browser.form(:id, 'searchCatPri').button(:id, 'HN_SearchSubmit').click
  end

  #This method will open a txt file and read the file line by line, you will need to pass in what file to open
  def open_txt_file(file_name)
    puts 'Data/' + file_name
     File.open('Data/' + file_name).each_line.with_index do |line, count|
       line.strip!
       return line
     end
  end
end