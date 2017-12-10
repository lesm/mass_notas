Rails.application.routes.draw do
  get 'login', to: 'usuarios#login', as: 'login'
  post 'usuarios/authenticate', to: 'usuarios#authenticate', as: 'usuario_authenticate'
  delete 'logout', to: 'usuarios#logout', as: 'logout'

  get 'admin/index'
  namespace :admin do
    resources :monitoristas
  end

  root 'home#index'
end
