class ProjectsPage
  include PageObject

  page_url 'http://demo.redmine.org/projects'

  link(:username, :id => 'username')
  link(:new_project, :class => 'icon-add')
  text_field(:project_name, :id => 'project_name')
  text_field(:project_identifier, :id => 'project_identifier')
  button(:create, :name => 'commit')

end