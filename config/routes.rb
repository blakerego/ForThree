ForThree::Application.routes.draw do

  resources :weeks
  resources :weekly_stats
  resources :teams
  resources :yahoo_receiver, :only => 'index'
  match 'matchup' => 'static#headToHead'
  
  match ':action' => 'static#:action'
  root :to => 'weeks#index'
end
