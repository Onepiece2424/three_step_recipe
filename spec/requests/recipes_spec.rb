require 'rails_helper'

RSpec.describe "recipeのテスト", type: :request do
  let!(:recipe) { create(:recipe, user: user) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'トップページ' do
    before do
      get root_path
    end

    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end
  end

  describe 'メインページ' do
    before do
      get recipes_path
      recipe.images = fixture_file_upload("spec/fixtures/test.png")
    end

    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end

    it 'レスポンスにレシピカード情報が含まれること' do
      expect(response.body).to include recipe.title
      expect(response.body).to include recipe.user.username
      expect(response.body).to include recipe_path(recipe.id)
      expect(response.body).to include edit_recipe_path(recipe.id)
    end
  end

  describe 'レシピ投稿ページ' do
    before do
      get new_recipe_path
    end

    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end
  end

  describe 'レシピ詳細ページ' do
    before do
      get recipe_path(recipe.id)
    end

    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end
  end

  describe 'レシピ詳細ページ' do
    before do
      get edit_recipe_path(recipe.id)
    end

    it 'レスポンスが返ってくること' do
      expect(response.status).to eq(200)
    end
  end
end
