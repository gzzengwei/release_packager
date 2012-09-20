ReleasePackager::Application.routes.draw do
  authenticated :user do
    root :to => 'releases#index'
  end
  root :to => "releases#index"

  devise_for :users
  resources :users, :only => [:show, :index]

  resources :releases do
	member do
	  get 'generate'
	end  	
  end

  resources :system_configs
  
end
