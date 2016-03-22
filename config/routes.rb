Rails.application.routes.draw do
  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create_confirmation'=> "tutorials#create_confirmation"


  devise_for :users
  root to: "main_pages#home"

end
