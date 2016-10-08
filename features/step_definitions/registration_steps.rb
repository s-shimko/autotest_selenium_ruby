Given(/^I'm on the redmine website$/) do
  @driver.navigate.to 'http://demo.redmine.org'
end

When(/^Click on the 'Register' link$/) do
  @driver.find_element(:class, 'register').click

end

When(/^Fill all fields on the register form with valid values$/) do |_|
  login = ('testlogin1' + rand(9999999).to_s)
  pass = '1234'
  @wait.until {@driver.find_element(:id, 'user_login').displayed?}
  @driver.find_element(:id, 'user_login').send_keys login
  @driver.find_element(:id, 'user_password').send_keys pass
  @driver.find_element(:id, 'user_password_confirmation').send_keys pass
  @driver.find_element(:id, 'user_firstname').send_keys "sss"
  @driver.find_element(:id, 'user_lastname').send_keys "ivanov"
  @driver.find_element(:css, "option[value*='ru']").click
  @driver.find_element(:id, "user_language").click
  @driver.find_element(:id, 'user_mail').send_keys(login + '@dd.dd')
 end

When(/^Fill all fields on the register form with not valid values "([^"]*)"\/"([^"]*)"$/) do |login, pass|
  @wait.until {@driver.find_element(:id, 'user_login').displayed?}
  @driver.find_element(:id, 'user_login').send_keys login
  @driver.find_element(:id, 'user_password').send_keys pass
  @driver.find_element(:id, 'user_password_confirmation').send_keys pass
  @driver.find_element(:id, 'user_firstname').send_keys "sss"
  @driver.find_element(:id, 'user_lastname').send_keys "ivanov"
  @driver.find_element(:css, "option[value*='ru']").click
  @driver.find_element(:id, "user_language").click
  @driver.find_element(:id, 'user_mail').send_keys(login + '@dd.dd')
end

When(/^Click 'Submit' button$/) do
  @driver.find_element(:name, 'commit').click
end

Then(/^Verify text about successfull registration$/) do
  @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}
  expected_text_english = 'Your account has been activated. You can now log in.'
  expected_text_russian = 'Ваша учётная запись активирована. Вы можете войти.'
  actual_text = @driver.find_element(:id, 'flash_notice').text
  expect(actual_text).to eq(expected_text_russian).or eq(expected_text_english)
end

Then(/^Verify message about not valid values "([^"]*)"$/) do |message|
  @wait.until {@driver.find_element(:css, "#errorExplanation>ul>li").displayed?}
  actual_message = @driver.find_element(:css, "#errorExplanation>ul>li").text
  puts actual_message
  expect(actual_message).to eql(message)
end