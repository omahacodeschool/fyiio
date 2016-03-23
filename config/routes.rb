Rails.application.routes.draw do
  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create/confirmation'=> "tutorials#create_confirmation"

  get 'tutorials/:tutorial_id/chapters/create' => "chapters#create"
  post 'tutorials/:tutorial_id/chapters/create/confirmation'=> "chapters#create_confirmation"

  devise_for :users
  root to: "main#home"

end
