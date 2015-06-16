Rails.application.routes.draw do
resources :nasfiles
  resources :offices
  resources :departments
  devise_for :admins
  devise_for :users , :skip => [:registrations]
  as :user do
    get 'user/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  devise_scope :user do
    resources :users , only: [:index, :new, :create, :show ,:delete,:destroy]
  end
  resources :categories , except: [:show]
  resources :trackers

  root 'nasfiles#index'
end
