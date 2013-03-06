Checkers::Application.routes.draw do
  root :to => redirect('/menu')
  resources :items, :only => [:index, :show], :path => '/menu'
  resources :item_orders, :only => [:create]
  resource :order, :only => [:create]
  get '/track' => 'track_order#track', :as => 'tracker'
end
