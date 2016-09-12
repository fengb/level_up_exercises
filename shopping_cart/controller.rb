enable :sessions

class MyShoppingCartApp < Sinatra::Base
  class << self
    attr_reader :cart
  end

  def self.reset!
  end

  get '/' do
  end
end
