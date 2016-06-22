# require 'test-unit'
require 'test/unit'
require 'selenium-webdriver'
require 'rspec/expectations'


class TestRedmine < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    @driver.manage.timeouts.implicit_wait = 5

    @login = ('testlogin1' + rand(9999999).to_s)
    @login2 = ('testlogin2' + rand(9999999).to_s)
    @project = ('test_project' + rand(9999999).to_s)

    @pass = '1234'
    @npass = '1111'
    @pass2 = '1234'

  end

  def login(login, pass)
    @driver.navigate.to 'http://demo.redmine.org'
    @wait.until { @driver.find_element(:class, 'login').displayed? }
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys login
    @driver.find_element(:id, 'password').send_keys pass
    @driver.find_element(:name, 'login').click
  end

  def logout
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'logout').click
  end

  def registration(login, first_name, last_name)
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @driver.find_element(:id, 'user_login').send_keys login
    @driver.find_element(:id, 'user_password').send_keys @pass
    @driver.find_element(:id, 'user_password_confirmation').send_keys @pass
    @driver.find_element(:id, 'user_firstname').send_keys first_name
    @driver.find_element(:id, 'user_lastname').send_keys last_name
    @driver.find_element(:id, 'user_mail').send_keys(login + '@dd.dd')
    @driver.find_element(:id, "user_language").click
    @driver.find_element(:css, "option[value*='ru']").click
    @driver.find_element(:name, 'commit').click
  end

  def change_pass(pass, npass)
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys pass
    @driver.find_element(:id, 'new_password').send_keys npass
    @driver.find_element(:id, 'new_password_confirmation').send_keys npass
    @driver.find_element(:name, 'commit').click
  end

  def add_new_project
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'project_name').send_keys @project
    @driver.find_element(:id, 'project_identifier').send_keys '007'
    @driver.find_element(:name, 'commit').click
  end

  def add_new_user_to_project
    @driver.find_element(:class, 'projects').click
    # @driver.find_element(:id, "project_quick_jump_box").click
    # @driver.find_element(:css, "option:nth-child(3)").click
    @driver.find_element(:id, 'project_quick_jump_box').send_keys @project
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'principal_search').send_keys @login2
    @wait.until { @driver.find_element(:css, "#principals label:first-child").displayed? }
    @driver.find_element(:css, "#principals label:first-child").click
    @driver.find_element(:css, ".roles-selection input[value='4']").click
    @driver.find_element(:id, 'member-add-submit').click
  end

  def edit_user_roles
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:css, "option:nth-child(3)").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:css, "tr[class='even member'] a[class='icon icon-edit']").click
    @driver.find_element(:css, ".even input[value='4']").click
    @driver.find_element(:css, ".even input[value='5']").click
    @driver.find_element(:css, ".even .small").click
  end

  def create_project_version
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:css, "option:nth-child(3)").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:css, "#tab-content-versions .icon").click
    @driver.find_element(:id, 'version_name').send_keys 'New_version'
    @driver.find_element(:name, 'commit').click
  end

  def create_issue(option, issue_name)
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:css, "option:nth-child(3)").click
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:css, "#issue_tracker_id option:nth-child(" + (option.to_s) + ")").click
    @driver.find_element(:id, 'issue_subject').send_keys issue_name
    @driver.find_element(:name, 'commit').click
  end

#*********************************TEST*********************************************

  # def test_registration
  #   registration(@login, '123', '123')
  #   expected_text_english = 'Your account has been activated. You can now log in.'
  #   expected_text_russian = 'Ваша учётная запись активирована. Вы можете войти.'
  #   actual_text = @driver.find_element(:id, 'flash_notice').text
  #   assert(actual_text.include?(expected_text_english) || actual_text.include?(expected_text_russian))
  # end

  # def test_change_pass
  #   registration(@login, '123', '123')
  #   change_pass(@pass, @npass)
  #   logout
  #   login(@login, @npass)
  #   expected_text = @login
  #   actual_text = @driver.find_element(:css, "#loggedas .user").text
  #   assert_equal(expected_text, actual_text)
  # end

  def test_new_project
    registration(@login, '123', '123')
    # logout
    registration(@login2, 'second_user', 'two')
    # logout
    login(@login, @pass)
    sleep 2
    add_new_project
    add_new_user_to_project
    expected_text = 'second_user two'
    actual_text = @driver.find_element(:css, ".even .name .user").text
    assert_equal(expected_text, actual_text)
  end
  #
  # def test_edit_user_roles
  #   registration(@login, '123', '123')
  #   logout
  #   registration(@login2, 'second_user', 'two')
  #   logout
  #   login(@login, @pass)
  #   add_new_project
  #   add_new_user_to_project
  #   @driver.navigate.to 'http://demo.redmine.org'
  #   edit_user_roles
  #   @wait.until { @driver.find_element(:css, ".even .roles span[id^='member']").displayed? }
  #   expected_text = 'Reporter'
  #   actual_text = @driver.find_element(:css, ".even .roles span[id^='member']").text
  #   assert_equal(expected_text, actual_text)
  # end
  #
  # def test_create_project_version
  #   registration(@login, '123', '123')
  #   add_new_project
  #   create_project_version
  #   expected_text = 'New_version'
  #   actual_text = @driver.find_element(:css, ".version .name a").text
  #   assert_equal(expected_text, actual_text)
  # end
  #
  # def test_create_issues_bug
  #   registration(@login, '123', '123')
  #   add_new_project
  #   create_issue(1, 'New_issue_bug')
  #   @driver.find_element(:class, 'issues').click
  #   expected_text = 'New_issue_bug'
  #   actual_text = @driver.find_element(:css, ".subject a").text
  #   assert_equal(expected_text, actual_text)
  # end
  #
  # def test_create_issues_feature
  #   registration(@login, '123', '123')
  #   add_new_project
  #   create_issue(2, 'New_issue_feature')
  #   @driver.find_element(:class, 'issues').click
  #   expected_text = 'New_issue_feature'
  #   actual_text = @driver.find_element(:css, ".subject a").text
  #   assert_equal(expected_text, actual_text)
  # end
  #
  # def test_create_issues_support
  #   registration(@login, '123', '123')
  #   add_new_project
  #   create_issue(3, 'New_issue_support')
  #   @driver.find_element(:class, 'issues').click
  #   expected_text = 'New_issue_support'
  #   actual_text = @driver.find_element(:css, ".subject a").text
  #   assert_equal(expected_text, actual_text)
  # end


  def teardown
    @driver.quit
  end

end


