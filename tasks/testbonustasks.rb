require 'watir-webdriver'
require 'test/unit'
require 'selenium-webdriver'

# require_relative 'testredmine_methods'
class TestBonusTasks < Test::Unit::TestCase

  def setup
    @browser = Watir::Browser.new :chrome

    @login = ('testlogin1' + rand(9999999).to_s)
    @login2 = ('testlogin2' + rand(9999999).to_s)
    @login3 = ('testlogin3' + rand(9999999).to_s)
    @project = ('test_project' + rand(9999999).to_s)

    @pass = '1234'
    @npass = '1111'
    @pass2 = '1234'
  end

# include TestRedmineMethods

  def registration3(login, first_name, last_name)
    @browser.goto 'http://demo.redmine.org'
    @browser.link(:class, 'register').click
    @browser.text_field(:id, 'user_login').set login
    @browser.text_field(:id, 'user_password').set @pass
    @browser.text_field(:id, 'user_password_confirmation').set @pass
    @browser.text_field(:id, 'user_firstname').set first_name
    @browser.text_field(:id, 'user_lastname').set last_name
    @browser.text_field(:id, 'user_mail').set(login + '@dd.dd')
    @browser.select_list(:id, "user_language").select 'English'
  end

# browser.goto 'http://demo.redmine.org'
# browser.link(:class, 'register').click
# browser.text_field(:id, 'user_login').set @login
# browser.text_field(:id, 'user_password').set @pass
# browser.text_field(:id, 'user_password_confirmation').set @pass
# browser.text_field(:id, 'user_firstname').set 'first_name'
# browser.text_field(:id, 'user_lastname').set 'last_name'
# browser.text_field(:id, 'user_mail').set(@login + '@dd.dd')
# browser.select_list(:id, "user_language").select 'English'

  def test_demo
    registration3(@login, "first_name", "last_name")

    @browser.button(:name, 'commit').click
    @browser.text.include? 'Ваша учётная запись активирована. Вы можете войти.'

  end

  def teardown
    @browser.close
  end

end
