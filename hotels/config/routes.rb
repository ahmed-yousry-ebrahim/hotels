Rails.application.routes.draw do
  resources :hotels do
    collection do
      get 'search'
    end
  end

  root 'hotels#index'
end
