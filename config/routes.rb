Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  get "comments-leaderboard", to: "pages#comment_leaderboard", as: :leaderboard

  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    resources :comments, only: %i[create destroy]
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
end
