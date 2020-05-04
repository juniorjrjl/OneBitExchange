require 'rest-client'
require 'json'

class ExchangeService


    def initialize(source_currency, target_currency, amount)
        @source_currency = source_currency
        @target_currency = target_currency
        @amount = amount.to_f
    end

    def call
        begin
            get_exchange
        rescue RestClient::ExceptionWithResponse => e
            e.response
        end
    end

    private 

    def get_exchange
        exchange_api_url = Rails.application.credentials[:currency_api_url_v2]
        exchange_api_key = Rails.application.credentials[:currency_api_key_v2]
        url = "#{exchange_api_url}crypto/converter?pair1=#{@source_currency}&pair2=#{@target_currency}&amount=#{@amount}&access_key=#{exchange_api_key}"
        res = RestClient.get url
        JSON.parse(res.body)['response']["price_1x_#{@target_currency}"].to_f
    end

end