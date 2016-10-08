include TestredmineMethodsCucumber

Given(/^I'm provide a correct registration$/) do
  @login = ('testlogin1' + rand(9999999).to_s)
  @login2 = ('testlogin2' + rand(9999999).to_s)
  @login3 = ('testlogin3' + rand(9999999).to_s)
  @project = ('test_project' + rand(9999999).to_s)

  @pass = '1234'
  @npass = '1111'
  @pass2 = '1234'
  registration(@login, @pass, '123', '123')
end

When(/^login witn "([^"]*)"\/"([^"]*)"$/) do |login, pass|
  login(login, pass)
end

When(/^login witn changed password$/) do
  login(@login,@npass)
end

When(/^login with first user$/) do
  login(@login,@pass)
end

When(/^logout$/) do
  @driver.navigate.to 'http://demo.redmine.org'
  @driver.find_element(:class, 'logout').click
end

When(/^click My account link$/) do
  @wait.until {@driver.find_element(:class, 'my-account').displayed?}
  @driver.find_element(:class, 'my-account').click
end

When(/^click Change password link$/) do
  @wait.until {@driver.find_element(:class, 'icon-passwd').displayed?}
  @driver.find_element(:class, 'icon-passwd').click
end

When(/^change password$/) do
  @wait.until {@driver.find_element(:id, 'password').displayed?}
  @driver.find_element(:id, 'password').send_keys @pass
  @driver.find_element(:id, 'new_password').send_keys @npass
  @driver.find_element(:id, 'new_password_confirmation').send_keys @npass
end

When(/^click Apply button$/) do
  @driver.find_element(:name, 'commit').click
end

Then(/^Verify that I enter on site with new password$/) do
  @wait.until { @driver.find_element(:css, "#loggedas .user").displayed? }
  expected_text = @login
  actual_text = @driver.find_element(:css, "#loggedas .user").text
  expect(actual_text).to eql(expected_text)
end

When(/^registrate second user$/) do
  registration(@login2, @pass, 'second_user', 'two')
  logout
end

When(/^create new project$/) do
  add_new_project
end

When(/^add new user to project with login2$/) do
  add_new_user_to_project(@login2)
end

Then(/^verify that user was added$/) do
  sleep 1
  user_list2 = @driver.find_elements(:css, ".name .user")
  sleep 1
  names2 = user_list2.map {|user| user.text}
  @index2 = names2.index('second_user two')

  expected_text = 'second_user two'
  actual_text = @driver.find_elements(:css, ".name .user")[@index2.to_i].text
  expect(actual_text).to eql(expected_text)
end

