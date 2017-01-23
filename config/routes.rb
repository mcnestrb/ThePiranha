Rails.application.routes.draw do
	resources :articles
	devise_for :admins
	root 'articles#index'
end
