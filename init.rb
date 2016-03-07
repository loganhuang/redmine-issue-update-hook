require 'redmine'

require_dependency 'issue_update_hook/hooks'

Redmine::Plugin.register :issue_update_hook do
  name 'Issue update hook plugin'
  author 'Giorgi Kikolashvili'
  description 'This plugin notifies preconfigured address when issue is edited'
  version '0.0.6'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings :default => {'empty' => true}, :partial => 'settings/issue_update_hook_settings'
end
