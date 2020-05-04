require 'rails_helper'
require 'json'
require './app/services/exchange_service'

describe ExchangeService do
    let(:source_currency) {"USD"}
    let(:target_currency) {"BRL"}
    let(:exchange_value) {3.4546}
    let(:amount) {rand(0..9999)}
    let(:api_return) do
        {
            status: true,
            code: 200,
            msg: "Successfully",
            response: {
                price_1x_USD: "#{amount * exchange_value}",
                price_1x_BRL: "48920",
                total: "1222"
            },
            info: {
            server_time: "2020-05-04 14:16:01 UTC",
            credit_count: 1
    }
        }
    end

    before do
        allow(RestClient).to receive(:get) {OpenStruct.new(body: api_return.to_json)}
    end

    it '#call' do
        service_exchange = ExchangeService.new('BRL', 'USD', amount).call
        puts service_exchange
        expected_exchange = amount * exchange_value
        expect(service_exchange).to eq(expected_exchange)
    end
end