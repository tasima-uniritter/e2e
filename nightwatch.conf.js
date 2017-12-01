const chromeDriver = require('chromedriver');
const CONFIG = require('./config');

require('nightwatch-cucumber')({
  cucumberArgs: [
    '--require',
    'events.js',
    '--require',
    'timeout.js',
    '--require',
    'features/step_definitions',
    '--format',
    'pretty',
    '--format',
    'json:reports/cucumber.json',
    'features',
  ],
});


module.exports = {
  selenium: {
    start_process: true,
    server_path: 'index.jar',
    host: '127.0.0.1',
    port: 4444,
  },
  test_settings: {
    launch_url: 'https://gauchazh.clicrbs.com.br/',
    selenium_port: 4444,
    selenium_host: 'localhost',
    desiredCapabilities: {
      browserName : "chrome",
      javascriptEnabled : true,
      acceptSslCerts : true,
      chromeOptions : {
        args : [
          "start-maximized",
          "incognito",
          "disable-cache",
          "disable-clear-browsing-data-counters",
          "disable-databases",
          "disable-password-manager-reauthentication"
        ],
        prefs: {
          "profile.managed_default_content_settings.images": 2,
        },
      },
    },
    selenium: {
      cli_args: {
        'webdriver.chrome.driver': chromeDriver.path,
      },
    },
  },
};