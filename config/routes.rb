Goalsnap::Application.routes.draw do
  resources :tallies, :except => [ :edit, :delete, :index ]

  resources :goal_rewards

  resources :rewards

  resources :goals
end
