Feature: JOUR 1 - APRÈS-MIDI - Exercices pratiques et consolidation (2h)
  # 🎯 Objectifs:
  # - Consolider les acquis du matin
  # - Résoudre des problèmes concrets
  # - Gagner en autonomie

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: EXERCICE 1 - Explorer l'API des albums
    # 📝 DÉFI: Découvrir une nouvelle ressource
    # CONSIGNES:
    # 1. Récupérer tous les albums (/albums)
    # 2. Vérifier qu'on en a exactement 100
    # 3. Vérifier que le premier album a un userId et un id
    Given path '/albums'
    When method GET
    Then status 200
    * def len = response.length  
    And match len == 100
    And match response[0] contains { userId: "#number", id: "#number"}

  Scenario: EXERCICE 2 - Trouver les albums d'un utilisateur
    # 📝 DÉFI: Utiliser les paramètres de filtrage
    # CONSIGNES:
    # 1. Récupérer les albums de l'utilisateur 2
    # 2. Vérifier qu'ils appartiennent tous à cet utilisateur
    Given path '/albums'
    And param userId = 2
    When method GET
    Then status 200
    And response.userId == 2

  Scenario: EXERCICE 3 - Explorer les commentaires
    # 📝 DÉFI: Découvrir une nouvelle structure de données
    # CONSIGNES:
    # 1. Récupérer tous les commentaires (/comments)
    # 2. Examiner la structure du premier commentaire
    # 3. Vérifier qu'il a: postId, id, name, email, body
    Given path '/comments'
    When method GET
    Then status 200
    And match response[0] contains { id: 1 }
    And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"#string",body:"#string"}  

  Scenario: EXERCICE 4 - Validation d'email avec regex
    # 📝 DÉFI: Utiliser une expression régulière
    # CONSIGNES:
    # 1. Récupérer un commentaire
    # 2. Vérifier que l'email est au bon format
    Given path '/comments'
    When method GET
    Then status 200
    And match response[0] contains { id: 1 }
#   And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"^[a-zA-Z]{6}@[a-z]{6}.[a-z]{3}$",body:"#string"}      
#   And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"^[a-zA-Z]{6}[@]{1}[a-z]{7}[.]{1}[a-z]{3}$",body:"#string"}  
    And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"Eliseo@gardner.biz",body:"#string"}      
#   And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"^[a-z0-9_-]{3,16}$",body:"#string"}      
    
#     Eliseo@gardner.biz
#    [a-zA-Z]@[a-zA-Z].[a-zA-Z]

  Scenario: EXERCICE 5 - Créer votre propre test
    # 📝 DÉFI LIBRE: Inventez votre propre scénario
    # SUGGESTIONS:
    # - Tester /todos (tâches à faire)
    # - Tester /photos (photos des albums)
    # - Combiner plusieurs vérifications
    
    # À vous de jouer ! Écrivez votre test ici...
   
  Scenario: EXERCICE 6 - Test de cohérence des données
    # 📝 DÉFI AVANCÉ: Vérifier la logique métier
    # CONSIGNES:
    # 1. Récupérer un post spécifique
    # 2. Récupérer ses commentaires
    # 3. Vérifier que tous les commentaires pointent vers ce post
    
    Given path '/posts'
    And param id = 1
    When method GET
    Then status 200
    And match response[0] contains { id: 1 }

    Given path '/comments'
    And param postId = 1
    When method GET
    Then status 200
    And match each response contains {postId: 1}
    
 