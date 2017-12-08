Rails.application.routes.draw do
  get 'login', to: 'usuarios#login', as: 'login'
  post 'usuarios/authenticate', to: 'usuarios#authenticate', as: 'usuario_authenticate'
  delete 'logout', to: 'usuarios#logout', as: 'logout'

  namespace :admin do
    get 'dashboard/index'
    resources :monitoristas
  end

  root 'home#index'
end
