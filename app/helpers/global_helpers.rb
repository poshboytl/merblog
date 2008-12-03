module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    def login?
      !session.user.nil?
    end
  end
end
