Checkers::Application.routes.draw do
  resources :items, :only => [:index, :show], :path => ''
end
