module TestMethodsWatir

  def registration_watir(login, first_name, last_name)
    @browser.goto 'http://demo.redmine.org'
    @browser.link(:class, 'register').click
    @browser.text_field(:id, 'user_login').set login
    @browser.text_field(:id, 'user_password').set @pass
    @browser.text_field(:id, 'user_password_confirmation').set @pass
    @browser.text_field(:id, 'user_firstname').set first_name
    @browser.text_field(:id, 'user_lastname').set last_name
    @browser.text_field(:id, 'user_mail').set(login + '@dd.dd')
    @browser.select_list(:id, "user_language").select 'English'
    @browser.button(:name, 'commit').click
    @browser.div(text: 'Ваша учётная запись активирована. Вы можете войти.').wait_until_present(2)

  end

  def create_new_project(project)
    @browser.link(:class, 'projects').click
    @browser.link(:class, 'icon-add').click
    @browser.text_field(:id, 'project_name').set project
    @browser.text_field(:id, 'project_identifier').set @identifier
    @browser.button(:name, 'commit').click
  end

  def new_issue(option,issue_name)
    @browser.link(:css, '.new-issue').click
    @browser.select_list(:id, "issue_tracker_id").select option
    @browser.text_field(:id, 'issue_subject').send_keys issue_name
    @browser.button(:name, 'commit').click
  end

  def add_self_as_watcher(name)
    @browser.link(:xpath, "//a[contains(.,'"+name+"')]").click
    @browser.link(:xpath, "(//a[contains(.,'Watch')])[1]").click
    @browser.a(text: "Unwatch").wait_until_present(2)
  end

  def login(login, pass)
    @browser.goto 'http://demo.redmine.org'
    # @browser.div(text: 'Ваша учётная запись активирована. Вы можете войти.').wait_until_present(2)
    # @wait.until { @driver.find_element(:class, 'login').displayed? }
    @browser.element(:class, 'login').click
    @browser.element(:id, 'username').send_keys login
    @browser.element(:id, 'password').send_keys pass
    @browser.button(:name, 'login').click
  end

end