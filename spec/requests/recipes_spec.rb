require 'rails_helper'

RSpec.describe "recipeのテスト", type: :request do
  let!(:recipe) { create(:recipe, user: user) }
  let(:user) { create(:user) }

  before do
    sign_in user
    get recipes_path
    recipe.images = fixture_file_upload("spec/fixtures/test.png")
  end

  describe 'recipeメインページ' do
    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end

    it 'レスポンスにレシピ名が含まれること' do
      expect(response.body). to include recipe.title
    end
   
    it 'レスポンスにレシピ画像が含まれること' do
      recipe.images.each do |image|
        expect(response.body).to include rails_blob_path(image.first.attachment)
      end
    end
  end
end
