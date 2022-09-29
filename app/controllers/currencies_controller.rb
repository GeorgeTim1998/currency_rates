class CurrenciesController < ApplicationController
  before_action :create_buffer, only: %i[live list]
  after_action :cache, only: :live

  def show
    render :show
  end

  def live
    @currencies.buffer = ApiLayerService.new.live_call(live_params)
  end

  def list
    @currencies.buffer = ApiLayerService.new.list_call
  end

  def last_requests
    @requests = Redis.new.lrange('currencies', 0, -1)
  end

  private

  def live_params
    {
      source: params[:source],
      currencies: params[:currencies]
    }
  end

  def create_buffer
    @currencies = Currency.new
  end

  def cache
    CacheService.new.cache(@currencies)
  end
end
