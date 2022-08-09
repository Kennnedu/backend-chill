Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :pizza_types do
    member do
      patch :increment
      patch :decrement
    end

    delete :clear, on: :collection
  end

  root 'orders#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
