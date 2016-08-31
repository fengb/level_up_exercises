When "first boot up" do
  # Do nothing!
end

Then "the activation code should be '$code'" do |code|
  expect(MyBombApp.reconfigure(code, code).activation_code).to eq(code)
end

Then "the deactivation code should be '$code'" do |code|
  expect(MyBombApp.reconfigure(code, code).deactivation_code).to eq(code)
end

Then "the status should be '$status'" do |expected_status|
  visit '/'
  expect(page).to have_content "Bomb status: #{expected_status}"
end

When "activating with '$code'" do |code|
  visit '/'
  form = find '.activation_form'
  within(form) do
    fill_in 'activation_code', with: code
    click_button 'Activate'
  end
end

When "deactivating with '$code'" do |code|
  visit '/'
  form = find '.deactivation_form'
  within(form) do
    fill_in 'deactivation_code', with: code
    click_button 'Deactivate'
  end
end

When "changing the activation code to '$code'" do |code|
  visit '/'
  form = find '.configuration'
  within(form) do
    fill_in 'activation_config', with: code
    click_button 'Boot Up!'
  end
end

When "changing the deactivation code to '$code'" do |code|
  visit '/'
  form = find '.configuration'
  within(form) do
    fill_in 'deactivation_config', with: code
    click_button 'Boot Up!'
  end
end

Given(/^the bomb is 'active'$/) do
  MyBombApp.bomb.send :activate
end

Given(/^the bomb is 'inactive'$/) do
  MyBombApp.bomb.send :deactivate
end
