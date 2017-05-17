Rails.application.routes.draw do
	resources :articles, :issue_links
	resources :drafts, only: [:edit, :update, :destroy, :index]
	devise_for :admins, controllers: {
               sessions: 'admins/sessions',
               registrations: 'admins/registrations'
  }
	get '/admin' => 'admins#home'
	get '/admin/manage' => 'admins#manage'
	root 'articles#index'
end
