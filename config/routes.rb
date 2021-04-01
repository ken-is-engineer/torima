Rails.application.routes.draw do
  root to: 'flags#index'
  devise_for :users
  resources :flags do
    resources :chats
  end

  resources :statuses

  resources :users do
      get "date_show"
  end
  resources :lists
end
