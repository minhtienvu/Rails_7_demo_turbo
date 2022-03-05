require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers
  
  # We can use the headless_chrome driver instead to prevent the Google Chrome window from opening:
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
