Feature: Shipping estimates
Scenario: Entering address should return shipping estimates
  When entering address '6051 South Drexel Avenue  Chicago IL 60637'
  Then shipping price should be 'defined'

Scenario: Entering no address should return nil shipping estimate
  When entering nil address
  Then shipping price should be 'undefined'


