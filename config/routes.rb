Rails.application.routes.draw do
	resources :articles, :issue_links
	post '/articles/:id' => 'articles#feature', :as => :feature_article
	resources :drafts, only: [:edit, :update, :destroy, :index]
	devise_for :editors, :skip => [:registrations]
	as :editor do
	  get 'editor/edit' => 'devise/registrations#edit', :as => 'edit_editor_registration'
	  put 'editor' => 'devise/registrations#update', :as => 'editor_registration'
	end
	devise_for :admins, :skip => [:registrations]
	as :admin do
	  get 'admin/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
	  put 'admin' => 'devise/registrations#update', :as => 'admin_registration'
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
