require 'capybara/dsl'

class BbcSignUpPage
  include Capybara::DSL

  SIGN_UP_PAGE_URL = 'https://account.bbc.com/register'
  DAY_FIELD = 'day-input'
  MONTH_FIELD ='month-input'
  YEAR_FIELD = 'year-input'
  INCORRECT_YEAR_MESSAGE_TEXT = 'form-message-dateOfBirth'
  CONTINUE_BUTTON = 'submit-button'

  def enter_day_of_birth
    find(:id, DAY_FIELD ).click
  end

  def fill_in_day_field(day)
    fill_in(DAY_FIELD, with: day)
  end

  def enter_month_of_birth
    find(:id, MONTH_FIELD ).click
  end

  def fill_in_month_field(month)
    fill_in(MONTH_FIELD, with: month)
  end

  def enter_year_of_birth
    find(:id, YEAR_FIELD ).click
  end

  def fill_in_year_field(year)
    fill_in(YEAR_FIELD, with: year)
  end

  def continue_button
    find_button(CONTINUE_BUTTON)
  end

  def click_continue_button
    continue_button.click
  end

  def incorrect_year_error
    find(:id, INCORRECT_YEAR_MESSAGE_TEXT).text
  end

end
