require 'capybara/cucumber'
require 'selenium-webdriver'
 
Capybara.register_driver :headless_chrome do |app|
  capabilities  = Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {
      "args" => [
        "--disable-web-security", 
        "--disable-clear-browsing-data-counters",
        "--headless",
        "--disable-gpu",
        "--disable-password-manager-reauthentication",
        "--disable-cache",
        "--incognito",
      ],
      "prefs" => {
        "profile.managed_default_content_settings.images": 2
      }
    }
  )
  Capybara::Selenium::Driver.new(
    app, 
    browser: :chrome,
    desired_capabilities: capabilities 
  )
end

Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :headless_chrome

World(Capybara::DSL)
