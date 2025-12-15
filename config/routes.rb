Rails.application.routes.draw do
  root "home#index"   # トップページ

  resources :users, only: [:new, :create, :show]   # ユーザー登録 & マイページ
  resource  :session, only: [:new, :create, :destroy] # ログイン/ログアウト（単数形が適切）

  resources :tasks do
    collection do
      get :do_tasks       # やるタスク一覧
      get :dont_tasks     # やらないタスク一覧
      get :continuous_tasks
    end
  end
end
