Checkers::Application.routes.draw do
  resources :items, :only => [:index, :show], :path => '/menu'
  resources :item_orders, :only => [:create]
  get '/track' => 'track_order#track', :as => 'tracker'
end
