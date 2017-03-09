Rails.application.routes.draw do
  root :to=> 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ajax_download',to: "homes#ajax_download"
end
