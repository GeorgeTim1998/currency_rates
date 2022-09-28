class ApiLayerService
  def initialize(client: nil)
    @client = client || ApiLayerClient.new
  end

  def live_call(params)
    @client.live(params)
  end

  def list_call
    @client.list
  end
end
