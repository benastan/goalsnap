Goalsnap::Application.routes.draw do
  resources :tallies, :except => [ :edit, :delete, :index ]

  resources :goal_rewards

  resources :rewards
  resources :users do
    resources :goal_rewards
  end

  resources :goals
  get 'login' => 'sessions#new', :as => :login
  post 'login' => 'sessions#create', :as => :login
  get 'logout' => 'sessions#delete', :as => :logout

  match '/' => 'users#show', :as => :root
end
