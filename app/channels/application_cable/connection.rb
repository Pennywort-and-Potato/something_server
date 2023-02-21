module ApplicationCable
  class Connection < ActionCable::Connection::Base
    rescue_from StandardError, with: :report_error
    identified_by :current_user

    def connect
      self.current_user = @current_user
    end

    private 

    def report_error(e)
      SomeExternalBugtrackingService.notify(e)
    end
  end
end
