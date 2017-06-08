Rails.application.routes.draw do
	resources :articles, :issue_links
	post '/articles/:id' => 'articles#feature', :as => :feature_article
	resources :drafts, only: [:edit, :update, :destroy, :index]
	devise_for :editors
	devise_for :admins, skip: :registrations
	devise_scope :admin do
	  resource :registration,
	    only: [:new, :create, :edit, :update],
	    path: 'admin',
	    path_names: { new: 'sign_up' },
	    controller: 'devise/registrations',
	    as: :admin_registration do
	      get :cancel
	    end
	end
	match 'admin/:id' => 'admins#destroy', :via => :delete, :as => :admin_destroy_editor
	get '/admin' => 'admins#home'
	get '/admin/manage' => 'admins#manage'
	put '/admin/manage/:id' => 'admins#verify', :method => :put, :as => :verify_editor
	get '/editor' => 'editors#home'
	root 'articles#index'
	get '/search' => 'search#search'
	get '/contacts' => 'contacts#new'
	resources "contacts", only: [:new, :create]
	get '/about' => 'home#about'
end
