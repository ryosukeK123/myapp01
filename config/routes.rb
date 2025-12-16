Rails.application.routes.draw do
  root "home#index"   # トップページ

  resources :users, only: [:new, :create, :show]   # ユーザー登録 & マイページ
  resource  :session, only: [:new, :create, :destroy] # ログイン/ログアウト（単数形が適切）

  resources :tasks do
    collection do
      get :do_tasks
      get :dont_tasks
      get :continuous_tasks
    end
  end
end
