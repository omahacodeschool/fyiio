Rails.application.routes.draw do
  get '/about' => "main#about"
  get '/sign_in' => "main#sign_in"
  get '/sign_up' => "main#sign_up"
  get '/' => "main#home"
  get '/discover' => "main#discover"
  
  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create/confirmation'=> "tutorials#create_confirmation"

  get 'tutorials/:tutorial_id/chapters/create' => "chapters#create"
  post 'tutorials/:tutorial_id/chapters/create/confirmation'=> "chapters#create_confirmation"

  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "main#home"
end