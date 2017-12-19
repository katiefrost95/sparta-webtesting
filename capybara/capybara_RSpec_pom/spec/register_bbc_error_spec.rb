require 'spec_helper'

describe 'Incorrect user registration details produces valid error' do

  after(:all)do
    Capybara.current_session.driver.quit
  end

  context 'it should respond successful when correct registration details are input' do

    it 'should return error when an already registered email is used' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_in_day_field('7')
      @bbc_site.bbc_sign_up_page.fill_in_month_field('March')
      @bbc_site.bbc_sign_up_page.fill_in_year_field('1995')
      @bbc_site.bbc_sign_up_page.click_continue_button
      @bbc_site.error_register_with_bbc.fill_in_email_field('frostshome@yahoo.com')
      @bbc_site.error_register_with_bbc.fill_in_password_field('katie1234!')
      @bbc_site.error_register_with_bbc.fill_in_postcode_field('se42ex')
      @bbc_site.error_register_with_bbc.click_select_box
      @bbc_site.error_register_with_bbc.fill_in_gender_field
      @bbc_site.error_register_with_bbc.select_opt('optOut')
      @bbc_site.error_register_with_bbc.submit_button
      expect(@bbc_site.error_register_with_bbc.email_error_message).to eq('Looks like you’ve already registered with this email. Want to sign in?')
    end

    it 'should return error when postcode is blank' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_in_day_field('7')
      @bbc_site.bbc_sign_up_page.fill_in_month_field('March')
      @bbc_site.bbc_sign_up_page.fill_in_year_field('1995')
      @bbc_site.bbc_sign_up_page.click_continue_button
      @bbc_site.error_register_with_bbc.fill_in_email_field('katiefrost1234@hotmail.co.uk')
      @bbc_site.error_register_with_bbc.fill_in_password_field('katie1234!')
      @bbc_site.error_register_with_bbc.fill_in_postcode_field('')
      @bbc_site.error_register_with_bbc.click_select_box
      @bbc_site.error_register_with_bbc.fill_in_gender_field
      @bbc_site.error_register_with_bbc.select_opt('optOut')
      @bbc_site.error_register_with_bbc.submit_button
      expect(@bbc_site.error_register_with_bbc.postcode_blank_error_message).to eq("Something's missing. Please check and try again.")
    end

  end

end
