class ChangePasswordPage
  include PageObject

  page_url "http://demo.redmine.org/my/password"

  text_field(:password, :id => 'password')
  text_field(:new_password, :id => 'new_password')
  text_field(:new_password_confirmation, :id => 'new_password_confirmation')
  button(:apply, :name => 'commit')

end