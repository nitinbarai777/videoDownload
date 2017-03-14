Rails.application.routes.draw do
  root :to=> 'homes#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/' => 'homes#dashboard', :via => [:get, :post]
end
