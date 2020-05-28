# Redmine issue update hook

This plugin allows you to send notificatoin when Redmine issue is updated

## How it works

The hook is triggered when issue form data is updated or note is added.
It sends HTTP _POST_ request to the address which can be configured on plugin settings page.

Notification HTTP body includes JSON data that describes issue state after the update

```JSON
{
    "id": 3, 
    "tracker_id": 1, 
    "project_id": 1, 
    "subject": "##12312##", 
    "description": "", 
    "due_date": null, 
    "category_id": null, 
    "status_id": 2, 
    "assigned_to_id": null, 
    "priority_id": 1, 
    "fixed_version_id": null, 
    "author_id": 1, 
    "lock_version": 13, 
    "created_on": "2016-02-09T13:09:45.110Z", 
    "updated_on": "2016-02-12T10:03:11.799Z", 
    "start_date": "2016-02-09", 
    "done_ratio": 0, 
    "estimated_hours": null, 
    "parent_id": null, 
    "root_id": 3, 
    "lft": 1, 
    "rgt": 2, 
    "is_private": false, 
    "closed_on": null, 
    "status_text": "Open" 
}
```

here the value of `status_text` is issue status e.g. _Open_, _Resolved_, _Closed_

## Install and Configure

1. cp -R redmine-issue-update-hook/ /usr/src/redmine/plugins/issue_update_hook/
2. Go to `Administration->Plugins->Issue update hook plugin`
3. Choose a project to monitor
4. Choose an endpoint that should receive the notifications from hook

## Version

Plugin was tested on Redmine 3.2.0 running in [docker container](https://hub.docker.com/_/redmine/)
