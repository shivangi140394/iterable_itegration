Rails.application.routes.draw do
  devise_for :users
  get 'events/create_event_a'
  get 'events/create_event_b'
  root 'events#index'
end
