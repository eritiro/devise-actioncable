require "devise/actioncable/version"
require "action_cable/connection/base"

ActionCable::Connection::Base.class_eval do
    def self.glue_devise
class_eval <<-METHODS, __FILE__, __LINE__ + 1
    def self.helper_method *ignore
    end

    include Devise::Controllers::Helpers

    def warden
      @request.env['warden'] ||= begin
        manager = Warden::Manager.new(nil) do |config|
          config.merge! Devise.warden_config
        end
        Warden::Proxy.new(@request.env, manager)
      end
    end

    def self.identified_by(*identifiers)
      self.identifiers += identifiers
    end
METHODS
    end
end
