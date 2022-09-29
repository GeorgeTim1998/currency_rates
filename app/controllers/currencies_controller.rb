class CurrenciesController < ApplicationController
  before_action :create_buffer
  def show
    render :show
  end

  def live
    ApiLayerService.new.live_call(live_params)
  end

  def list
    @currencies.buffer = ApiLayerService.new.list_call
  end

  private

  def live_params
    {
      source: 'EUR',
      currencies: 'RUB'
    }
  end

  def create_buffer
    @currencies = Currency.new
  end
end
