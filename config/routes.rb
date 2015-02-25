Wall::Application.routes.draw do
  root to:'frases#index'
  resources :frases
end
