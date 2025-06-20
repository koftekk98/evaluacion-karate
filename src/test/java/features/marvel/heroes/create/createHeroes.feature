Feature: Test create heroes

  Background:
    * configure ssl = true
    * url baseUrl


  Scenario: T-API-PQBP-637-CA1 Create Hero
    Given path '/testuser/api/characters'
    * def requestBody = read('classpath:data/create/createHeroRequest.json')
    * def uuid = java.util.UUID.randomUUID().toString()
    * requestBody.name = requestBody.name + ' ' + uuid
    And request requestBody
    When method post
    Then status 201


  Scenario: T-API-PQBP-638-CA1 Create Hero (Duplicated Name)
    Given path '/testuser/api/characters'
    * def requestBody = read('classpath:data/create/createHeroDuplicated.json')
    And request requestBody
    When method post
    Then status 400


  Scenario: T-API-PQBP-638-CA1 Create Hero (Missing Fields)
    Given path '/testuser/api/characters'
    * def requestBody = read('classpath:data/create/createHeroRequestMissingFields.json')
    And request requestBody
    When method post
    Then status 400