Example::Application.routes.draw do

  root 'emails#new'

  resources :emails, :except => [:index, :edit, :update, :destroy]
end
