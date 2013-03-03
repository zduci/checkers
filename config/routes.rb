Checkers::Application.routes.draw do
  resources :items, :only => [:index, :show], :path => ''
  resources :item_orders, :only => [:create]
end
