# frozen_string_literal: true

module Shoryuken
  module Middleware
    module Client
      class RequestId
        def call(options)
          options[:message_attributes] ||= {}
          options[:message_attributes][:request_id] = {
            data_type: 'String',
            string_value: ::RequestId.request_id || SecureRandom.hex
          }
          yield
        end
      end
    end
  end
end
