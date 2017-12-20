require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  after(:all)do
    Capybara.current_session.driver.quit
  end

  context 'it should respond with the correct error when incorrect details are input' do

    it 'should produce an error when inputting an incorrect password to a valid account' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("katie_frost95@hotmail.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password("Hello12345")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eq('Uh oh, that password doesn’t match that account. Please try again.')
    end

    it 'should produce an error when inputting and incorrect email with valid password' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("katiefrost@hotail.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password("katie1234!")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_username_text).to eq('Sorry, we can’t find an account with that email. You can register for a new account or get help here.')
    end

    it 'should be a successful login' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("katie_frost95@hotmail.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password("katie1234!")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
    end

  end

end
