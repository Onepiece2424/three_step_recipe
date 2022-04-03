require 'rails_helper'

RSpec.feature 'ログインとログアウト', type: :feature do
  given(:user) { create(:user) }
  given!(:recipe) { create(:recipe, user: user) }

  scenario 'ログインする' do
    visit new_user_session_path
    fill_in "user[email]", with: 'test@gmail.com'
    fill_in "user[password]", with: '12345678'
    click_button "Log in（ログイン）"
    visit recipes_path
    expect(page).to have_content "Signed in successfully."
  end
end
