require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      expect(@driver.first_name_field_displayed).to eq true
      @driver.set_first_name_field('Katie')
      expect(@driver.get_first_name_field_value).to be_kind_of(String)
    end

    it 'should accept a last name' do
      expect(@driver.last_name_field_displayed).to eq true
      @driver.set_last_name_field('Frost')
      expect(@driver.get_last_name_field_value).to be_kind_of(String)
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      expect(@driver.select_marital_option).to eq true
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      expect(@driver.select_hobby_option).to eq true
      sleep 2
    end

    it 'should have a country default of Afghanistan' do
      @driver.get_selected_country
      expect(@driver.country_dropdown_list_select('Afghanistan')).to eq true
    end

    it 'accept a new DOB' do

    end

    it 'should accept a new country value' do

    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field('07536253748')
      expect(@driver.get_phone_number_field_value).to be_kind_of(String)
    end

    it 'should accept a username' do
      @driver.set_user_name_field('katiefrost4')
      expect(@driver.get_user_name_field_value).to be_kind_of(String)
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field('hey')
      expect(@driver.get_about_yourself_value).to be_kind_of(String)
    end

    it 'should accept a password' do
      @driver.set_password_field('hf')
      expect(@driver.get_password_value).to be_kind_of(String)
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field('hf')
      expect(@driver.get_confirmation_password_value).to be_kind_of(String)
    end

  end

end
