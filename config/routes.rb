Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: "sessions",registrations: "registrations"}
  resources :resets, only: [:new, :edit, :create, :update]

  resources :categories do
    resources :topics, shallow: true do
      resources :seasons do
        resources :episodes, shallow: true do
          member do
            get :video_modal
          end
          resources :quizes, shallow: true
        end
      end
    end

  end

  get "/quizes", to: "quizes#index"
  #
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  root to: "categories#index"
end
