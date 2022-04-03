require 'rails_helper'

RSpec.feature 'recipeページのテスト' do
  given(:recipe) { create(:recipe, user: user) }
  given(:user) { create(:user) }

  background do
    recipe.images = fixture_file_upload("spec/fixtures/test.png")
    sign_in user
    visit recipes_path
  end

  feature 'メインページのテスト' do
    scenario '商品画像が表示されること' do
      expect(page).to have_selector "img,[src$='#{recipe.images}.png']"
    end
  end
end
