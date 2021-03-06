feature 'deleting users' do
  scenario 'there is a delete user button' do
    sign_up
    click_link 'Account'
    expect(page).to have_button 'Delete Account'
  end
  scenario 'pressing it deletes user and redirects to homepage' do
    sign_up
    click_link 'Account'
    click_button 'Delete Account'
    expect(current_path).to eq '/'
  end
end
