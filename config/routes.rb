Rails.application.routes.draw do
	resources :articles
	devise_for :admins
	get '/admin' => 'admins#home'
	root 'articles#index'
end
