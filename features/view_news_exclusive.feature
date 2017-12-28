Feature: Gaucha news

    Scenario: View news exclusive with guest user
        Given I access Gaucha
        When I click on a exclusive news
        Then I should see "CONTINUE APROVEITANDO OS CONTEÚDOS DE GAÚCHAZH!" exclusive page validation