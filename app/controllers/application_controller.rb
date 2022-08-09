class ApplicationController < ActionController::Base
  def process_cart
    session[:cart] ||= Hash.new
    session[:cart].default = 0
    session[:cart].transform_keys!(&:to_i)
    session[:cart].reject! { |key, value| value.zero?  }
    session[:cart_price] = session[:cart_price]&.to_f&.round(2) || 0.0
  end
end
