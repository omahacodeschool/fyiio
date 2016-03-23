Rails.application.routes.draw do
  get 'main/about' => "main#about"
  get 'main/home' => "main#home"
  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create_confirmation'=> "tutorials#create_confirmation"



  devise_for :users
  root to: "main#home"

end
