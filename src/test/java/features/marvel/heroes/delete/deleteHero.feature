Feature: Test delete heroe

  Background:
    * configure ssl = true
    * url baseUrl


  Scenario: T-API-PQBP-637-CA1 Create and then Delete Hero
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

    # --- Delete Hero ---
    Given path '/testuser/api/characters', createdId
    * def deleteRequest = read('classpath:data/update/updateHero.json')
    And request deleteRequest
    When method delete
    Then status 204


  Scenario: T-API-PQBP-638-CA2 Delete Hero (Not Found)
    Given path '/testuser/api/characters/99999'
    * def responseBody = read('classpath:data/update/updateHeroNotFound.json')
    When method delete
    Then status 404
