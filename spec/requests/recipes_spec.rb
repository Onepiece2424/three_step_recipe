require 'rails_helper'

RSpec.describe "recipeのテスト", type: :request do
  let!(:recipe) { create(:recipe, user: user) }
  let(:user) { create(:user) }
  # let(:image) { create(:image) }

  before do
    sign_in user
    get recipes_path
    # recipe.images << image
  end

  describe 'recipeメインページ' do
    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end

    it 'レスポンスにレシピ名が含まれること' do
      expect(response.body). to include recipe.title
    end

    # it 'レスポンスにレシピ画像が含まれること' do
    #   expect(response.body). to include rails_blob_path(recipe.images.first.attachment)
    # end
  end
end
