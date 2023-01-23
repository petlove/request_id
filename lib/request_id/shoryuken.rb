# frozen_string_literal: true

module Shoryuken
  module Middleware
    module Server
      autoload :RequestId, 'shoryuken/middleware/server/request_id'
    end

    module Client
      autoload :RequestId, 'shoryuken/middleware/client/request_id'
    end
  end
end
