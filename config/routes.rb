Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  get 'home/index'
  root "home#index"   # トップページ

  resources :users, only: [:new, :create, :show]  # 登録 & マイページ
  resources :sessions, only: [:new, :create, :destroy] # ログイン/ログアウト

  resources :tasks do
    collection do
      get :do_tasks     # やるタスク一覧
      get :dont_tasks   # やらないタスク一覧
    end
  end
end