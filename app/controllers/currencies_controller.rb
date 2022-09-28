class CurrenciesController < ApplicationController
  def live
    ApiLayerService.new.live_call
  end

  def list
    ApiLayerService.new.list_call(currensies, source)
  end
end
