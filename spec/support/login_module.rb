module LoginModule
  def login(*)
    visit new_user_session_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in（ログイン）'
  end
end
