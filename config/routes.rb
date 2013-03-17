Checkers::Application.routes.draw do
  devise_for :admins

  root :to => redirect('/menu')
  resources :items, :only => [:index, :show], :path => '/menu'
  resources :item_orders, :only => [:create]
  resources :orders, :only => [:create, :index, :show, :update]
  get '/track/:session_id' => 'track_order#track', :as => 'tracker'
  get '/track/status/:session_id' => 'track_order#status'
end
