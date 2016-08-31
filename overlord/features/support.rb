require_relative '../overlord'
require 'capybara/cucumber'
Capybara.app = MyBombApp
After do
  MyBombApp.reset!
end
