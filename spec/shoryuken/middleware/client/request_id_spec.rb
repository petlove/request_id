# frozen_string_literal: true

require 'spec_helper'

describe Shoryuken::Middleware::Client::RequestId do
  describe '#call' do
    context 'when request_id is present' do
      it 'adds the request id' do
        request_id = 'foobar'
        allow(RequestId).to receive(:request_id).and_return(request_id)

        options = {}
        described_class.new.call(options) {}

        expect(options[:message_attributes][:request_id]).to match({
          data_type: 'String',
          string_value: 'foobar'
        })
      end
    end

    context 'when request_id is nil' do
      it 'does not add the request id' do
        request_id = nil
        allow(RequestId).to receive(:request_id).and_return(request_id)

        options = {}
        described_class.new.call(options) {}

        expect(options[:message_attributes]).to be_empty
      end
    end
  end
end
