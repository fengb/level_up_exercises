Feature: Coupon use
Scenario: Coupon can be applied to purchase
  Given the cart total is '10'
  When coupon amount is '4'
  Then the total cart amount should be '6'

