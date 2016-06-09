require 'test/unit'
require 'selenium-webdriver'

class Task01 < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    @login = 'testlogin_1'
    @pass = '1234'
    @npass = '1111'
  end

  def test_positive
    # registration
    #
    # expected_text = 'Ваша учётная запись активирована. Вы можете войти.'
    # actual_text = @driver.find_element(:id, 'flash_notice').text
    # assert_equal(expected_text, actual_text)

    login

    @driver.find_element(:class, 'logout').click

    login

    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys @pass
    @driver.find_element(:id, 'new_password').send_keys @npass
    @driver.find_element(:id, 'new_password_confirmation').send_keys @npass
    @driver.find_element(:name, 'commit').click

  end

  def login
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @pass
    @driver.find_element(:name, 'login').click
  end

  def registration
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click

    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys @pass
    @driver.find_element(:id, 'user_password_confirmation').send_keys @pass
    @driver.find_element(:id, 'user_firstname').send_keys '123'
    @driver.find_element(:id, 'user_lastname').send_keys '123'
    @driver.find_element(:id, 'user_mail').send_keys(login + '@dd.dd')

    @driver.find_element(:name, 'commit').click
  end

  def teardown
    @driver.quit
  end
end