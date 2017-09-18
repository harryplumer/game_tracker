Rails.application.routes.draw do
  namespace :api do
    resources :teams, except: [:new, :edit] do
      resources :players, except: [:new, :edit]
    end
    resources :games, except: [:new, :edit]
  end
end
