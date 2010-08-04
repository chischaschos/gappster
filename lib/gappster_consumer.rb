module Gappster
  module Config
    def gappster_authenticable(domain = '')
    end
  end
  module Consumer
    def gappster_start
    end
    def gappster_complete
    end
  end
end

class ActionController::Base
  extend Gappster::Config
  include Gappster::Consumer
end
