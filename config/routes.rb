Rails.application.routes.draw do
	resources :articles, :issue_links
	resources :drafts, only: [:edit, :update, :destroy, :index]
	devise_for :admins
	match 'admin/:id' => 'admins#destroy', :via => :delete, :as => :admin_destroy_user
	get '/admin' => 'admins#home'
	get '/admin/manage' => 'admins#manage'
	put '/admin/manage/:id' => 'admins#verify', :method => :put, :as => :verify_admin
	root 'articles#index'
end
