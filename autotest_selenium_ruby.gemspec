# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autotest_selenium_ruby/version'

Gem::Specification.new do |spec|
  spec.name = "autotest_selenium_ruby"
  spec.version = AutotestSeleniumRuby::VERSION
  spec.authors = ["s.shimko"]
  spec.email = ["sergey1shimko@gmail.com"]

  spec.summary = %q{Write a short summary, because Rubygems requires one.}
  spec.description = %q{Write a longer description or delete this line.}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "test-unit-runner-gtk2"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "watir-webdriver"
end


