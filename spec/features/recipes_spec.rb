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
    scenario 'レシピ画像が表示されること' do
      expect(page).to have_selector "img,[src$='#{recipe.images}.png']"
    end

    scenario 'レシピ名が表示されること' do
      expect(page).to have_content recipe.title
    end

    scenario 'have_linkを用いたレシピ詳細リンクが表示されること' do
      expect(page).to have_link "3 step recipes"
    end
  end
end
