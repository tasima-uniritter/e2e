Feature: Newsletter
    Scenario: Sign up with valid email
        Given I access Gaucha
        When I sign me up on newsletter with valid email
        And I click on submit in newsletter form
        And I choose one favorite content
        And I click on submit in newsletter form
        Then I can see confirmation texts inside newsletter box

    Scenario: Sign up with invalid email
        Given I access Gaucha
        When I sign me up on newsletter with invalid email
        And I click on submit in newsletter form
        Then I can see error message inside newsletter box