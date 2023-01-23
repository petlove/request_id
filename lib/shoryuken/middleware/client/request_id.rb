# frozen_string_literal: true

module Shoryuken
  module Middleware
    module Client
      class RequestId
        def call(options)
          options[:message_attributes] ||= {}

          request_id = ::RequestId.request_id

          if request_id
            options[:message_attributes][:request_id] = {
              data_type: 'String',
              string_value: request_id
            }
          end

          yield
        end
      end
    end
  end
end
