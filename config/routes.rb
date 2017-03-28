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

    member do
      get :message_board
    end

    resources :messages, shallow:true, only: [:index, :show, :new, :create] do
    end
  end

  resources :users, only: [:update] do
    member do
      get :profile
    end
  end

  namespace :dashboard do
    get :index
    get :forum
    get :videos

    get :asset_libraries
    post :upload_file
    delete :destroy_file
  end
  # resources :asset_libraries, only: [:index, :create, :delete]
  #
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  get "/home/contact" => "home#contact"
  get "/quizes", to: "quizes#index"
  get :select_box, to: "home#select_box"
  get :set_card_info, to: "home#set_card_info"
  
  get :contact, to: "home#contact"
  get :about_us, to: "home#about_us"
  get :disclaimer, to: "home#disclaimer"

  post "/home/hook" => "home#hook"
  root to: "categories#index"
end
