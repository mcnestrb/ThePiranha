Rails.application.routes.draw do
	resources :articles, :issue_links
	post '/articles/:id' => 'articles#feature', :as => :feature_article
	resources :drafts, only: [:edit, :update, :destroy, :index]
	devise_for :admins, :editors
	match 'admin/:id' => 'admins#destroy', :via => :delete, :as => :admin_destroy_editor
	get '/admin' => 'admins#home'
	get '/admin/manage' => 'admins#manage'
	put '/admin/manage/:id' => 'admins#verify', :method => :put, :as => :verify_editor
	get '/editor' => 'editors#home'
	root 'articles#index'
	post '/search' => 'search#search'
	get '/search' => 'search#search'
end
