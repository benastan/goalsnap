Goalsnap::Application.routes.draw do
  resources :tallies, :except => [ :edit, :delete, :index ]

  resources :rewards

  resources :goals

  resources :users do
    resources :goal_rewards
    resources :tallies
  end

  resources :goal_rewards

  get 'login' => 'sessions#new', :as => :login
  post 'login' => 'sessions#create', :as => :login
  get 'logout' => 'sessions#delete', :as => :logout

  match '/' => 'goal_rewards#index', :as => :root
end
