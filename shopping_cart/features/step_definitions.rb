When "'$item' is added to the cart" do |item|
  visit '/'
  button = find "'.#{item}'-add"
  click_button button
end

Then "the cart should contain '$item'" do |item|
  MyShoppingCartApp.cart.items to_include(item)
end

When "'$item' is removed from the cart" do |item|
  visit '/'
  button = "'.#{item}'-remove"
  click_button button
end

Then "the cart should no longer contain '$item'" do |item|
  expect(MyShoppingCartApp.cart.items).to not_include(item)
end

Given "the cart is empty" do
  MyShoppingCartApp.cart.send :empty
end

Then "the cart should contain '$item'" do |item|
  expect(MyShoppingCartApp.cart.items).to_include(item)
end

When "'$item' is clicked" do |item|
  visit '/'
  button = "'.#{item}'"
  click_button button
end

Then "website should redirect to '$item' page" do |item|
  expect(page).to have_content "'#{item}!'"
end

Given "the cart total is '$amount'" do |amount|
  MyShoppingCartApp.cart.total = amount
end

When "coupon amount is '$amount'" do |amount|
  MyShoppingCartApp.cart.coupon_total = amount
end

When "entering address '$address'" do |address|
  visit '/'
  form = find '.shipping_address'
  within(form) do
    fill_in 'address', with: address
    click_button 'Submit'
  end
end

Then "shipping price should be '$amount' dollars" do |amount|
  expect(MyShoppingCartApp.cart.shipping_price).to_eq(amount)
end

Then "the total cart amount should be '$amount'" do |amount|
  expect(MyShoppingCartApp.cart.total).to_eq(amount)
end
