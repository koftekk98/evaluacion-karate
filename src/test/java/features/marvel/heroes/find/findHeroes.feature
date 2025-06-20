Feature: Test de API súper simple

  Background:
    * configure ssl = true
    * url baseUrl

  Scenario: T-API-PQBP-636-CA1 Consultar todos los heroes
    Given path '/testuser/api/characters'
    When method get
    Then status 200


  Scenario: T-API-PQBP-636-CA2 Consultar heroe por ID (Exitoso)
    * def responseBody = read('classpath:data/find/findByIdResponse.json')
    Given path '/testuser/api/characters/128'
    When method get
    Then status 200
    And match response == responseBody

  @usersById
  Scenario: T-API-PQBP-636-CA3 Consultar heroe por ID (Fallido)
    * def responseBody = read('classpath:data/find/notFoundByIdResponse.json')
    Given path '/testuser/api/characters/999'
    When method get
    Then status 404
