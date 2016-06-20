# require 'test-unit'
require 'test/unit'
require 'selenium-webdriver'
require 'rspec/expectations'


class TestRedmine < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    @driver.manage.timeouts.implicit_wait = 5

    @login = ('testlogin1' + rand(999).to_s)
    @login2 = ('testlogin2' + rand(999).to_s)
    @project = ('test_project' + rand(999).to_s)

    @pass = '1234'
    @npass = '1111'
    @pass2 = '1234'

  end

  def login
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'login').displayed?
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @pass
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
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='" + @project + "']").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'principal_search').send_keys @login2
    @driver.find_element(:xpath, "//label[contains(.,'second_user two')]").click
    @driver.find_element(:xpath, "//div[@class='roles-selection']//label[contains(.,'Reporter')]").click
    @driver.find_element(:id, 'member-add-submit').click
  end

  def edit_user_roles
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='" + @project + "']").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:xpath, "(//a[contains(.,'Редактировать')])[2]").click
    @driver.find_element(:xpath, "(//p//label[contains(.,'Reporter')])[2]").click
    @driver.find_element(:xpath, "(//p//label[contains(.,'Developer')])[2]").click
    @driver.find_element(:xpath, "(//input[@class='small'][@type='submit'])[2]").click
  end

  def create_project_version
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='" + @project + "']").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:xpath, "//a[contains(.,'Новая версия')]").click
    @driver.find_element(:id, 'version_name').send_keys 'New_version'
    @driver.find_element(:name, 'commit').click
  end

  def create_issue(issue_name)
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='" + @project + "']").click
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:xpath, '//option[contains(., "Bug")]').click
    @driver.find_element(:id, 'issue_subject').send_keys issue_name
    @driver.find_element(:name, 'commit').click
  end

#*********************************TEST*********************************************

  def test_registration
    registration(@login, '123', '123')
    expected_text = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_change_pass
    registration(@login, '123', '123')
    logout
    @driver.find_element(:class, 'login').displayed?
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @pass
    @driver.find_element(:name, 'login').click
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys @pass
    @driver.find_element(:id, 'new_password').send_keys @npass
    @driver.find_element(:id, 'new_password_confirmation').send_keys @npass
    @driver.find_element(:name, 'commit').click
    logout
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @npass
    @driver.find_element(:name, 'login').click
    assert(@driver.find_element(:xpath, "(//a[contains(.,'"+@login+"')])[1]").displayed?)
  end

  def test_new_project
    registration(@login, '123', '123')
    logout
    registration(@login2, 'second_user', 'two')
    logout
    login
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'project_name').send_keys @project
    @driver.find_element(:id, 'project_identifier').send_keys '007'
    @driver.find_element(:name, 'commit').click
    add_new_user_to_project
    assert(@driver.find_element(:xpath, "(//a[contains(.,'second_user two')])[1]").displayed?)
  end

  def test_edit_user_roles
    registration(@login, '123', '123')
    logout
    registration(@login2, 'second_user', 'two')
    logout
    login
    add_new_project
    add_new_user_to_project
    @driver.navigate.to 'http://demo.redmine.org'
    edit_user_roles
    assert(@driver.find_element(:xpath, "(//span[contains(.,'Developer')])[1]").displayed?)
  end

  def test_create_project_version
    registration(@login, '123', '123')
    add_new_project
    create_project_version
    assert(@driver.find_element(:xpath, "(//a[contains(.,'New_version')])[1]").displayed?)
  end

  def test_create_issues_bug
    registration(@login, '123', '123')
    add_new_project
    create_issue('New_issue_bug')
    @driver.find_element(:class, 'issues').click
    assert(@driver.find_element(:xpath, "(//a[contains(.,'New_issue_bug')])[1]").displayed?)
  end

  def test_create_issues_feature
    registration(@login, '123', '123')
    add_new_project
    create_issue('New_issue_feature')
    @driver.find_element(:class, 'issues').click
    assert(@driver.find_element(:xpath, '(//a[contains(.,"New_issue_feature")])[1]').displayed?)
  end

  def test_create_issues_support
    registration(@login, '123', '123')
    add_new_project
    create_issue('New_issue_support')
    @driver.find_element(:class, 'issues').click
    assert(@driver.find_element(:xpath, '(//a[contains(.,"New_issue_support")])[1]').displayed?)
  end


  def teardown
    @driver.quit
  end

end


