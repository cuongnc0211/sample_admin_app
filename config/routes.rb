Rails.application.routes.draw do
  devise_for(
    :admins,
    controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions',
    }
  )

  get 'theme/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "theme#index"
end
