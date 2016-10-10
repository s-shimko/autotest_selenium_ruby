Given(/^I'm on the redmine website$/) do
   # @browser.navigate.to 'http://demo.redmine.org'
   visit(HomePage)
end

When(/^Click on the 'Register' link$/) do
  on(HomePage).register
  end

When(/^Fill all fields on the register form with valid values$/) do
  # var = RegisterPage.new(@browser)
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

When(/^Fill all fields on the register form with not valid values "([^"]*)"\/"([^"]*)"$/) do |login, pass|
  @wait.until {on(RegisterPage).user_login}
  on(RegisterPage).user_login = login
  on(RegisterPage).user_password = pass
  on(RegisterPage).user_password_confirmation = pass
  on(RegisterPage).user_firstname = "Ivan"
  on(RegisterPage).user_lastname = "Ivanov"
  on(RegisterPage).user_language = 'Russian (Русский)'
  on(RegisterPage).user_mail = login + '@dd.dd'
end

When(/^Click 'Submit' button$/) do
  on(RegisterPage).submit
end

Then(/^Verify text about successfull registration$/) do
  @wait.until {on(RegisterPage).flash_notice}
  expected_text_english = 'Your account has been activated. You can now log in.'
  expected_text_russian = 'Ваша учётная запись активирована. Вы можете войти.'
  actual_text = on(RegisterPage).flash_notice_element.text
  expect(actual_text).to eq(expected_text_russian).or eq(expected_text_english)
end

Then(/^Verify message about not valid values "([^"]*)"$/) do |message|
  @wait.until {on(RegisterPage).error_explanation}
  actual_message = on(RegisterPage).error_explanation_element.text
  puts actual_message
  expect(actual_message).to eql(message)
end