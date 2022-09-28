class CurrenciesController < ApplicationController
  def live(currensies, source)
    ApiLayerService.new.live_call(currensies, source)
  end

  def list
    ApiLayerService.new.list_call
  end
end
