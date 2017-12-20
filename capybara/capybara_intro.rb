require 'capybara'

#setting up driver for chrome through capybara
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

session = Capybara::Session.new(:chrome)

session.visit('http://toolsqa.com/automation-practice-form/')

session.fill_in('firstname', with: 'Katie')
session.fill_in('lastname', with: 'Frost')
session.choose('sex-1')
session.choose('exp-4')
session.fill_in('datepicker', with: '19/12/17')
session.find(:css, '#profession-1').click
session.select('Europe', from: 'continents')
session.click_button('submit')
sleep 3
