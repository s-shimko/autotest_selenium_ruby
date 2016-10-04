# 1. Create method which gets 10 random integers (from 0 to 9) (generate it using while or until)
#
#                   before output for each next number we should puts "========="
#                   if number is even or odd it should puts string "the number is even" or "the number is odd"
#                   if it's more (or less) than 5 it should puts appropriate string "the number is more (or less) than 5"
#                   in case we've got "0" we should puts "we've got 0"
#                   in each case we should get 2 messages except the '0' case

def generate_ten_random_numbers
  i = 1
  while i <= 10
    a = rand(0..9)
    puts "================="
    puts "#{i}: a = #{a}"

    if a < 5
      puts "the number is less than 5"
    elsif a == 5
      puts "the number is 5"
    else
      puts "the number is more than 5"
    end
    a.even? ? (puts "the number is even") : (puts "the number is odd")
    if a == 0
      puts "we've got 0"
    end

    i += 1
  end
end

#                   2. add to your solution next test
#
#                   create project
#                   make a random action: create or not a new bug issue
#                   open project page,
#                   open issues tab
#                   if there is a bug present then add self to watchers
#                   if no then create a new bug issue and then add self to watchers
#                   Verify that there is a bug issue and that current user is a watcher
#

require 'watir-webdriver'
require 'test/unit'
require 'selenium-webdriver'
require 'rspec'

require_relative 'test_methods_watir'
require_relative 'no_project_error'
class Test2ConstructionsAndOperators < Test::Unit::TestCase

  include RSpec::Matchers

  def setup
    @browser = Watir::Browser.new :chrome
    @browser.driver.manage.timeouts.implicit_wait = 1

    @login = ('testlogin1' + rand(9999999).to_s)
    @login2 = ('testlogin2' + rand(9999999).to_s)
    @login3 = ('testlogin3' + rand(9999999).to_s)
    @project = ('test_project' + rand(9999999).to_s)
    @identifier = ('id' + rand(9999999).to_s)
    @bug_name = ('bug' + rand(9999999).to_s)
    @pass = '1234'
  end

  include TestMethodsWatir

  def task5_exceptions
    registration_watir(@login, "first_name", "last_name")
    count = 0
    while count <= 3
      @browser.element(:css, ".projects").click

      check_prjct = @browser.text.include? @project
      NoProjectError.nop unless check_prjct

      if check_prjct == false
        create_new_project(@project)
        count += 1
      else
        @browser.element(:text => @project).click
        expect(@browser.h1.text).to include @project
        # @browser.h1(text: @project).wait_until_present(2)
        puts "Project was found!"
        count = 4
      end
    end
  end


  def task2_constructions_and_operators
      registration_watir(@login, "first_name", "last_name")
      create_new_project(@project)

      a = rand(0..1)
      if a == 0
        new_issue('Bug', @bug_name)
      end

      @browser.select_list(:id, "project_quick_jump_box").select(@project)
      @browser.link(:class, 'issues').click

      if @browser.a(text: @bug_name).present? == true
        add_self_as_watcher(@bug_name)
      else
        new_issue('Bug', @bug_name)
        @browser.select_list(:id, "project_quick_jump_box").select(@project)
        @browser.link(:class, 'issues').click
        add_self_as_watcher(@bug_name)
      end
    end

    def test_start
      task5_exceptions
      # task2_constructions_and_operators
    end


    def teardown
      @browser.close
    end

  end










