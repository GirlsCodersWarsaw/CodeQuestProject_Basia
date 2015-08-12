Rails.application.routes.draw do

	devise_for :users, :controllers => {:registrations => "registrations"}
	resources :users, only: [:index, :destroy]

	root 'welcome#index'

	resources :invitations, only: [:new, :create, :destroy, :update] do
    member do
      get :confirm_invitation
    end
  end

	resources :projects do
		resources :memberships, only: :create
		# member do
		# 	get :invite
		# 	post :invite
		# end
  end

  # resources :memberships, only: :create

end
