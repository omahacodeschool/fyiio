Rails.application.routes.draw do
  get '/about' => "main#about"
  get '/sign_in' => "main#sign_in"
  get 'main/sign_up' => "main#sign_up"
  get '/' => "main#home"

  get '/search' => 'searches#index'
  get '/discover' => "main#discover"

  get 'companies/create' => "companies#create"
  post 'companies/create/confirmation'=> "companies#create_confirmation"

  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create/confirmation'=> "tutorials#create_confirmation"

  get 'tutorials/:tutorial_id/chapters/create' => "chapters#create"
  post 'tutorials/:tutorial_id/chapters/create/confirmation'=> "chapters#create_confirmation"

  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/create' => "steps#create"
  post 'tutorials/:tutorial_id/chapters/:chapter_id/steps/create/confirmation'=> "steps#create_confirmation"

  get 'tutorials/:tutorial_id/edit' => "tutorials#edit"
  patch 'tutorials/:tutorial_id/update/confirmation' => "tutorials#update_confirmation"

  get 'tutorials/:tutorial_id/chapters/:chapter_id/edit' => "chapters#edit"
  patch 'tutorials/:tutorial_id/chapters/:chapter_id/update/confirmation' => "chapters#update_confirmation"

  devise_for :users
  root to: "main#home"
end