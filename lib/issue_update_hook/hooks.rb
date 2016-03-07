require 'json'

module IssueUpdateHook
	class Hooks < Redmine::Hook::ViewListener
      		def controller_issues_edit_after_save(context={})
			projects_array = Setting.plugin_issue_update_hook['notification_projects'].split(",").map!(&:strip)		
			project_updated = Project.where(:id => context[:issue].project_id).pluck(:identifier)[0]
			return if projects_array.exclude?(project_updated)

			status_name = IssueStatus.where(:id => context[:issue].status_id).pluck(:name)[0]

			url = Setting.plugin_issue_update_hook['notification_default']
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)			

			request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
			
			a = context[:issue].to_json
			hash = JSON.parse a
			hash["status_text"] = status_name

			request.body = hash.to_json
			res = http.request(request)
		end
	end
end
