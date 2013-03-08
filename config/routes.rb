Checkers::Application.routes.draw do
  devise_for :admins

  root :to => redirect('/menu')
  resources :items, :only => [:index, :show], :path => '/menu'
  resources :item_orders, :only => [:create]
  resource :order, :only => [:create]
  get '/track/:session_id' => 'track_order#track', :as => 'tracker'
end
