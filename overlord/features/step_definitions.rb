When "first boot up" do
  # Do nothing!
end

Then "the activation code should be '$code'" do |code|
  expect(MyBombApp.bomb.activation_code).to eq(code)
end

Then "the deactivation code should be '$code'" do |code|
  expect(MyBombApp.bomb.deactivation_code).to eq(code)
end

Then "the website should display '$string'" do |string|
  visit '/'
  expect(page).to have_content string.to_s
end

Then "the bomb state should be '$state'" do |expected_state|
  expect(MyBombApp.bomb.state.to_s).to eq(expected_state)
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
  MyBombApp.reset!
  MyBombApp.bomb.send :activate
end

Given(/^the bomb is 'inactive'$/) do
  MyBombApp.reset!
  MyBombApp.bomb.send :deactivate
end

Given(/^the bomb is 'exploded'$/) do
  MyBombApp.reset!
  MyBombApp.bomb.send :explode
end
