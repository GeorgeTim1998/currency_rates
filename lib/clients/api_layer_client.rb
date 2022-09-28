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

  def live(currensies, source)
    url = URI("#{ROOT_ENDPOINT}/live?source=#{source}&currencies=#{currensies}")

    send_request(url)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

  def send_request(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = ACCESS_TOKEN

    response = https.request(request).read_body

    JSON.parse(response)
  end
end
