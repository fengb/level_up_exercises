Feature: Bomb activation
  Scenario: Bomb should be inactive upon boot
    When first boot up
    Then the status should be 'inactive'

  Scenario: Activation code should be configurable
    Given the bomb is 'inactive'
    When changing the activation code to '3245'
    Then the activation code should be '3245'

  Scenario: Bomb activates when using the correct value
    When activating with '1234'
    Then the status should be 'active'

  Scenario: Bomb errors on bad values
    When activating with '0000'
    Then the status should be 'inactive'

  Scenario: Bomb stays activated when code is resubmitted
    When activating with '1234'
    When activating with '1234'
    Then the status should be 'active'
