require 'selenium-webdriver'

#define a webdriver to be used
chrome_driver = Selenium::WebDriver.for :chrome

chrome_driver.get('http://toolsqa.com/automation-practice-form/')

#open web browser for 4 seconds

chrome_driver.find_element(:name, 'firstname').displayed?

chrome_driver.find_element(:name, 'firstname').send_keys('Katie')

chrome_driver.find_element(:name, 'lastname').send_keys('Frost')

sleep 4
