Goalsnap::Application.routes.draw do
  resources :tallies, :except => [ :edit, :delete, :index ]

  resources :rewards, :only => [ :index, :create, :show ], :constraints => { :format => /json/ }

  resources :goals, :only => [ :index, :create, :show ], :constraints => { :format => /json/ }

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
