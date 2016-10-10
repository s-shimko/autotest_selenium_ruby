module TestredmineMethods

   def login(login, pass)
    @browser.navigate.to 'http://demo.redmine.org'
    @wait.until { @browser.find_element(:class, 'login').displayed? }
    @browser.find_element(:class, 'login').click
    @browser.find_element(:id, 'username').send_keys login
    @browser.find_element(:id, 'password').send_keys pass
    @find.pass_element(:name, 'login').click
  end

  def logout
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'logout').click
  end

  def registration(login, first_name, last_name)
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'register').click
    @browser.find_element(:id, 'user_login').send_keys login
    @browser.find_element(:id, 'user_password').send_keys @pass
    @browser.find_element(:id, 'user_password_confirmation').send_keys @pass
    @browser.find_element(:id, "user_language").click
    @browser.find_element(:css, "option[value*='ru']").click
    @browser.find_element(:id, 'user_firstname').send_keys first_name
    @browser.find_element(:id, 'user_lastname').send_keys last_name
    @browser.find_element(:id, 'user_mail').send_keys(login + '@dd.dd')
    @browser.find_element(:name, 'commit').click
  end

  def change_pass(pass, npass)
    @browser.find_element(:class, 'my-account').click
    @browser.find_element(:class, 'icon-passwd').click
    @browser.find_element(:id, 'password').send_keys pass
    @browser.find_element(:id, 'new_password').send_keys npass
    @browser.find_element(:id, 'new_password_confirmation').send_keys npass
    @browser.find_element(:name, 'commit').click
  end

  def add_new_project
    @browser.find_element(:class, 'projects').click
    @browser.find_element(:class, 'icon-add').click
    @browser.find_element(:id, 'project_name').send_keys @project
    @browser.find_element(:id, 'project_identifier').send_keys '007'
    @browser.find_element(:name, 'commit').click
  end

  def add_new_user_to_project(login)
    @browser.find_element(:class, 'projects').click
    dropDownMenu = @browser.find_element(:id, "project_quick_jump_box")
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, @project)
    @browser.find_element(:class, "settings").click
    @browser.find_element(:id, 'tab-members').click
    @browser.find_element(:class, 'icon-add').click
    @browser.find_element(:id, 'principal_search').send_keys login
    sleep 1
    @wait.until { @browser.find_element(:css, "#principals input[name*='membership']").displayed? }
    @browser.find_element(:css, "#principals input[name*='membership']").click
    @browser.find_element(:css, ".roles-selection input[value='4']").click
    @browser.find_element(:id, 'member-add-submit').click
  end

  def edit_user_roles
    @browser.find_element(:class, 'projects').click
    dropDownMenu = @browser.find_element(:id, "project_quick_jump_box")
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, @project)
    @browser.find_element(:class, "settings").click
    @browser.find_element(:id, 'tab-members').click

    @user_list = @browser.find_elements(:css, ".name .user")
    @names = @user_list.map {|user| user.text}
    @index = @names.index('third_user three')

    @browser.find_elements(:css, ".member .icon-edit")[@index].click
    @browser.find_elements(:css, ".member input[value='4']")[@index].click
    @browser.find_elements(:css, ".member input[value='5']")[@index].click
    @browser.find_elements(:css, ".member .small")[@index].click
  end

  def create_project_version
    @browser.find_element(:class, 'projects').click
    dropDownMenu = @browser.find_element(:id, "project_quick_jump_box")
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, @project)
    @browser.find_element(:class, "settings").click
    @browser.find_element(:id, 'tab-versions').click
    @browser.find_element(:css, "#tab-content-versions .icon").click
    @browser.find_element(:id, 'version_name').send_keys 'New_version'
    @browser.find_element(:name, 'commit').click
  end

  def create_issue(option,issue_name)
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'projects').click
    dropDownMenu = @browser.find_element(:id, "project_quick_jump_box")
    option_sel = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option_sel.select_by(:text, @project)
    @browser.find_element(:class, 'new-issue').click
    @browser.find_element(:id, 'issue_tracker_id').click
    @browser.find_element(:css, "#issue_tracker_id option:nth-child(" + (option.to_s) + ")").click
    @browser.find_element(:id, 'issue_subject').send_keys issue_name
    @browser.find_element(:name, 'commit').click
  end

   # def registration3(login, first_name, last_name)
   #   browser.goto 'http://demo.redmine.org'
   #   browser.link(:class, 'register').click
   #   browser.text_field(:id, 'user_login').set login
   #   browser.text_field(:id, 'user_password').set @pass
   #   browser.text_field(:id, 'user_password_confirmation').set @pass
   #   browser.text_field(:id, 'user_firstname').set first_name
   #   browser.text_field(:id, 'user_lastname').set last_name
   #   browser.text_field(:id, 'user_mail').set(login + '@dd.dd')
   #   browser.select_list(:id, "user_language").select 'English'
   # end


end
