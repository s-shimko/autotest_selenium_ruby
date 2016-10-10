class MyAccountPage
  include PageObject

  page_url "http://demo.redmine.org/my/account"

  link(:change_password, :class => 'icon-passwd')
end