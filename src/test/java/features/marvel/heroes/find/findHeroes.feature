Feature: Test create heroes

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

  @usersById
  Scenario: T-API-PQBP-637-CA1 Create and then Update Hero
    # --- Create Hero ---
    Given path '/testuser/api/characters'
    * def createRequest = read('classpath:data/create/createHeroRequest.json')
    * def uuid = java.util.UUID.randomUUID().toString()
    * createRequest.name = createRequest.name + ' ' + uuid
    And request createRequest
    When method post
    Then status 201
    * def createdId = response.id
    * print 'Created Hero ID:', createdId

    # --- Find Hero ---
    Given path '/testuser/api/characters', createdId
    When method get
    Then status 200
    And match response == responseBody


  Scenario: T-API-PQBP-636-CA3 Not Find Hero by ID (Fail)
    * def responseBody = read('classpath:data/find/notFoundByIdResponse.json')
    Given path '/testuser/api/characters/99999'
    When method get
    Then status 404
