require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    context '名前とメールがあるとき' do
      it '有効であること' do
        user = User.new(
          name: '太郎',
          email: 'taro@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user).to be_valid
      end
    end

    context '名前がないとき' do
      it '無効であること' do
        user = User.new(
          name: nil,
          email: 'taro@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
         expect(user.valid?).to be false
      end
    end

    context 'メールが重複しているとき' do
      it '無効であること' do
        User.create!(
          name: '太郎',
          email: 'taro@example.com',
          password: 'password',
          password_confirmation: 'password'
        )

        user = User.new(
          name: '次郎',
          email: 'taro@example.com',
          password: 'password',
          password_confirmation: 'password'
        )

        expect(user).not_to be_valid
      end
    end
  end
end
