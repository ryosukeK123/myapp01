Rails.application.routes.draw do
  root "tasks#index"   # トップページ
  # Devise のルートを追加
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  # もし独自の users コントローラを残したいならここに追加
  resources :users, only: [:show]
  resources :tasks do
    collection do
      get :do_tasks
      get :dont_tasks
      get :continuous_tasks
    end
  end
end