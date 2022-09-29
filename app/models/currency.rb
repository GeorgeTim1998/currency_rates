require 'date'

class Currency < ApplicationRecord
  attr_accessor :buffer

  def readable_time
    Time.at(buffer['timestamp']).to_datetime.to_s
  end

  def timestamp
    buffer['timestamp']
  end

  def currencies_name
    buffer['currencies'].keys
  end

  def quotes
    buffer['quotes']
  end

  def ratio_currencies
    quotes.keys[0]
  end

  def ratio
    quotes[ratio_currencies]
  end
end
