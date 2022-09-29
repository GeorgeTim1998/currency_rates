require 'uri'
require 'net/http'

class ApiLayerClient
  ROOT_ENDPOINT = 'https://api.apilayer.com/currency_data'.freeze
  ACCESS_TOKEN = 'RY6ogV9vWxpI5xh42I6x177IC2NYrFi7'.freeze

  def initialize
    @http_client = setup_http_client
  end

  def list
    @http_client.get('list') do |request|
      request['apikey'] = ACCESS_TOKEN
      request['Content-Type'] = 'application/json'
    end
  end

  def live(params)
    @http_client.get('live') do |request|
      request['apikey'] = ACCESS_TOKEN
      request['Content-Type'] = 'application/json'
      request.params = params
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
