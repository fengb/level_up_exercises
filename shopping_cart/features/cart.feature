Feature: Cart items
  Scenario: An item can be added to cart
    Given the cart is empty
    When 'lamp' is added to the cart
    Then the cart should contain 'lamp'

  Scenario: An item can be removed from cart
    Given the cart is empty
    When 'lamp' is removed from the cart
    Then the cart should no longer contain 'lamp'
