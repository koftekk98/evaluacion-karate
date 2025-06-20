Feature: Test update heroes

  Background:
    * configure ssl = true
    * url baseUrl


  Scenario: T-API-PQBP-637-CA1 Update Hero
    Given path '/testuser/api/characters'
    * def createRequest = read('classpath:data/create/createHeroRequest.json')
    * def uuid = java.util.UUID.randomUUID().toString()
    * createRequest.name = createRequest.name + ' ' + uuid
    And request createRequest
    When method post
    Then status 201
    * def createdId = response.id
    * print 'Created Hero ID:', createdId

    # --- Update Hero ---
    Given path '/testuser/api/characters', createdId
    * def updateRequest = read('classpath:data/update/updateHero.json')
    And request updateRequest
    When method put
    Then status 200


  Scenario: T-API-PQBP-638-CA2 Update Hero (NOT FOUND)
    Given path '/testuser/api/characters/9999'
    * def requestBody = read('classpath:data/update/updateHero.json')
    * def responseBody = read('classpath:data/update/updateHeroNotFound.json')
    And request requestBody
    When method put
    Then status 404
