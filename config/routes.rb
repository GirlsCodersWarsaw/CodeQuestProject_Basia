Rails.application.routes.draw do

	devise_for :users, :controllers => {:registrations => "registrations"}
	resources :users, only: [:index]
	root 'welcome#index'
	resources :invitations, only: [:new, :create, :destroy] do
    	member do
      		get :confirm_invitation
    	end
  	end

end
