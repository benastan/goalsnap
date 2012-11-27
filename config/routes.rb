Goalsnap::Application.routes.draw do
  resources :tallies, :except => [ :edit, :delete, :index ]

  resources :rewards, :only => [ :index, :create ]

  resources :goals, :only => [ :index, :create ]

  resources :users do
    resources :goal_rewards
    resources :tallies
  end

  resources :goal_rewards

  get 'login' => 'sessions#new', :as => :login
  post 'login' => 'sessions#create', :as => :login
  get 'logout' => 'sessions#delete', :as => :logout

  match '/' => 'users#show', :as => :root
end
