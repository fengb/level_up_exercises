Feature: Overlord output
  Scenario: Website should show that the bomb is active
    Given the bomb is 'active'
    Then the website should display 'Bomb status: active'

  Scenario: Website should show that the bomb is inactive
    Given the bomb is 'inactive'
    Then the website should display 'Bomb status: inactive'

  Scenario: Website should show that the bomb is exploded
    Given the bomb is 'exploded'
    Then the website should display 'Bomb status: exploded'

