class HomePage
  include PageObject
  include PageObject::PageFactory

  page_url 'http://demo.redmine.org'

  link(:signin, :class => 'login')
  link(:register, :class => 'register')
  link(:projects, :class => 'projects')

end