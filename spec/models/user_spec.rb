require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    context '名前とメールがあるとき' do
      it '有効であること' do
        user = User.new(name: '太郎', email: 'taro@example.com')
        expect(user).to be_valid
      end
    end
  end
end
