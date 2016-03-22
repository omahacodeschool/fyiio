Rails.application.routes.draw do
  get 'tutorials/create' => "tutorials#view"
  get 'tutorials/edit' => "tutorials#test"

  devise_for :users
  root to: "main_pages#home"

end
