const { client } = require('nightwatch-cucumber');
const { defineSupportCode } = require('cucumber');

defineSupportCode(({Given, Then, When}) => {
	Given('I am guest user', () => {
		return client
			.url('https://gauchazh.clicrbs.com.br/')
			.waitForElementVisible('.gzh-all');
	});

	When('I click on Entrar button', () => {
		return client.click('.login-button');
	});

	Then('I can fill User', function (callback) {
	 callback(null, 'pending');
	});

	Then('I can fill Password', function (callback) {
	 callback(null, 'pending');
	});
});
