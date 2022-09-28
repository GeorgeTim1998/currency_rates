class ApiLayerService
  def initialize(client: nil)
    @client = client || ApiLayerClient.new
  end

  def list_call(currensies, source)
    @client.live(currensies, source)
  end

  def live_call
    @client.list
  end
end
