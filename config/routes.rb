Rails.application.routes.draw do
  root 'users#new'
  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      put "profile" => "users#profile"
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
