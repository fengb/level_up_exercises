When "first boot up" do
  # Do nothing!
end

Then "the status should be '$status'" do |expected_status|
  visit '/'
  expect(page).to have_content "Bomb status: #{expected_status}"
end

When "activating with '$code'" do |code|
  visit '/'
  form = find '.activation_form'
  within (form) do
    fill_in 'activation_code' , with: code
    click_button 'Activate'
  end
end

When "deactivating with '$code'" do |code|
  visit '/'
  form = find '.deactivation_form'
  within (form) do
    fill_in 'deactivation_code' , with: code
    click_button 'Deactivate'
  end
end

Given(/^the bomb is 'active'$/) do
  MyBombApp.bomb.send :activate
end
