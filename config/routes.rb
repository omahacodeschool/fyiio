Rails.application.routes.draw do
  get '/about' => "main#about"
  get '/sign_in' => "main#sign_in"
  get 'main/sign_up' => "main#sign_up"
  get '/' => "main#home"

  get '/search' => 'searches#index'
  get '/discover' => "main#discover"
  get '/tutorial' => "tutorials#view"

  get 'companyInvites/authentication' => "company_invites#company_authentication"
  get 'companyInvites/verification' => "company_invites#company_verification"
  get'companyInvites/verification/:auth_code' => "company_invites#company_verification_confirmation"

  get 'companies/create' => "companies#create"
  post 'companies/create/confirmation'=> "companies#create_confirmation"

  get '/:username/dashboard' => "dashboard#view_dashboard", as: :dashboard
  get  '/:username/dashboard/invite' => "dashboard#invite_additional_users"
  post '/:username/dashboard/invite/confirmation' => "dashboard#invite_additional_users_confirmation"
  get  '/companies/update' => "companies#update_company", as: :update_company
  patch '/companies/update/confirmation' => "companies#update_company_confirmation", as: :update_company_confirmation
  get  '/companies/update/image' => "companies#update_company_image", as: :update_company_image
  patch '/companies/update/image/confirmation' => "companies#update_company_image_confirmation", as: :update_company_image_confirmation

  get 'tutorials/create' => "tutorials#create"
  post 'tutorials/create/confirmation'=> "tutorials#create_confirmation"

  get 'tutorials/:tutorial_id/edit' => "tutorials#edit"
  patch 'tutorials/:tutorial_id/update/confirmation' => "tutorials#update_confirmation"


  get 'tutorials/:tutorial_id' => "tutorials#view"


  get 'tutorials/:tutorial_id/chapters/create' => "chapters#create"
  post 'tutorials/:tutorial_id/chapters/create/confirmation'=> "chapters#create_confirmation"
  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/create' => "steps#create"
  post 'tutorials/:tutorial_id/chapters/:chapter_id/steps/create/confirmation'=> "steps#create_confirmation"
  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id' => "steps#view"


  get 'tutorials/:tutorial_id/chapters/:chapter_id/edit' => "chapters#edit"
  patch 'tutorials/:tutorial_id/chapters/:chapter_id/update/confirmation' => "chapters#update_confirmation"

  get 'tutorials/:tutorial_id/chapters/:chapter_id' => "chapters#view"

  delete 'tutorials/:tutorial_id/chapters/:chapter_id/delete' => "chapters#delete", as: :delete_chapter

  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id' => "steps#view"

  delete 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id' => "steps#delete", as: :delete_step

  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id/edit' => "steps#edit"
  patch 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id/update/confirmation' => "steps#update_confirmation"

  delete 'tutorials/:tutorial_id/delete' => "tutorials#delete", as: :delete_tutorial
  devise_for :users
  root to: "main#home"
end
