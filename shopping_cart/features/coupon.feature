Feature: Coupon use
Scenario: Coupon can be applied to purchase
  Given the cart total is '10'
  When coupon amount '4' is applied
  Then the total cart amount should be '6'

