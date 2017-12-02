Feature: Login
	Scenario: Open login box 
		Given I am guest user
		When I click on Entrar button
		Then I can fill User
		And I can fill Password