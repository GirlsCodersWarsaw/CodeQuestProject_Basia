Rails.application.routes.draw do

	devise_for :users, :controllers => {:registrations => "registrations"}
	resources :users, only: [:index, :destroy]

	root 'welcome#index'

	resources :invitations, only: [:new, :create, :destroy, :update]

	resources :projects do
		member do
			get :invite
			post :invite
		end
	end

end
