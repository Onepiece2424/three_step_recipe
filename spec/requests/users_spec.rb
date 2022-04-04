require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }

  describe 'ユーザー登録' do
    it "username、email、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(user).to be_valid
    end
  end
end
