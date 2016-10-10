class HomePage
  include PageObject

  page_url 'http://demo.redmine.org'

  link(:signin, :class => 'login')
  link(:register, :class => 'register')
  link(:projects, :class => 'projects')
  link(:logout, :class => 'logout')
  link(:my_account, :class => 'my-account')
  div(:loggedas, :id => 'loggedas')


end