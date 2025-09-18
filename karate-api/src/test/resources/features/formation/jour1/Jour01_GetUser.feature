Feature: JOUR 1 - récupérer les infos d'un user (ici le user id 1)


  Background:
    # Cette section s'exécute avant chaque scénario
    * url 'https://jsonplaceholder.typicode.com'
    # 💡 Explication: On définit l'URL de base de notre API

  Scenario: GetUser1
    # 📝 OBJECTIF: GetUser1
    #Given path '/users/1'
    #When method GET
    #Then status 200
    #And match response.id == 1
    #And match response.id == "#number"   
    #And match response.address == "#object"


  Scenario: GetUser2
    # 📝 OBJECTIF: GetUser2
    #Given path '/users/2'
    #When method GET
    #Then status 200
    #And match response.id == 2
    #And match response.id == "#number"   
    #And match response.company.name == "#string"  



  Scenario: GetUser3
    # 📝 OBJECTIF: GetUser3
    #Given path '/users/3'
    #When method GET
    #Then status 200
    #And match response.id == 3
    #And match response.id == "#number"   
    #And match response.job != "#present"  


 Scenario: GetUser4
    # 📝 OBJECTIF: GetUser4
    #Given path '/posts/'
    #When method GET
    #Then status 200
    #And match each response == { userId: "#number", id: "#number",  title: "#string", body: "#string" }



 Scenario: GetUser5
    # 📝 OBJECTIF: GetUser5
    Given path '/users/1'
    When method GET
    Then status 200 
    #And match response contains { username: "Bret" }
    And match response contains { username: "#string" }
    And match response !contains { deleted: true }
    And match response.address contains { street: "Kulas Light" }
    And match response.address !contains { street: "Light Kulas" }
    And match response.address contains only { street: "Kulas Light", suite:"Apt. 556", city: "Gwenborough",zipcode:"92998-3874",geo:{"lat":"-37.3159","lng":"81.1496"} }
    
