require_relative 'page_objects/change_password_page'
require_relative 'page_objects/home_page'
require_relative 'page_objects/login_page'
require_relative 'page_objects/my_account_page'
require_relative 'page_objects/register_page'
require_relative 'page_objects/projects_page'
# require_relative 'user'

#rspec spec/lib/rspec_task2/rspec_testredmine.rb --format documentation



describe 'All Redmine tests' do
  let :logout do
    visit(HomePage)
    on(HomePage).logout_element.when_visible($WT).click
  end

  subject {@login}

  shared_context 'title' do |value|
    puts value
   end

  shared_examples 'page title' do |value|
    include_context 'title', "sad"
    it 'verify and puts page title' do
      puts value
      puts @browser.title
      expect(@browser.title).to include "demo"
    end
  end



  describe 'Test verify possibility to change password', :aaa do

    before :all do
      @browser = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      @login = ('testlogin1' + rand(9999999).to_s)
      @login2 = ('testlogin2' + rand(9999999).to_s)
      @login3 = ('testlogin3' + rand(9999999).to_s)
      @project = ('test_project' + rand(9999999).to_s)

      @pass = '1234'
      @npass = '1111'
      @pass2 = '1234'
      registration(@login, @pass, '123', '123')
    end

    let(:login_puts) { puts "Login is: #{@login}"}

    it { is_expected.to include 'testlogin'}

    it 'click My account link', some_data:'value' do
      on(HomePage).my_account_element.when_visible($WT).click
    end

    include_examples 'page title', 'Page title is:'

    it 'change password' do
      change_pass(@pass, @npass)
    end

    it 'click Apply button' do
      on(ChangePasswordPage).apply_element.when_visible($WT).click
    end

    it 'logout' do
      logout
    end

    include_examples 'page title', 'Page title is:'

    it 'login witn changed password' do
      login(@login,@npass)
    end

    it 'verify that I enter on site with new password' do
      login_puts
      helper_puts(@login)
      expected_text = "Logged in as #{@login}"
      actual_text = on(HomePage).loggedas_element.when_visible($WT).text
      expect(actual_text).to eql(expected_text)
    end

    after :all do
      @browser.quit
    end

  end

  context 'New project creation' do

    before :context do
      @browser = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      @login = ('testlogin1' + rand(9999999).to_s)
      @login2 = ('testlogin2' + rand(9999999).to_s)
      @login3 = ('testlogin3' + rand(9999999).to_s)
      @project = ('test_project' + rand(9999999).to_s)

      @pass = '1234'
      @npass = '1111'
      @pass2 = '1234'
      registration(@login, @pass, '123', '123')
    end

    it 'logout' do
      logout
    end

    it 'registrate second user' do
      registration(@login2, @pass, 'second_user', 'two')
      logout
    end

    it 'login with first user' do
      login(@login,@pass)
    end

    it 'create new project' do
      add_new_project
    end

    it 'add new user to project with login2' do
      add_new_user_to_project(@login2)
    end

    it 'verify that user was added' do
      sleep 1
      user_list2 = @browser.find_elements(:css, ".name .user")
      sleep 1
      names2 = user_list2.map {|user| user.text}
      @index2 = names2.index('second_user two')

      expected_text = 'second_user two'
      actual_text = @browser.find_elements(:css, ".name .user")[@index2.to_i].text
      expect(actual_text).to eql(expected_text)
    end

    after :context do
      @browser.quit
    end

  end

end