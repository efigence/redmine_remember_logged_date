require_dependency 'timelog_controller'

module RedmineRememberLoggedDate
  module TimelogControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        after_filter :save_last_date_to_session, :only => [:create, :update]
      end
    end

    module InstanceMethods
      def save_last_date_to_session
        session[:last_date] = @time_entry.spent_on.to_s(:db).gsub('/', '-')
      end
    end
  end
end
