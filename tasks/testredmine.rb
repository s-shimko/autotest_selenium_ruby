require 'test/unit'
require 'selenium-webdriver'

class TestRedmine < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    @driver.manage.timeouts.implicit_wait = 5
    @login = 'testlogin_1'
    @pass = '1234'
    @npass = '1111'
    @login2 = 'testlogin_3'
    @pass2 = '1234'
    @project = '0test_project3'

  end

  def test_main
    #registration
    login_test
    logout_test
    login_test
    change_pass_test
    new_project_test
    logout_test
    # registration_second_user_test
    login_test
    add_new_user_to_project_test
    edit_user_roles_test
    create_project_version_test
    create_issues_test
    teardown
  end


  def registration_test
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys @pass
    @driver.find_element(:id, 'user_password_confirmation').send_keys @pass
    @driver.find_element(:id, 'user_firstname').send_keys '123'
    @driver.find_element(:id, 'user_lastname').send_keys '123'
    @driver.find_element(:id, 'user_mail').send_keys(@login + '@dd.dd')
    @driver.find_element(:name, 'commit').click

    expected_text = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def registration_second_user
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @driver.find_element(:id, 'user_login').send_keys @login2
    @driver.find_element(:id, 'user_password').send_keys @pass2
    @driver.find_element(:id, 'user_password_confirmation').send_keys @pass2
    @driver.find_element(:id, 'user_firstname').send_keys 'second_user'
    @driver.find_element(:id, 'user_lastname').send_keys 'two'
    @driver.find_element(:id, 'user_mail').send_keys(@login + '@ded.dd')
    @driver.find_element(:name, 'commit').click
    expected_text = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def login_test
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'login').displayed?
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @npass
    @driver.find_element(:name, 'login').click
  end

  def logout_test
    @driver.find_element(:class, 'logout').click
  end


  def change_pass_test
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys @pass
    @driver.find_element(:id, 'new_password').send_keys @npass
    @driver.find_element(:id, 'new_password_confirmation').send_keys @npass
    @driver.find_element(:name, 'commit').click
  end

  def new_project_test
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'project_name').send_keys @project
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'project_identifier').send_keys '007'
    @driver.find_element(:name, 'commit').click
  end

  def add_new_user_to_project_test
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='0test_project3']").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'principal_search').send_keys 'testlogin_3'
    @driver.find_element(:xpath, "//label[contains(.,'second_user two')]").click
    @driver.find_element(:xpath, "//div[@class='roles-selection']//label[contains(.,'Reporter')]").click
    @driver.find_element(:id, 'member-add-submit').click
  end

  def edit_user_roles_test
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='0test_project3']").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:xpath, "(//a[contains(.,'Редактировать')])[2]").click
    @driver.find_element(:xpath, "(//p//label[contains(.,'Reporter')])[2]").click
    @driver.find_element(:xpath, "(//p//label[contains(.,'Developer')])[2]").click
    @driver.find_element(:xpath, "(//input[@class='small'][@type='submit'])[2]").click
  end

  def create_project_version_test
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='0test_project3']").click
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:xpath, "//a[contains(.,'Новая версия')]").click
    @driver.find_element(:id, 'version_name').send_keys 'New_version'
    @driver.find_element(:name, 'commit').click
  end

  def create_issues_test
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:id, "project_quick_jump_box").click
    @driver.find_element(:xpath, "//option[.='0test_project3']").click
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:xpath, '//option[contains(., "Bug")]').click
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue_bug'
    @driver.find_element(:name, 'continue').click
    @driver.find_element(:xpath, '//option[contains(., "Feature")]').click
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue_feature'
    @driver.find_element(:name, 'continue').click
    @driver.find_element(:xpath, '//option[contains(., "Support")]').click
    sleep 1
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue_support'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:class, 'issues').click
# verify issues presence
    assert(@driver.find_element(:xpath, '(//a[contains(.,"New_issue_bug")])[1]').dispalyed?)
    assert(@driver.find_element(:xpath, '(//a[contains(.,"New_issue_feature")])[1]').dispalyed?)
    assert(@driver.find_element(:xpath, '(//a[contains(.,"New_issue_support")])[1]').dispalyed?)
  end


  def teardown
    @driver.quit
  end

end


