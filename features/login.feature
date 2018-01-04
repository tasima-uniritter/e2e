Feature: Authentication flow
    Scenario: Login
        Given I access Gaucha
        When I sigin with a valid user
        Then I should see "Soc de Educacao Ritter dosReis" in login sidebar
    
    Scenario: Logout
        Given I access Gaucha
        When I sigin with a valid user
        And I click on logout
        Then I shouldn't see user name in login sidebar