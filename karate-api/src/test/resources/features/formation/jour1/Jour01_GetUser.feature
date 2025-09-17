Feature: JOUR 1 - récupérer les infos d'un user (ici le user id 1)


  Background:
    # Cette section s'exécute avant chaque scénario
    * url 'https://jsonplaceholder.typicode.com'
    # 💡 Explication: On définit l'URL de base de notre API

  Scenario: GetUser1
    # 📝 OBJECTIF: GetUser1
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.userId == 1
    And match response.userId == "#number"   
    And match response.id == 1
     And match response.id == "#number"   
    And match response.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    And match response.title == "#string"
    And match response.body == "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    And match response.body == "#string"

    # And print response.userId
    # And print response.id
    # And print response.title
    # And print response.body
    # 💡 Explication: 
    # - Given = on prépare la requête (chemin)
    # - When = on exécute (méthode HTTP)
    # - Then = on vérifie le résultat (code de statut)

  Scenario: GetUser2
    # 📝 OBJECTIF: GetUser2
    Given path '/posts/2'
    When method GET
    Then status 200
    And match response.userId == 1
    And match response.userId == "#number"   
    And match response.id == 2
    And match response.id == "#number"   
    #And match response.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    And match response.title == "#string"
    #And match response.body == "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    And match response.body == "#string"