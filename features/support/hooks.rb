Before do
  @browser = Selenium::WebDriver.for :firefox
  @wait = Selenium::WebDriver::Wait.new(timeout:5)
end

After do
  @browser.quit
end


