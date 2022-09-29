require 'date'

class Currency < ApplicationRecord
  attr_accessor :buffer

  def readable_time
    Time.at(self.buffer['timestamp']).to_datetime.to_s
  end
end
