ForThree::Application.routes.draw do

  resources :weeks
  resources :weekly_stats
  resources :teams
  match ':action' => 'static#:action'
  root :to => 'weeks#index'
end
