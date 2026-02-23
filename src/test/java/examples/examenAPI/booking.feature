Feature: Automatización de API Restful-Booker

  Background:
    * url baseUrl='https://restful-booker.herokuapp.com/'
    * def authPayload = { username: 'admin', password: 'password123' }


  Scenario: [Happy Path] Generar token de autenticación exitosamente
    Given path 'auth'
    And request authPayload
    When method post
    Then status 200
    And match response.token == '#notnull'
    * def authToken = response.token

  Scenario: [Unhappy Path] Error al generar token con credenciales inválidas
    Given path 'auth'
    And request { username: 'wrongUser', password: 'wrongPassword' }
    When method post
    Then status 200
    And match response.reason == 'Bad credentials'


  Scenario: [Happy Path] Obtener una reserva existente por ID
    Given path 'booking', 1
    When method get
    Then status 200
    And match response contains { firstname: '#string', lastname: '#string' }

  Scenario: [Unhappy Path] Intentar obtener una reserva con ID inexistente
    Given path 'booking', 999999
    When method get
    Then status 404


  Scenario: [Happy Path] Actualizar una reserva existente

    Given path 'auth'
    And request authPayload
    When method post
    * def token = response.token


    Given path 'booking', 1
    And header Cookie = 'token=' + token
    And header Accept = 'application/json'
    And request
    """
    {
        "firstname" : "James",
        "lastname" : "Brown",
        "totalprice" : 111,
        "depositpaid" : true,
        "bookingdates" : {
            "checkin" : "2018-01-01",
            "checkout" : "2019-01-01"
        },
        "additionalneeds" : "Breakfast"
    }
    """
    When method put
    Then status 200
    And match response.firstname == 'James'

  Scenario: [Unhappy Path] Error al actualizar sin token de autenticación
    Given path 'booking', 1
    And request { "firstname": "Jane" }
    When method put
    Then status 403