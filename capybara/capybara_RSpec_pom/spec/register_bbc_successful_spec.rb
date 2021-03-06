require 'spec_helper'

describe 'Incorrect user registration details produces valid error' do

  after(:all)do
    Capybara.current_session.driver.quit
  end

  context 'it should respond successful when correct registration details are input' do

    it 'should enter enter successful when registering up' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_in_day_field('7')
      @bbc_site.bbc_sign_up_page.fill_in_month_field('March')
      @bbc_site.bbc_sign_up_page.fill_in_year_field('1995')
      @bbc_site.bbc_sign_up_page.click_continue_button
      @bbc_site.register_with_bbc.fill_in_email_field('katiefrost12345@hotmail.co.uk')
      @bbc_site.register_with_bbc.fill_in_password_field('katie1234!')
      @bbc_site.register_with_bbc.fill_in_postcode_field('se42ex')
      @bbc_site.register_with_bbc.click_select_box
      @bbc_site.register_with_bbc.fill_in_gender_field
      @bbc_site.register_with_bbc.select_opt('optOut')
      @bbc_site.register_with_bbc.submit_button
      sleep 5
    end

  end

end
