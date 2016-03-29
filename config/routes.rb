Rails.application.routes.draw do
 
  # main page routes
  get '/about' => "main#about", as: :about
  get '/' => "main#home", as: :main
  get '/discover' => "main#discover", as: :discover
  get '/search' => 'searches#index', as: :discover_searches
 
  # companies routes
  get 'companies/create' => "companies#create", as: :companies_create
  post 'companies/create/confirmation'=> "companies#create_confirmation", as: :companies_create_confirmation
  get  '/companies/edit' => "companies#edit_company", as: :edit_company
  patch '/companies/edit/confirmation' => "companies#edit_company_confirmation", as: :edit_company_confirmation
  get  '/companies/edit/image' => "companies#edit_company_image", as: :edit_company_image
  patch '/companies/edit/image/confirmation' => "companies#edit_company_image_confirmation", as: :edit_company_image_confirmation
  get 'companies/view/account/info' => "companies#view_company_info", as: :view_company_info
 
  # dashboard && company invites routes
  get '/:username/dashboard' => "dashboard#view_dashboard", as: :dashboard
  get  '/:username/dashboard/invite' => "dashboard#invite_additional_users", as: :invite_users
  post '/:username/dashboard/invite/confirmation' => "dashboard#invite_additional_users_confirmation" , as: :invite_users_confirmation
  get 'companyInvites/authentication' => "company_invites#company_authentication", as: :invite_authentiation
  get 'companyInvites/verification' => "company_invites#company_verification", as: :invite_verification
  get'companyInvites/verification/:auth_code' => "company_invites#company_verification_confirmation", as: :invite_verification_confirmation
  
  # tutorials routes
  get 'tutorials/create' => "tutorials#create", as: :tutorials_create
  post 'tutorials/create/confirmation'=> "tutorials#create_confirmation", as: :tutorials_create_confirmation
  get 'tutorials/:tutorial_id/edit' => "tutorials#edit", as: :tutorials_edit
  patch 'tutorials/:tutorial_id/edit/confirmation' => "tutorials#edit_confirmation", as: :tutorials_edit_confirmation
  get 'tutorials/:tutorial_id' => "tutorials#view", as: :tutorials
  delete 'tutorials/:tutorial_id/delete' => "tutorials#delete", as: :delete_tutorial
 
  # chapters routes
  get 'tutorials/:tutorial_id/chapters/create' => "chapters#create", as: :chapters_create
  post 'tutorials/:tutorial_id/chapters/create/confirmation' => "chapters#create_confirmation", as: :chapters_create_confirmation
  get 'tutorials/:tutorial_id/chapters/:chapter_id/edit' => "chapters#edit", as: :chapters_edit
  patch 'tutorials/:tutorial_id/chapters/:chapter_id/edit/confirmation' => "chapters#edit_confirmation", as: :chapters_edit_confirmation
  get 'tutorials/:tutorial_id/chapters/:chapter_id' => "chapters#view", as: :chapters
  delete 'tutorials/:tutorial_id/chapters/:chapter_id/delete' => "chapters#delete", as: :delete_chapter
  
  # steps routes
  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/create' => "steps#create", as: :steps_create
  post 'tutorials/:tutorial_id/chapters/:chapter_id/steps/create/confirmation' => "steps#create_confirmation", as: :steps_create_confirmation
  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id/edit' => "steps#edit", as: :steps_edit
  patch 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id/update/confirmation' => "steps#update_confirmation", as: :steps_edit_confirmation
  get 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id' => "steps#view", as: :steps
  delete 'tutorials/:tutorial_id/chapters/:chapter_id/steps/:step_id' => "steps#delete", as: :delete_step

  devise_for :users
  root to: "main#home"
end
