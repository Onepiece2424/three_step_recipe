require 'rails_helper'

RSpec.feature 'recipeページのテスト' do
  given(:recipe) { create(:recipe, user: user) }
  given(:user) { create(:user) }
  given(:image) { create(:image) }

  background do
    recipe.images = fixture_file_upload("spec/fixtures/test.png")
    visit recipes_path
  end

  feature 'メインページのテスト' do
    scenario '商品画像が表示されること' do
      recipe.images.each do |image|
        expect(page).to have_selector("img,[src$='#{image.filename}']")
      end
    end
  end
end
