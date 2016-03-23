Rails.application.routes.draw do
  get "signup" => 'users#add'
  devise_for :users
  root to: "main_pages#home"

end
