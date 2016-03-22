Rails.application.routes.draw do
  devise_for :users
  root to: "main_pages#home"

  get "signup" => 'users#add'
end
