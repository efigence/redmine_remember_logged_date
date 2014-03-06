require_dependency 'application_controller'

module RedmineRememberLoggedDate
  module ApplicationControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        before_filter :clean_session_timelog
      end
    end

    module InstanceMethods
      def clean_session_timelog
        return if controller_name == 'timelog' || session[:last_date].nil?
        session[:last_date] = nil
      end
    end
  end
end
