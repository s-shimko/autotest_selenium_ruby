class RegisterPage
  include PageObject

  page_url 'http://demo.redmine.org/account/register'

  text_field(:user_login, :id => 'user_login')
  text_field(:user_password, :id => 'user_password')
  text_field(:user_password_confirmation, :id => 'user_password_confirmation')
  text_field(:user_firstname, :id => 'user_firstname')
  text_field(:user_lastname, :id => 'user_lastname')
  text_field(:user_mail, :id => 'user_mail')

  select_list(:user_language, :id => 'user_language')

  button(:submit, :name => 'commit')

  div(:flash_notice, :id => 'flash_notice')
  # div(:error_explanation, :id => 'errorExplanation')
  div(:error_explanation, :xpath => "//div[@id='errorExplanation']/ul/li")

end