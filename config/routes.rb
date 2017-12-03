Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    resources :monitoristas
  end

  root 'home#index'
end
