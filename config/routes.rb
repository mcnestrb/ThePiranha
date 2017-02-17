Rails.application.routes.draw do
	resources :articles, :issue_links
	resources :drafts, only: [:edit, :update, :destroy, :index]
	devise_for :admins
	get '/admin' => 'admins#home'
	root 'articles#index'
end
