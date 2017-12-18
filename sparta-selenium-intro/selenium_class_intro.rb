require 'selenium-webdriver'

class SeleniumQatoolsForm

#capitals make it constant variables
  PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'
  FIRST_NAME_FIELD_NAME = 'firstname'
  LAST_NAME_FIELD_NAME = 'lastname'
  FEMALE_SEX_BUTTON = 'sex-1'
  YEARS_EXPERIENCE_1 = 'exp-0'
  DATE_PICKER = 'datepicker'
  PROFESSION = 'profession-1'
  AUTOMATION_TOOL = 'tool-2'
  CONTINENTS = 'continents'
  SELENIUM_COMMANDS = 'selenium_commands'

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def first_name(text)
    @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
  end

  def last_name(text)
    @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
  end

  def female_gender
    @chrome_driver.find_element(:id, FEMALE_SEX_BUTTON).click
  end

  def experience
    @chrome_driver.find_element(:id, YEARS_EXPERIENCE_1).click
  end

  def date_pick(text)
    @chrome_driver.find_element(:id, DATE_PICKER).send_keys(text)
  end

  def profession
    @chrome_driver.find_element(:id, PROFESSION).click
  end

  def tool
    @chrome_driver.find_element(:id, AUTOMATION_TOOL).click
  end

  def continent
    select = @chrome_driver.find_element(:id, CONTINENTS)
    all_options = select.find_elements(:tag_name, "option")
    all_options.each do |option|
      if option.text == "North America"
        option.click
      end
    end
  end

end

practice_form_page = SeleniumQatoolsForm.new
practice_form_page.visit_practice_form
practice_form_page.first_name('Katie')
practice_form_page.last_name('Frost')
practice_form_page.female_gender
practice_form_page.experience
practice_form_page.date_pick('18/12/17')
practice_form_page.profession
practice_form_page.tool
practice_form_page.continent
sleep 3
