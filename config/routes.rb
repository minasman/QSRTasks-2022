Rails.application.routes.draw do
  root 'public#home'
  get 'public/about'
  get 'public/careers'
  resources :organizaitons

end
