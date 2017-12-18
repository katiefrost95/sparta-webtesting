require 'selenium-webdriver'

class SeleniumDemoReg

  # page_url
  PAGE_URL = 'http://demoqa.com/registration/'
  # Page field
  FIRST_NAME_FIELD = 'name_3_firstname'
  LAST_NAME_FIELD = 'name_3_lastname'
  MARITAL_STATUS = ['married', 'single', 'divorced']
  HOBBY_STATUS = ['dance', 'reading', 'cricket']
  COUNTRY_DROP_DOWN_LIST = 'dropdown_7'
  DOB_MONTH_DROPDOWN_LIST = 'mm_date_8'
  DOB_DAY_DROPDOWN_LIST = 'dd_date_8'
  DOB_YEAR_DROPDOWN_LIST = 'yy_date_8'
  PHONE_NUMBER_FIELDS = 'phone_9'
  USERNAME_FIELD = 'username'
  EMAIL_FIELD = 'email_1'
  PROFILE_PICTURE_BUTTON =  # id
  DESCRIPTION_FIELD = 'description'
  PASSWORD_FIELD = 'password_2'
  CONFIRM_PASSWORD_FIELD = 'confirm_password_password_2'
  SUBMIT_BUTTON = # name
  REGISTRATION_CONFIRMATION = #class

  def initialize
    # set up driver
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_registration_form
    @chrome_driver.get(PAGE_URL)
  end

  def current_url
    @chrome_driver.current_url
  end

  # first name field management - Difficulty Easy

  def set_first_name_field(first_name)
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).send_keys(first_name)
  end

  def get_first_name_field_value
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).attribute('value')
  end

  def first_name_field_displayed
    @chrome_driver.find_element(:id,FIRST_NAME_FIELD).displayed?
  end

  # last name field management - Difficulty Easy

  def set_last_name_field(last_name)
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).send_keys(last_name)
  end

  def get_last_name_field_value
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).attribute('value')
  end

  def last_name_field_displayed
    @chrome_driver.find_element(:id,LAST_NAME_FIELD).displayed?
  end

  # Marital option management - Difficulty Medium

  def select_marital_option
    # Consider something like a case statement and check the selenium selected? method
    rand_num = rand(2)
    status = @chrome_driver.find_elements(:name, 'radio_4[]')
    status.each do |x|
      if x['value'] == MARITAL_STATUS[rand_num]
        x.click
        return x.selected?
      end
    end
  end

  # hobby option management - Difficulty Medium

  def select_hobby_option
    # Consider something like a case statement and check the selenium selected? method
    rand_num = rand(2)
    hobby = @chrome_driver.find_elements(:name, 'checkbox_5[]')
    hobby.each do |x|
      if x['value'] == HOBBY_STATUS[rand_num]
        x.click
        return x.selected?
      end
    end
  end

  # Select Country - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_selected_country
    countries = @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)
    countries.find_element(:tag_name, "option").text
  end

  def country_dropdown_list_select(country)
    countries = @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)
    all_options = countries.find_elements(:tag_name, "option")
    all_options.each do |x|
      if x.text == country
        x.click
      end
      return x.selected?
    end
  end

  # DOB management - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def dob_month_list_select(month_value)


  end

  def dob_day_list_select(day_value)

  end

  def dob_year_list_select(year_value)

  end


  # Phone number field management - Difficulty Easy

  def set_phone_number_field(phone_number)
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).send_keys(phone_number)
  end

  def get_phone_number_field_value
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).attribute('value')
  end

  #  username field management - Difficulty Easy

  def set_user_name_field(user_name)
    @chrome_driver.find_element(:id, USERNAME_FIELD).send_keys(user_name)
  end

  def get_user_name_field_value
    @chrome_driver.find_element(:id, USERNAME_FIELD).attribute('value')
  end

  # Email field management - Difficulty Easy

  def set_email_field(email)

  end

  def get_email_field_value
  end

  # about yourself / description field - Difficulty Easy

  def set_about_yourself_field(details)
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).send_keys(details)
  end

  def get_about_yourself_value
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).attribute('value')
  end

  # Password management - Difficulty Easy

  def set_password_field(password)
    @chrome_driver.find_element(:id, PASSWORD_FIELD).send_keys(password)
  end

  def get_password_value
    @chrome_driver.find_element(:id, PASSWORD_FIELD).attribute('value')
  end

  def set_confirmation_password_field(password)
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).send_keys(password)
  end

  def get_confirmation_password_value
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).attribute('value')
  end

  # registration confirmation - Difficulty Easy

  def click_submit
  end

  def check_registration_successful
  end
end
