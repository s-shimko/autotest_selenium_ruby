class LoginPage
  include PageObject

  page_url "http://demo.redmine.org/login"

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login_button, :name => 'login')

end