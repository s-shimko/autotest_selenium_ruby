require 'watir'

browser = Watir::Browser.new :chrome
browser.goto "http://demo.redmine.org"



browser.close
