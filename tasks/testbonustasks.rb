require 'watir-webdriver'
require 'test/unit'
require 'selenium-webdriver'
require "watir-webdriver/extensions/alerts"

class TestBonusTasks < Test::Unit::TestCase

  def setup
    @browser = Watir::Browser.new :chrome
    @browser.driver.manage.timeouts.implicit_wait = 1
  end


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
    @browser.goto "https://the-internet.herokuapp.com/javascript_alerts"
    @browser.button(:xpath, "//button[@onclick='jsAlert()']").click
    @browser.alert.ok
    @browser.p(text: 'You successfuly clicked an alert').wait_until_present(2)

    @browser.button(:xpath, "//button[@onclick='jsConfirm()']").click
    @browser.alert.when_present.ok
    @browser.p(text: 'You clicked: Ok').wait_until_present(2)

    @browser.button(:xpath, "//button[@onclick='jsConfirm()']").click
    @browser.alert.when_present.close
    @browser.p(text: 'You clicked: Cancel').wait_until_present(2)

    @browser.button(:xpath, "//button[@onclick='jsPrompt()']").click
    @browser.alert.set "Test"
    @browser.alert.ok
    @browser.p(text: 'You entered: Test').wait_until_present(2)

    @browser.button(:xpath, "//button[@onclick='jsPrompt()']").click
    @browser.alert.set "Test"
    @browser.alert.close
    @browser.p(text: 'You entered: null').wait_until_present(2)
  end

  def multiple_windows
    @browser.goto "https://the-internet.herokuapp.com/windows"
    @browser.link(:xpath, "//a[@target='_blank']").click
    @browser.window(:title => "New Window").use
    @browser.h3(text: 'New Window').wait_until_present(2)
    @browser.window(:title => "The Internet").use
    @browser.h3(text: 'Opening a new window').wait_until_present(2)
  end

  def test_bonustasks
    # hover
    # drag_and_drop_realisation
    # select_list
    # iframe_realisation
    # key_presses
    # jquery_ui_menu
    # javascript_alerts
    multiple_windows


    # registration3(@login, "first_name", "last_name")
    # @browser.button(:name, 'commit').click
    # @browser.text.include? 'Ваша учётная запись активирована. Вы можете войти.'

  end


  def teardown
    @browser.close
  end

end
