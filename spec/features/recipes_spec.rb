require 'rails_helper'

RSpec.feature 'recipeページのテスト' do
  given(:recipe) { create(:recipe, user: user) }
  given(:user) { create(:user) }

  feature 'トップページのテスト' do
    background do
      sign_in user
      visit root_path
    end

    scenario 'have_linkを用いたメインページリンクが表示されること' do
      expect(page).to have_link "3 step recipes"
    end
  end

  feature 'メインページのテスト' do
    background do
      recipe.images = fixture_file_upload("spec/fixtures/test.png")
      sign_in user
      visit recipes_path
    end

    scenario 'レシピ画像が表示されること' do
      expect(page).to have_selector "img,[src$='#{recipe.images}.png']"
    end

    scenario 'レシピ名が表示されること' do
      expect(page).to have_content recipe.title
    end

    scenario 'have_linkを用いたレシピ詳細リンクが表示されること' do
      expect(page).to have_link "3 step recipes"
    end

    scenario 'have_buttonを用いた新規レシピ作成リンクが表示されること' do
      expect(page).to have_button "Create a new recipe"
    end

    scenario 'Create a new recipeボタンをクリック後、レシピ作成ページへ移動されること' do
      click_button "Create a new recipe"
      expect(page).to have_current_path new_recipe_path
    end

    scenario 'レシピカード(id:all_recipes)をクリック後、レシピ詳細ページへ移動されること' do
      click_link 'all_recipes'
      expect(page).to have_current_path recipe_path(recipe.id)
    end

    scenario 'レシピカード(id:my_recipes)をクリック後、レシピ詳細ページへ移動されること' do
      click_link 'my_recipes'
      expect(page).to have_current_path recipe_path(recipe.id)
    end

    scenario '検索結果が表示されること' do
      fill_in 'q[title_cont]', with: recipe.title
      find("i.fa").click
      expect(page).to have_content recipe.title
      expect(page).to have_content recipe.user.username
      expect(page).to have_selector "img,[src$='#{recipe.images}.png']"
    end
  end

  feature '検索結果ページのテスト' do
    background do
      recipe.images = fixture_file_upload("spec/fixtures/test.png")
      sign_in user
      visit search_recipes_path
    end

    scenario 'レシピ検索結果から選択したレシピカード(All_recipes)へページ遷移できること' do
      click_link 'all_recipes'
      expect(page).to have_current_path recipe_path(recipe.id)
    end

    scenario 'レシピ検索結果から選択したレシピカード(My_recipes)へページ遷移できること' do
      click_link 'my_recipes'
      expect(page).to have_current_path recipe_path(recipe.id)
    end

    scenario 'レシピ検索結果からメインんページへ移動できること' do
      click_link 'トップページへ戻る'
      expect(page).to have_current_path recipes_path
    end
  end
end
