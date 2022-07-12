Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/doctors', to: 'doctors#index'
  get '/doctors/:id', to: 'doctors#show'

  get '/hospitals', to: 'hospitals#index'
  get '/hospitals/new', to: 'hospitals#new'
  get '/hospitals/:id', to: 'hospitals#show'
  post '/hospitals', to: 'hospitals#create'

  get '/hospitals/:hospital_id/doctors', to: 'hospital_doctors#index'
  # get '/hospitals/:hospital_id/doctors', to: 'hospital_doctors#show'

end
