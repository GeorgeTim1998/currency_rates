class CurrenciesController < ApplicationController
  def show
    render :show
  end

  def live
    ApiLayerService.new.live_call(live_params)
  end

  def list
    ApiLayerService.new.list_call
  end

  private

  def live_params
    {
      source: 'EUR',
      currencies: 'RUB'
    }
  end
end
