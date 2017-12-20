require 'spec_helper'

describe 'Incorrect user registration details produces valid error' do

  after(:all)do
    Capybara.current_session.driver.quit
  end

  context 'it should respond with the correct error when incorrect registration details are input' do

    it 'should produce an error when signing up with upcoming year' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_in_day_field('7')
      @bbc_site.bbc_sign_up_page.fill_in_month_field('March')
      @bbc_site.bbc_sign_up_page.fill_in_year_field('2020')
      @bbc_site.bbc_sign_up_page.click_continue_button
      expect(@bbc_site.bbc_sign_up_page.incorrect_year_error).to eq("Oops, that date's in the future. Make sure it’s a date in the past. (Unless you’re a time traveller. In which case, what’s the future like? Are there flying cars?)")
      sleep 3
    end

    it 'should produce and error if invalid month entered' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_in_day_field('7')
      @bbc_site.bbc_sign_up_page.fill_in_month_field('Mrch')
      @bbc_site.bbc_sign_up_page.fill_in_year_field('1995')
      @bbc_site.bbc_sign_up_page.click_continue_button
      expect(@bbc_site.bbc_sign_up_page.incorrect_year_error).to eq("Oops, that month doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.")
    end

  end

end
