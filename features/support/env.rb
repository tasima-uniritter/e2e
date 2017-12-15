require 'capybara/cucumber'
require 'selenium-webdriver'
 
Capybara.register_driver :selenium_chrome do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {
      "args" => [ "--disable-web-security", 
                  "--disable-clear-browsing-data-counters",
                  "--start-maximized",
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
    desired_capabilities: caps
  )
end

Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :chrome

World(Capybara::DSL)