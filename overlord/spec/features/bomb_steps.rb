Given(/^I am on the homepage$/) do
  visit :new
end

Then(/^I should see a box to enter an activation code/) do
  expect(page).to have_content("Activation code")
end

Then(/^I should see a box to enter a  deactivation code/) do
  expect(page).to have_content("Deactivation code")
end

Then(/^I should expect to see the state of the bomb/) do
  expect(page).to have_content("Bomb status:inactive")
end
