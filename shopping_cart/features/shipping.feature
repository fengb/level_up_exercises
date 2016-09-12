Feature: Shipping estimates
Scenario: Entering address should return shipping estimates
  When entering address '6051 South Drexel Avenue  Chicago IL 60637'
  Then shipping price should be '10' dollars

