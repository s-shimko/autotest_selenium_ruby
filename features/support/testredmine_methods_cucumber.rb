module TestredmineMethodsCucumber

   def login(login, pass)
    visit(HomePage)
    on(HomePage).signin_element.when_visible($WT).click
    on(LoginPage).username_element.when_visible($WT).send_keys login
    on(LoginPage).password_element.when_visible($WT).send_keys pass
    on(LoginPage).login_button_element.when_visible($WT).click
  end

  def logout
    visit(HomePage)
    on(HomePage).logout_element.when_visible($WT).click
  end

  def registration(login, pass, first_name, last_name)
    visit(HomePage)
    on(HomePage).register_element.when_visible($WT).click
    on(RegisterPage).user_login_element.when_visible($WT).send_keys login
    on(RegisterPage).user_password = pass
    on(RegisterPage).user_password_confirmation = pass
    on(RegisterPage).user_firstname = first_name
    on(RegisterPage).user_lastname = last_name
    on(RegisterPage).user_language = 'English'
    on(RegisterPage).user_mail = login + '@dd.dd'
    on(RegisterPage).submit
  end

  def change_pass(pass, npass)
    on(MyAccountPage).change_password_element.when_visible($WT).click
    on(ChangePasswordPage).password_element.when_visible($WT).send_keys pass
    on(ChangePasswordPage).new_password_element.when_visible($WT).send_keys npass
    on(ChangePasswordPage).new_password_confirmation_element.when_visible($WT).send_keys npass
    on(ChangePasswordPage).apply_element.when_visible($WT).click
  end

  def add_new_project
    on(HomePage).projects_element.when_visible($WT).click
    on(ProjectsPage).new_project_element.when_visible($WT).click
    on(ProjectsPage).project_name_element.when_visible($WT).send_keys @project
    on(ProjectsPage).project_identifier_element.when_visible($WT).send_keys '007'
    on(ProjectsPage).create_element.when_visible($WT).click
  end

  def add_new_user_to_project(login)
    on(HomePage).projects_element.when_visible($WT).click
    on(ProjectsPage).projects_dropdown_element.when_visible($WT).select @project
    on(ProjectsPage).settings_element.when_visible($WT).click
    on(ProjectsPage).members_element.when_visible($WT).click
    on(ProjectsPage).new_member_element.when_visible($WT).click
    on(ProjectsPage).principal_search_element.when_visible($WT).send_keys login
    sleep 1
    @wait.until { @browser.find_element(:css, "#principals input[name*='membership']").displayed? }
    @browser.find_element(:css, "#principals input[name*='membership']").click
    @browser.find_element(:css, ".roles-selection input[value='4']").click
    on(ProjectsPage).add_element.when_visible($WT).click
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