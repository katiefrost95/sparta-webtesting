# sparta-webtesting

This repository includes UI testing creating a page object model using capybara and the selenium webdriver.
Using Selenium I wrote tests for the form on the http://demoqa.com/registration/ website and practiced accessing elements such as drop down boxes and buttons on the web page by id or xpath.

This repository also includes practice using capybara. I used the capybara gem to carry out tests of user experience on the bbc website and mapped out paths of how a user would use the website and tested those paths.

### Resources:
Capybara:

https://gist.github.com/huangzhichong/3284966
https://github.com/teamcapybara/capybara

Selenium:

https://gist.github.com/huangzhichong/3284966

To access this repository clone it into your terminal using `'git clone git@github.com:katiefrost95/sparta-webtesting.git'`

### Selenium

##### To run the tests

In terminal:
`gem install selenium-webdriver`

To carry out the selenium tests you need to  
`require 'selenium-webdriver'`    
In your terminal you need to initialize the gem by doing:

To run the tests make sure that rspec has been required in the selenium_demoqua_registration.rb page and then run the command `rspec` in your terminal.

##### To write new tests
Tests are written in the spec folder. To add a new test head into the demoqa_registration_spec.rb and add tests in the following format:

      it 'should accept a first name' do
        expect(@driver.first_name_field_displayed).to eq true
        @driver.set_first_name_field('Katie')
        expect(@driver.get_first_name_field_value).to eq('Katie')
      end

If creating a new spec folder remember to require spec_helper at the top.

Methods are written in the selenium_demoqua_registration.rb  in the format:

    def set_first_name_field(first_name)
      @chrome_driver.find_element(:id, FIRST_NAME_FIELD).send_keys(first_name)
    end

    def get_first_name_field_value
      @chrome_driver.find_element(:id, FIRST_NAME_FIELD).attribute('value')
    end

    def first_name_field_displayed
      @chrome_driver.find_element(:id,FIRST_NAME_FIELD).displayed?
    end


### Capybara

##### To run the tests

`require 'capybara/dsl'` in your pages.

In these tests I used capybara with rspec to run the assertions.
To run them in your terminal enter the command `'rspec'`.

##### To create a new test

Add a new spec file in the spec folder and `require 'spec_helper'`.
When writing you tests with capybara, as your testing the user experience you write out the path your user will take through the website. Therefore your tests will look as follows:

    it 'should produce an error when inputting an incorrect password to a valid account' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("katie_frost95@hotmail.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password("Hello12345")
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eq('Uh oh, that password doesn’t match that account. Please try again.')
    end

For each new spec page you need a new .rb file in the pages folder to call the elements and write out the methods. Inside the class remember to `include Capybara::DSL`
The methods should be written as such which constants defined at the top:

    def enter_day_of_birth
      find(:id, DAY_FIELD ).click
    end
