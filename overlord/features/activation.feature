Feature: Bomb activation
  Scenario: Bomb should be inactive upon boot
    When first boot up
    Then the state should be 'inactive'

  Scenario: Bomb activates when using the correct value
    When activating with '1234'
    Then the state should be 'active'

  Scenario: Bomb errors on bad values
    When activating with '0000'
    Then the state should be 'inactive'
     And the bomb should display 'message'

  Scenario: Bomb errors on non-numeric values
    When activating with 'abcd'
    Then the state should be 'inactive'
     And the bomb should display 'different message'
