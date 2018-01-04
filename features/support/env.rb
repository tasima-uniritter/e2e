require 'capybara/cucumber'
require 'selenium-webdriver'
 
Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
end

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

Capybara.javascript_driver = :headless_chrome

module Helpers
  def element_visible?(element_id)
      exists = page.has_css?(element_id)
      self_hidden = page.has_css?("#{element_id}.ui-helper-hidden")
      parent_hidden = page.has_css?(".ui-helper-hidden > #{element_id}")
      other_ancestor_hidden = page.has_css?(".ui-helper-hidden * #{element_id}")
      invisible = self_hidden || parent_hidden || other_ancestor_hidden
  
      return (exists && !invisible)
  end
end

World(Helpers)

World(Capybara::DSL, Helpers)
