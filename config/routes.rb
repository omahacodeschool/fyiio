Rails.application.routes.draw do
  devise_for :users
  root to: "main_pages#home"
end

Rails.application.routes.draw do
  get "main/home" => 'home#home'
end