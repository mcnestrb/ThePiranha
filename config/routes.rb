Rails.application.routes.draw do
	namespace :admin do
		resources :articles, except: [:index, :show]
		devise_for :admins
	end
	resources :articles, only: [:index, :show]
	root 'articles#index'
end
