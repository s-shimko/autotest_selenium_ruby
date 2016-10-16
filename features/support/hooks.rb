Before do
  # @headless = Headless.new
  # @headless.start
  @browser = Selenium::WebDriver.for :firefox
  @wait = Selenium::WebDriver::Wait.new(timeout:5)
end

After do
  @browser.quit
  # @headless.destroy
end


