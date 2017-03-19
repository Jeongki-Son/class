Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Rapidfire::Engine => "/rapidfire"
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home/index'
  get '/home/mypage/:id' => 'home#mypage'
  get '/likes' => 'likes#like_toggle'
  get '/home/mypoint/:id' => 'home#mypoint'
  get '/home/pointmaker'
  post '/home/pointcreate' => 'home#pointcreate'
  resources :assignments do
    resources :submissions do
      resources :comments
    end
  end
  resources :boards do
    resources :posts do
      resources :comments
    end
  end
  resources :attendances
  resources :attendancecounts
  root to: 'home#index'
end
