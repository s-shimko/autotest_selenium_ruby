class ProjectsPage
  include PageObject

  page_url 'http://demo.redmine.org/projects'

  link(:username, :id => 'username')
  link(:new_project, :class => 'icon-add')
  text_field(:project_name, :id => 'project_name')
  text_field(:project_identifier, :id => 'project_identifier')
  button(:create, :name => 'commit')
  select_list(:projects_dropdown, :id => 'project_quick_jump_box')
  button(:settings, :class => 'settings')
  button(:members, :id => 'tab-members')
  link(:new_member, :class => 'icon-add')
  text_field(:principal_search, :id => 'principal_search')
  button(:add, :id => 'member-add-submit')
end