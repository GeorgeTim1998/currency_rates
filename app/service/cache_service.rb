class CacheService
  attr_reader :redis

  def initialize
    @redis = Redis.new
  end

  def cache(currencies)
    if @redis.lrange('currencies', 0, -1).size <= 2
      @redis.rpush 'currencies', currencies.timestamp.to_s
      @redis.rpush 'currencies', currencies.ratio_currencies
    else
      2.times { @redis.lpop 'currencies' }
      @redis.rpush 'currencies', currencies.timestamp.to_s
      @redis.rpush 'currencies', currencies.ratio_currencies
    end
  end
end