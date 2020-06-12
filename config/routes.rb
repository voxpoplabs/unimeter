Rails.application.routes.draw do
	get "password_resets/new"
	get "password_resets/edit"
	get "sessions/new"
	get "users/new"
	get "/home", to: "main#home", constraints: {subdomain: false}
	get "/aboutpolimeter", to: "main#aboutpolimeter"
	get "/pricing", to: "main#pricing"
	get "/privacy", to: "main#privacy"
	get "/support", to: "main#support"
	get "/terms", to: "main#terms"
	get "/health_check", to: "health_checks#index"
	get "/banner", to: "main#banner"


	require "subdomain"

	constraints(Subdomain) do
		get "/" => "meters#show"
		get "/about" => "meters#about"
		get "/news" => "meters#news"
		get "/rules" => "meters#rules"
		get "/updates" => "meters#updates"
		get "/analytics" => "meters#analytics"

		get "/overview" => "meters#overview"
		get "/edit" => "meters#edit"

		get "/data" => "meters#data"

		#	Secondary Language Routes
		get "/b" => "meters#show"
		get "/b/promise/:id" => "promises#show", as: :bilingual_promise
		get "/b/rules" => "meters#rules"
		get "/b/about" => "meters#about"
	end

	#  Redirect the french promises from the legacy trudeaumetre app
	get "/promesse/:id" => redirect {|params, request| "/b/promise/#{params[:id]}" }
	get "/fr" => redirect {|params, request| "/b" }

	#  Session routes
	root to: "main#home"

	get :autocomplete, controller: :main
	get :search, controller: :main

	get "/signup", to: "users#new"
	post "/signup", to: "users#create"

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"

	get "/contact", to: "contacts#new"
	resources :contacts, only: [:new, :create]

	resources :users, only: [:new, :create, :edit, :update]
	resources :password_resets, only: [:new, :create, :edit, :update]


	resources :meters do
		post :assign_user
		resources :blogposts
	end

	get "/dashboard", to: "meters#dashboard", as: :dashboard
	get "meters/:id/view", to: "meters#view", as: :view

	resources :promises, :path => "promise" do
		resources :articles
		resources :logs
    end

	get "/404", to: "errors#not_found"
	get "/422", to: "errors#unacceptable"
	get "/500", to: "errors#internal_error"

	post "/stripe_hook", to: "stripe_hooks#hook"

	resources :subscriptions, only: [:index, :destroy]
	# post "/subscription/:id/unsubscribe", to: "subscriptions#unsubscribe"
end
