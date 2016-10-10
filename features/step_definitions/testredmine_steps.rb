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
 logout
end

When(/^click My account link$/) do
  on(HomePage).my_account_element.when_visible($WT).click
end

When(/^change password$/) do
  change_pass(@pass, @npass)
end

When(/^click Apply button$/) do
  on(ChangePasswordPage).apply_element.when_visible($WT).click
end

Then(/^Verify that I enter on site with new password$/) do
  expected_text = "Logged in as #{@login}"
  actual_text = on(HomePage).loggedas_element.when_visible($WT).text
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
  user_list2 = @browser.find_elements(:css, ".name .user")
  sleep 1
  names2 = user_list2.map {|user| user.text}
  @index2 = names2.index('second_user two')

  expected_text = 'second_user two'
  actual_text = @browser.find_elements(:css, ".name .user")[@index2.to_i].text
  expect(actual_text).to eql(expected_text)
end

def example a, &b
  puts a, b
end
