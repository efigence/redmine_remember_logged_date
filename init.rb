require 'redmine'

Redmine::Plugin.register :redmine_remember_logged_date do
  name 'Redmine remember logged date'
  author 'Jacek Grzybowski'
  description "Allows redmine to remember last logged date after clicking on create and continue"
  version '0.1'
  url 'http://github.com/efigence/redmine_remember_logged_date'
  author_url 'http://efigence.com'
end

ActionDispatch::Callbacks.to_prepare do
  ApplicationHelper.send(:include, RedmineRememberLoggedDate::ApplicationHelperPatch)
  ApplicationController.send(:include, RedmineRememberLoggedDate::ApplicationControllerPatch)
  TimelogController.send(:include, RedmineRememberLoggedDate::TimelogControllerPatch)
end
