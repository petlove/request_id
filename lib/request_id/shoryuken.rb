# frozen_string_literal: true

module Shoryuken
  module Middleware
    autoload :RequestId, 'shoryuken/middleware/server/request_id'
    autoload :RequestId, 'shoryuken/middleware/client/request_id'
  end
end
