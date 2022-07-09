Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hospitals', to: 'hospitals#index'
  get '/hospitals/:id', to: 'hospitals#show'
  get '/hospitals/:id/doctors', to: 'hospital_doctors#index'
  get '/doctors', to: 'doctors#index'
  get '/doctors/:id', to: 'doctors#show'
 
end
