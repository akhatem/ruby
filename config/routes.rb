Rails.application.routes.draw do
  get 'tabs/about'

  get 'tabs/edit'

  get 'categories/index'

  get 'categories/show'

  get 'posts/index'

  get 'posts/show'

  get 'home/index'

  resources :posts, :categories

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
