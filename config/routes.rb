Rails.application.routes.draw do
  get 'main/about' => "main#about"
  get 'main/sign_in' => "main#sign_in"
  get 'main/sign_up' => "main#sign_up"
  get 'main/home' => "main#home"
  get 'main/discover' => "main#discover"
  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create_confirmation'=> "tutorials#create_confirmation"
  devise_for :users
  root to: "main#home"
end