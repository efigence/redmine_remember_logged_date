require_dependency 'application_helper'

module RedmineRememberLoggedDate
  module ApplicationHelperPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method :calendar_for, :calendar_for_with_last_date
      end
    end

    module InstanceMethods
      def calendar_for_with_last_date(field_id)
        include_calendar_headers_tags
        datepicker_init = "$('##{field_id}').datepicker(datepickerOptions);"
        set_date = session[:last_date] ? "$('##{field_id}').datepicker('setDate', '#{session[:last_date]}');" : nil
        base_script = "$(function() { #{datepicker_init} #{set_date} });"
        javascript_tag(base_script)
      end
    end
  end
end
