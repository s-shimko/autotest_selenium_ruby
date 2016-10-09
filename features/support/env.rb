# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'page_objects'))

require 'selenium-webdriver'
require 'rspec/expectations'
require 'test-unit'
require 'test/unit'
require 'watir-webdriver'
require 'rspec'
require 'cucumber'
require 'page-object'
require 'page-object/page_factory'

World(RSpec::Matchers) #to make rspec matchers work
World(PageObject::PageFactory)