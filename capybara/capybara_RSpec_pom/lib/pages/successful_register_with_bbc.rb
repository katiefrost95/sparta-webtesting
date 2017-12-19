require 'capybara/dsl'

class RegisterWithBbc
  include Capybara::DSL

  SIGN_UP_PAGE_URL = 'https://account.bbc.com/register/details'
  EMAIL_FIELD = 'user-identifier-input'
  PASSWORD_FIELD = 'password-input'
  POSTCODE_FIELD = 'postcode-input'
  GENDER_FIELD = 'gender-input'
  SUBMIT_FIELD = 'submit-button'

  def click_email_box
    find(:id, EMAIL_FIELD ).click
  end

  def fill_in_email_field(email)
    fill_in(EMAIL_FIELD, with: email)
  end

  def click_password_box
    find(:id, PASSWORD_FIELD).click
  end

  def fill_in_password_field(password)
    fill_in(PASSWORD_FIELD, with: password)
  end

  def click_postcode_box
    find(:id, POSTCODE_FIELD).click
  end

  def fill_in_postcode_field(postcode)
    fill_in(POSTCODE_FIELD, with: postcode)
  end

  def click_select_box
    find(:id, GENDER_FIELD).click
  end

  def fill_in_gender_field
    select('Female', from: 'gender-input')
  end

  def select_opt(opt)
    find(:xpath, ".//label[@for='#{opt}']/div/div").click
  end

  def submit_button
    find(:id, SUBMIT_FIELD).click
  end
end
