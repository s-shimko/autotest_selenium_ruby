require 'watir-webdriver'
require 'test/unit'
require 'selenium-webdriver'

# require_relative 'testredmine_methods'
class TestBonusTasks < Test::Unit::TestCase

  def setup
    @browser = Watir::Browser.new :chrome
    @browser.driver.manage.timeouts.implicit_wait = 1

    # @login = ('testlogin1' + rand(9999999).to_s)
    # @login2 = ('testlogin2' + rand(9999999).to_s)
    # @login3 = ('testlogin3' + rand(9999999).to_s)
    # @project = ('test_project' + rand(9999999).to_s)
    #
    # @pass = '1234'
    # @npass = '1111'
    # @pass2 = '1234'
  end

# include TestRedmineMethods

# def registration3(login, first_name, last_name)
#   @browser.goto 'http://demo.redmine.org'
#   @browser.link(:class, 'register').click
#   @browser.text_field(:id, 'user_login').set login
#   @browser.text_field(:id, 'user_password').set @pass
#   @browser.text_field(:id, 'user_password_confirmation').set @pass
#   @browser.text_field(:id, 'user_firstname').set first_name
#   @browser.text_field(:id, 'user_lastname').set last_name
#   @browser.text_field(:id, 'user_mail').set(login + '@dd.dd')
#   @browser.select_list(:id, "user_language").select 'English'
# end

  def hover
    @browser.goto "https://the-internet.herokuapp.com/hovers"
    el_list = @browser.elements(:css, ".figure>img")
    el_list[0].hover
    @browser.h5(text: 'name: user1').wait_until_present(2)
    el_list[1].hover
    @browser.h5(text: 'name: user2').wait_until_present(2)
    el_list[2].hover
    @browser.h5(text: 'name: user3').wait_until_present(2)
  end

  def drag_and_drop_realisation
    @browser.goto "https://the-internet.herokuapp.com/drag_and_drop"
    el1 = @browser.element(:css, "#column-a")
    el2 = @browser.element(:css, "#column-b")
# @browser.driver.action.drag_and_drop(el1, el2).perform
    el1.driver.action.drag_and_drop(@element, el2.wd).perform
    sleep 1
  end

  def select_list
    @browser.goto "https://the-internet.herokuapp.com/dropdown"
    @browser.select_list(:id, "dropdown").select("Option 1")
    @browser.option(text: 'Option 1').wait_until_present(2)
    @browser.select_list(:id, "dropdown").select_value("2")
    @browser.option(text: 'Option 2').wait_until_present(2)
  end

  def iframe_realisation
    @browser.goto "https://the-internet.herokuapp.com/iframe"
    @browser.frame(:id => "tinymce").text_field(:id => "tinymce").set "admin"
  end

  def key_presses
    @browser.goto "https://the-internet.herokuapp.com/key_presses"
    @browser.send_keys :enter
    sleep 1
    @browser.p(text: 'You entered: ENTER').wait_until_present(2)
    sleep 1
    @browser.send_keys :escape
    sleep 1
    @browser.p(text: 'You entered: ESCAPE').wait_until_present(2)
  end

  def jquery_ui_menu
    @browser.goto "https://the-internet.herokuapp.com/jqueryui/menu"
    @browser
  end

  def javascript_alerts

  end

  def multiple_windows

  end

  def test_bonustasks
    # hover
    # drag_and_drop_realisation
    # select_list
    # iframe_realisation
    # key_presses
    jquery_ui_menu


    # registration3(@login, "first_name", "last_name")
    # @browser.button(:name, 'commit').click
    # @browser.text.include? 'Ваша учётная запись активирована. Вы можете войти.'

  end


  def teardown
    @browser.close
  end

end
