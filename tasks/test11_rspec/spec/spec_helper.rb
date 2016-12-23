require 'selenium-webdriver'
require 'rspec/expectations'
require 'watir-webdriver'
require 'rspec'
require 'cucumber'
require 'page-object'
require 'page-object/page_factory'
require 'headless'
require 'testredmine_methods_cucumber_second'

$WT = 3

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.include TestredmineMethodsCucumberSecond
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # config.before :all do
  # # config.add_formatter Spec::Runner::Formatter::TeamcityFormatter
  #   @browser = Selenium::WebDriver.for :chrome
  #   # @browser = window.move_to 100, 0
  #   @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  #   visit(HomePage)
  #   on(HomePage).register
  # end
  #
  # config.after :all do
  #   @browser.quit
  # end

  # config.around(:context) do |context|
  #   @browser = Selenium::WebDriver.for :chrome
  #   @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  #   visit(HomePage)
  #   on(HomePage).register
  #
  #   context.run
  #
  #   @browser.quit
  #
  # end
end

def helper_puts(value)
  puts "I puts: #{value}"
end

# after :each do |example|
#   if example.exception
#     save_screenshot
#   end
# end

# around(:example) do |example|
#   puts "around example before"
#   example.run
#   puts "around example before"
# end

