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
            delete :remove_comment
          end
          resources :quizes, shallow: true
        end
      end
    end

    member do
      get :message_board
    end

    resources :messages, shallow:true, only: [:index, :show, :new, :create, :destroy] do
    end

    collection do
      post :quiz_questions
    end
  end

  resources :users, only: [:update] do
    member do
      get :profile
      post :upload_image
    end
  end

  namespace :dashboard do
    get :index
    get :forum
    get :videos

    get :asset_libraries
    post :upload_file
    delete :destroy_file

    get :permission
    post :update_permission

    get :groups
    get :quizzes
    get :questions
  end
  # resources :asset_libraries, only: [:index, :create, :delete]
  #
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  resources :assignments, only: [:index, :new, :create] do
    collection do
      post :create_group_assignment
      get :select_content
    end 
  end

  namespace :hr_manager, path: '' do
    resources :groups, only: [:new, :create, :show, :destroy] do
      resources :group_employees, only: [:create, :destroy]
    end
    resources :quizzes, only: [:new , :create, :show, :destroy] do
      collection do
        get :assign_questions
        get :add_questions
      end
    end
    resources :questions, only: [:new , :create, :destroy]
  end

  namespace :employee, path: '' do
     resources :take_quiz, only: [:take_a_quiz] do
      collection do
        get 'take_a_quiz' 
      end
    end
  end


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
