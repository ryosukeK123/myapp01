class Users::SessionsController < Devise::SessionsController
  layout 'application'   # ← これを追加
end