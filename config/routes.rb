Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]


  ### Controller Namespaces and Routing
  ## url: /admin/... --> folder: controller/admin/...
  # namespace :admin do
  #   resources :comments
  # end
  ## without /admin/
  # scope module: 'admin' do
  #   resources :articles, :comments
  # end
  ## or
  # resources :articles, module: 'admin'
  ## if you wanna route /admin/articles to ArticlesController (without the Admin::)
  # scope '/admin' do
  #   resources :articles, :comments
  # end
  ## or
  # resources :articles, path: '/admin/articles'

  # resources :photos do
  #   member do
  #     get 'search'
  #   end
  # end

  # resources :photos do
  #   collection do
  #     get 'search'
  #   end
  # end

end
