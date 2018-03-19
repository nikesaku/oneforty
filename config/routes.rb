Rails.application.routes.draw do

  root to: 'notes#index'
  resources :notes do
    collection do
      post :confirm
    end
  end
end
