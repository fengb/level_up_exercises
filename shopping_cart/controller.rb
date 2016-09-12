enable :sessions

class MyShoppingCartApp < Sinatra::Base
  class << self
    attr_reader :cart
  end

  def self.reset!
  end

  def cart
    @cart = sessions[:cart]
  end

  get '/' do
  end
end
