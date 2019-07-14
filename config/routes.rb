Rails.application.routes.draw do
  resources :posts
  resources :history

  # devise_for :accounts
  # get 'login/index'
  # get 'login/login_check'
  # get 'category_config/index'
  # get 'postdata/index'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'home/index'
  # # post 'home/index'
  # post "home/index/", to: "home#create"
  # patch "home/index/", to: "home#create"
  # get 'home/history'
  # post 'home/history'
  # get "home/edit/:id", to: "home#edit"
  # patch "home/edit/:id", to: "home#update"
  # get "home/delete/:id", to: "home#delete"
  # get "category/index", to: 'category_config#index'
  # get "change_ctg", to: 'home#change_ctg'
  get "change_month", to: 'history#change_month'
  post "change_month", to: 'history#change_month'
  # post "change_month_chart", to: 'home#change_month_chart'
  # get "home/grid_input", to: "home#grid_input"
end
