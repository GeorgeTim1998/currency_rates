class ApiLayerService
  def initialize(client: nil)
    @client = client || ApiLayerClient.new
  end

  def live_call(params)
    JSON.parse(@client.live(params).body)
  end

  def list_call
    JSON.parse(@client.list.body)
  end
end
