class Stock < ActiveRecord::Base
  belongs_to :business

  def quote
  	get_last_price
  end
  
  def get_last_price
    @response = Net::HTTP.get_response("finance.google.com","/finance?q=" + self.symbol + "&output=json")
    @response.body.slice!(0, 4)
    @response = ActiveSupport::JSON.decode(@response.body)
    return @response[0]['l'].to_f
  end
  
end
