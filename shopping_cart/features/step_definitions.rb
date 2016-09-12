When "'$item' is added to the cart" do |item|
  visit '/'
  button = find "'.#{item}'-add"
  click_button button
end

Then "the cart should contain '$item'" do |item|
  expect(MyShoppingCartApp.cart.items).to include(item)
end

When "'$item' is removed from the cart" do |item|
  visit '/'
  button = "'.#{item}'-remove"
  click_button button
end

Then "the cart should no longer contain '$item'" do |item|
  expect(MyShoppingCartApp.cart.items).to_not include(item)
end

Given "the cart is empty" do
  MyShoppingCartApp.cart.send :empty!
end

Then "the cart should contain '$item'" do |item|
  expect(MyShoppingCartApp.cart.items).to include(item)
end

When "'$item' is clicked" do |item|
  visit '/'
  button = "'.#{item}'"
  click_button button
end

Then "website should redirect to '$item' page" do |item|
  expect(page).to have_content "Welcome to '#{item}''s page!"
end

Given "the cart total is '$amount'" do |amount|
  MyShoppingCartApp.cart.total = amount
end

When "coupon amount '$amount' is applied" do |amount|
  MyShoppingCartApp.cart.coupon_total = amount
end

When "entering address '$address'" do |address|
  visit '/'
  within('.shipping_address') do
    fill_in 'address', with: address
    click_button 'Submit'
  end
end

When "entering nil address" do
  visit '/'
  within('.shipping_address') do
    click_button 'Submit'
  end
end

Then "shipping price should be '$status'" do |status|
  expect(MyShoppingCartApp.cart.shipping_price).to_be(status)
end

Then "the total cart amount should be '$amount'" do |amount|
  expect(MyShoppingCartApp.cart.total).to_eq(amount)
end

Given "the cart has one '$item'" do |item|
  MyShoppingCartApp.cart.item_amounts = { item => 1 }
end
