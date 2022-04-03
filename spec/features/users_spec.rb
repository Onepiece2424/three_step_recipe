require 'rails_helper'

RSpec.feature 'ログインとログアウト', type: :feature do
  given(:user) { create(:user) }
  given!(:recipe) { create(:recipe, user: user) }
  given(:favorite_recipes) { create_list(:recipe, 4, user: user) }

  scenario 'ログインする' do
    visit new_user_session_path
    fill_in "user[email]", with: 'test@gmail.com'
    fill_in "user[password]", with: '12345678'
    click_button "Log in（ログイン）"
    visit recipes_path
    expect(page).to have_content "Signed in successfully."
  end

  feature 'メインページのテスト' do
    background do
      recipe.images = fixture_file_upload("spec/fixtures/test.png")
      sign_in user
      visit user_path(user.id)
    end

    scenario 'ユーザー情報が表示されること' do
      expect(page).to have_content user.username
      expect(page).to have_content user.email
      expect(page).to have_content user.recipes.count
    end

    scenario 'お気に入りしたレシピが4つ表示されること' do
      within('.name_follow') do
        expect(page).to have_selector 'p', count: 4
      end
    end
  end
end
