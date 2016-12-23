require_relative 'page_objects/register_page'
require_relative 'page_objects/home_page'

require 'spec_helper'

describe 'main project rspec test' do
  context 'When Register user with valid credentials' do

    before :context do
      @browser = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      visit(HomePage)
      on(HomePage).register
    end

    it 'Fill all fields on the register form with valid values' do
      login = ('testlogin1' + rand(9999999).to_s)
      pass = '1234'
      on(RegisterPage).user_login_element.when_visible(10).send_keys login
      on(RegisterPage).user_password = pass
      on(RegisterPage).user_password_confirmation = pass
      on(RegisterPage).user_firstname = "Ivan"
      on(RegisterPage).user_lastname = "Ivanov"
      on(RegisterPage).user_language = 'Russian (Русский)'
      on(RegisterPage).user_mail = login + '@dd.dd'
    end

    it 'Click submit button' do
      on(RegisterPage).submit
    end

    it 'Verify text about successfull registration' do
      @wait.until {on(RegisterPage).flash_notice}
      expected_text_english = 'Your account has been activated. You can now log in.'
      expected_text_russian = 'Ваша учётная запись активирована. Вы можете войти.'
      actual_text = on(RegisterPage).flash_notice_element.text
      expect(actual_text).to eq(expected_text_russian).or eq(expected_text_english)
      @browser.close
    end

    after :context do
      @browser.quit
    end

  end

  context 'Register user with not valid credentials' do

    before :context do
      @browser = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      visit(HomePage)
      on(HomePage).register
    end

    it 'Fill all fields on the register form with valid values' do
      login = ('testlogin1' + rand(9999999).to_s)
      pass = '123'
      on(RegisterPage).user_login_element.when_visible(10).send_keys login
      on(RegisterPage).user_password = pass
      on(RegisterPage).user_password_confirmation = pass
      on(RegisterPage).user_firstname = "Ivan"
      on(RegisterPage).user_lastname = "Ivanov"
      on(RegisterPage).user_language = 'English'
      on(RegisterPage).user_mail = login + '@dd.dd'
    end

    it 'Click submit button' do
      on(RegisterPage).submit
    end

    it 'Verify text about not successfull registration' do
      @wait.until {on(RegisterPage).error_explanation}
      actual_message = on(RegisterPage).error_explanation_element.text
      expected_text_russian = "Пароль недостаточной длины (не может быть меньше 4 символа)"
      expected_text_english = "Password is too short (minimum is 4 characters)"
      expect(actual_message).to eq(expected_text_russian).or eq(expected_text_english)
    end

    after :context do
      @browser.quit
    end

  end
end