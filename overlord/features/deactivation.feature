Feature: Bomb deactivation
  Scenario: Deactivate with real code
    Given the bomb is 'active'
     When deactivating with '0000'
     Then the status should be 'inactive'

  Scenario: Bomb errors on bad value
    Given the bomb is 'active'
    When deactivating with '9999'
    Then the status should be 'active'

  Scenario: Bomb explodes on bad value submitted thrice
    Given the bomb is 'active'
    When deactivating with '9999'
    When deactivating with '9999'
    When deactivating with '9999'
    Then the status should be 'exploded'
