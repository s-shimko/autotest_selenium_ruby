# require 'test-unit'
require 'test/unit'
require 'selenium-webdriver'
# require 'rspec/expectations'

require_relative 'testredmine_methods'


class TestRedmine < Test::Unit::TestCase
  include TestRedmineMethods

  def setup
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    @driver.manage.timeouts.implicit_wait = 5

    @login = ('testlogin1' + rand(9999999).to_s)
    @login2 = ('testlogin2' + rand(9999999).to_s)
    @login3 = ('testlogin3' + rand(9999999).to_s)
    @project = ('test_project' + rand(9999999).to_s)

    @pass = '1234'
    @npass = '1111'
    @pass2 = '1234'

  end

#*********************************TEST*********************************************

  def test_registration
    registration(@login, '123', '123')
    expected_text_english = 'Your account has been activated. You can now log in.'
    expected_text_russian = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(actual_text.include?(expected_text_english) || actual_text.include?(expected_text_russian))
  end

  def test_change_pass
    registration(@login, '123', '123')
    change_pass(@pass, @npass)
    logout
    login(@login, @npass)
    expected_text = @login
    actual_text = @driver.find_element(:css, "#loggedas .user").text
    assert_equal(expected_text, actual_text)
  end

  def test_new_project
    registration(@login, '123', '123')
    logout
    registration(@login2, 'second_user', 'two')
    logout
    login(@login, @pass)
    add_new_project
    add_new_user_to_project(@login2)

    user_list = @driver.find_elements(:css, ".name .user")
    names = user_list.map {|user| user.text}
    @index2 = names.index('second_user two')

    expected_text = 'second_user two'
    actual_text = @driver.find_elements(:css, ".name .user")[@index2].text
    assert_equal(expected_text, actual_text)
  end

  def test_edit_user_roles
    registration(@login, '123', '123')
    logout
    registration(@login2, 'second_user', 'two')
    logout
    registration(@login3, 'third_user', 'three')
    logout
    login(@login, @pass)
    add_new_project
    add_new_user_to_project(@login2)
    @driver.navigate.to 'http://demo.redmine.org'
    add_new_user_to_project(@login3)
    @driver.navigate.to 'http://demo.redmine.org'
    edit_user_roles

    @wait.until { @driver.find_elements(:css, ".member span[id*='member']")[@index].displayed? }
    expected_text = 'Reporter'
    actual_text = @driver.find_elements(:css, ".member span[id*='member']")[@index].text
    assert_equal(expected_text, actual_text)
  end

  def test_create_project_version
    registration(@login, '123', '123')
    add_new_project
    create_project_version
    expected_text = 'New_version'
    actual_text = @driver.find_element(:css, ".version .name a").text
    assert_equal(expected_text, actual_text)
  end

  def test_create_issues_bug
    registration(@login, '123', '123')
    add_new_project
    create_issue(1, 'New_issue_bug')
    @driver.find_element(:class, 'issues').click
    expected_text = 'New_issue_bug'
    actual_text = @driver.find_element(:css, ".subject a").text
    assert_equal(expected_text, actual_text)
  end

  def test_create_issues_feature
    registration(@login, '123', '123')
    add_new_project
    create_issue(2, 'New_issue_feature')
    @driver.find_element(:class, 'issues').click
    expected_text = 'New_issue_feature'
    actual_text = @driver.find_element(:css, ".subject a").text
    assert_equal(expected_text, actual_text)
  end

  def test_create_issues_support
    registration(@login, '123', '123')
    add_new_project
    create_issue(3, 'New_issue_support')
    @driver.find_element(:class, 'issues').click
    expected_text = 'New_issue_support'
    actual_text = @driver.find_element(:css, ".subject a").text
    assert_equal(expected_text, actual_text)
  end


  def teardown
    @driver.quit
  end

end


