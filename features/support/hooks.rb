Before do
  @driver = Selenium::WebDriver.for :firefox
  @wait = Selenium::WebDriver::Wait.new(timeout:5)
end

After do
  @driver.quit
end

