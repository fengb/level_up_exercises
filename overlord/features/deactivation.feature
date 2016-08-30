Feature: Bomb deactivation
  Scenario: Deactivate with real code
    Given the bomb is 'active'
     When deactivating with '0000'
     Then the bomb should be 'inactive'
