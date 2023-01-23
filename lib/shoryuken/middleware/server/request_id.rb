# frozen_string_literal: true

module Shoryuken
  module Middleware
    module Server
      class RequestId
        class << self
          attr_accessor :no_reset
        end

        def initialize(options = nil)
          @options = options || default_options
        end

        def call(_worker, _queue, sqs_msg, _body)
          @options[:headers].each do |kv|
            ::RequestId.set(kv[:key], kv[:value].call(sqs_msg))
          end
          yield
        ensure
          @options[:headers].each do |kv|
            ::RequestId.set(kv[:key], nil) unless self.class.no_reset
          end
        end

        private

        def default_options
          {
            headers: [
              {
                key: :request_id,
                value: ->(sqs_msg) do
                  if sqs_msg.message_attributes['request_id']
                    sqs_msg.message_attributes['request_id'].string_value
                  else
                    nil
                  end
                end
              }
            ]
          }
        end
      end
    end
  end
end
