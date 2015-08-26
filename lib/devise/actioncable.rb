require "devise/actioncable/version"

class ActionCable::Connection::Base
    def self.glue_devise
class_eval <<-METHODS, __FILE__, __LINE__ + 1
    def self.helper_method *ignore
    end

    def warden
      @request.env['warden'] ||= begin
        manager = Warden::Manager.new(nil) do |config|
          config.merge! Devise.warden_config
        end
        Warden::Proxy.new(@request.env, manager)
      end
    end

    include Devise::Controllers::Helpers


    # I'm so hardcore
    def self.identified_by(*identifiers)
      self.identifiers += identifiers
    end
METHODS
    end
end
