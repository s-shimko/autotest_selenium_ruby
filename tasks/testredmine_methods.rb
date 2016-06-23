module TestRedmineMethods

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

  def add_new_user_to_project(login)
    @driver.find_element(:class, 'projects').click
    dropDownMenu = @driver.find_element(:id, "project_quick_jump_box")
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, @project)
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'principal_search').send_keys login
    sleep 1
    @wait.until { @driver.find_element(:css, "#principals input[name*='membership']").displayed? }
    @driver.find_element(:css, "#principals input[name*='membership']").click
    @driver.find_element(:css, ".roles-selection input[value='4']").click
    @driver.find_element(:id, 'member-add-submit').click
  end

  def edit_user_roles
    @driver.find_element(:class, 'projects').click
    dropDownMenu = @driver.find_element(:id, "project_quick_jump_box")
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, @project)
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-members').click

    user_list = @driver.find_elements(:css, ".name .user")
    names = user_list.map {|user| user.text}
    index_user = names.index('third_user three')
    @index = index_user.to_i + 1

    @driver.find_element(:css, ".member:nth-child("+(@index.to_s)+") .icon-edit").click
    @driver.find_element(:css, ".member:nth-child("+(@index.to_s)+") input[value='4']").click
    @driver.find_element(:css, ".member:nth-child("+(@index.to_s)+") input[value='5']").click
    @driver.find_element(:css, ".member:nth-child("+(@index.to_s)+") .small").click

  end

  def create_project_version
    @driver.find_element(:class, 'projects').click
    dropDownMenu = @driver.find_element(:id, "project_quick_jump_box")
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, @project)
    @driver.find_element(:class, "settings").click
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:css, "#tab-content-versions .icon").click
    @driver.find_element(:id, 'version_name').send_keys 'New_version'
    @driver.find_element(:name, 'commit').click
  end

  def create_issue(option,issue_name)
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'projects').click
    dropDownMenu = @driver.find_element(:id, "project_quick_jump_box")
    option_sel = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option_sel.select_by(:text, @project)
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:css, "#issue_tracker_id option:nth-child(" + (option.to_s) + ")").click
    @driver.find_element(:id, 'issue_subject').send_keys issue_name
    @driver.find_element(:name, 'commit').click
  end

end