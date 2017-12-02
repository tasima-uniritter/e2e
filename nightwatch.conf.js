const chromeDriver = require('chromedriver');
const path = require('path');

require('nightwatch-cucumber')({
	cucumberArgs: [
		'--require',
		'./timeout.js',
	],
});

module.exports = {
  selenium: {
    start_process: true,
    server_path: path.resolve(__dirname, 'index.jar'),
    host: '127.0.0.1',
    port: 4444,
  },
  test_settings: {
	'default': {
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
  },
};