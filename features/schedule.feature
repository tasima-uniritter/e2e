Feature: Schedule
    Scenario: See monday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Seg in shedule nav
        Then I can see 17 radio programs

    Scenario: See tuesday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Ter in shedule nav
        Then I can see 18 radio programs

    Scenario: See wednesday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Qua in shedule nav
        Then I can see 18 radio programs

    Scenario: See thursday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Qui in shedule nav
        Then I can see 18 radio programs

    Scenario: See friday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Sex in shedule nav
        Then I can see 18 radio programs

    Scenario: See saturday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Sab in shedule nav
        Then I can see 16 radio programs

    Scenario: See sunday schedule
        Given I access Gaucha
        When I click on schedule
        And I click on Dom in shedule nav
        Then I can see 12 radio programs