Feature: Test find heroes

  Background:
    * configure ssl = true
    * url baseUrl

  Scenario: T-API-PQBP-636-CA1 Find All Heroes
    Given path '/testuser/api/characters'
    When method get
    Then status 200


  Scenario: T-API-PQBP-636-CA2 Find Hero by ID (Success)
    * def responseBody = read('classpath:data/find/findByIdResponse.json')
    Given path '/testuser/api/characters/128'
    When method get
    Then status 200
    And match response == responseBody

  Scenario: T-API-PQBP-636-CA3 Not Find Hero by ID (Fail)
    * def responseBody = read('classpath:data/find/notFoundByIdResponse.json')
    Given path '/testuser/api/characters/999'
    When method get
    Then status 404
