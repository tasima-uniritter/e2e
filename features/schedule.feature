Feature: Schedule
    Scenario: See monday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on SEG in shedule nav
        Then I can see 17 tv programs