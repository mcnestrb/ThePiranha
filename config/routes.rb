Rails.application.routes.draw do
	namespace :admin do
		constraints subdomain: 'admin' do
			resources :articles, except: [:index, :show]
		end
	end
	resources :articles, only: [:index, :show]
	root 'articles#index'
end
