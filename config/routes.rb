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
            post :comment
          end
          resources :quizes, shallow: true
        end
      end
    end
  end

  resources :users, only: [:update] do
    member do
      get :profile
      get :dashboard
    end
  end

get "/home/contact" => "home#contact"

  get "/quizes", to: "quizes#index"
  #
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  get :select_box, to: "home#select_box"
  get :set_card_info, to: "home#set_card_info"
  get :contact, to: "home#contact"
  
  root to: "categories#index"
end
