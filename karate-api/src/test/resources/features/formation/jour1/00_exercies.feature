Feature: JOUR 1 - APRÈS-MIDI - Exercices pratiques et consolidation (2h)
  # 🎯 Objectifs:
  # - Consolider les acquis du matin
  # - Résoudre des problèmes concrets
  # - Gagner en autonomie


  Background:
    # * url 'https://jsonplaceholder.typicode.com'
    * url 'http://localhost:3001/'
    # * url 'https://smtp-xam.xelians-dev.fr/'
    # * url smtpUrl



* header Content-Type = 'application/json'

* header Accept = 'application/json'

# headers multiples

#* header { 'Content-Type': 'application/json', 'Accept-Language': 'fr'}





  #Scenario: EXERCICE 1 - Explorer l'API des albums

    # 📝 DÉFI: Découvrir une nouvelle ressource

    # CONSIGNES:

    # 1. Récupérer tous les albums (/albums)

    # 2. Vérifier qu'on en a exactement 100

    # 3. Vérifier que le premier album a un userId et un id

    #Given path '/albums'

    #When method GET

    #Then status 200

    #* def len = response.length  

    #And match len == 100

    #And match response[0] contains { userId: "#number", id: "#number"}



  #Scenario: EXERCICE 2 - Trouver les albums d'un utilisateur

    # 📝 DÉFI: Utiliser les paramètres de filtrage

    # CONSIGNES:

    # 1. Récupérer les albums de l'utilisateur 2

    # 2. Vérifier qu'ils appartiennent tous à cet utilisateur

    #Given path '/albums'

    #And param userId = 2

    #When method GET

    #Then status 200

    #And response.userId == 2



  #Scenario: EXERCICE 3 - Explorer les commentaires

    # 📝 DÉFI: Découvrir une nouvelle structure de données

    # CONSIGNES:

    # 1. Récupérer tous les commentaires (/comments)

    # 2. Examiner la structure du premier commentaire

    # 3. Vérifier qu'il a: postId, id, name, email, body

    #Given path '/comments'

    #When method GET

    #Then status 200

    #And match response[0] contains { id: 1 }

    #And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"#string",body:"#string"}  



  #Scenario: EXERCICE 4 - Validation d'email avec regex

    # 📝 DÉFI: Utiliser une expression régulière

    # CONSIGNES:

    # 1. Récupérer un commentaire

    # 2. Vérifier que l'email est au bon format

    #Given path '/comments'

    #When method GET

    #Then status 200

    #And match response[0] contains { id: 1 }

    #And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"Eliseo@gardner.biz",body:"#string"}      

    #And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"#regex .+@.+\\..+",body:"#string"}  

    #And match response[0] == {postId:"#number",id:"#number",name:"#string",email:"#regex [0-9a-zA-Z]{1,30}@[0-9a-zA-Z]{1,10}\\.[0-9a-zA-Z]{2,3}",body:"#string"}  

 



  #Scenario: EXERCICE 5 - Créer votre propre test

    # 📝 DÉFI LIBRE: Inventez votre propre scénario

    # SUGGESTIONS:

    # - Tester /todos (tâches à faire)

    # - Tester /photos (photos des albums)

    # - Combiner plusieurs vérifications

   

    # À vous de jouer ! Écrivez votre test ici...



    #* def idTodos = 1

    #Given path '/todos'

    #And param userId = idTodos

    #* print idTodos

    #When method GET

    #Then status 200

    #And match each response == { userId: "#number", id: "#number",  title: "#string", completed: "#boolean" }

   





    # vérifier que le nombre de photos du premier album du second utilisateur est bien 50

    #Given path '/albums'

    #And param userId = 2

    #When method GET

    #Then status 200

    #* def idAlbum = response[0].id

    #* print response[0].id

   

    #Given path '/photos'

    #And param albumId = idAlbum

    #When method GET

    #Then status 200

    #* def nbPhotos = response.length

    #* print response.length  

    #And match nbPhotos == 50

    #And match each response == { albumId: "#number", id: "#number",  title: "#string", url: "#regex https.+", thumbnailUrl: "#regex https.+" }

    #And match each response contains { albumId: #(idAlbum) }    



  #Scenario: EXERCICE 6 - Test de cohérence des données

    # 📝 DÉFI AVANCÉ: Vérifier la logique métier

    # CONSIGNES:

    # 1. Récupérer un post spécifique

    # 2. Récupérer ses commentaires

    # 3. Vérifier que tous les commentaires pointent vers ce post

   

    #* def idPost = 2



    #Given path '/posts'

    #And param id = idPost

    #When method GET

    #Then status 200

    #And match response[0] contains { id: #(idPost) }



    #Given path '/comments'

    #And param postId = idPost

    #When method GET

    #Then status 200

    #And match each response contains {postId: #(idPost)}





  #Scenario: EXERCICE 7 - CONTROLE DE TOUS LES ZIPCODE  

    #Given path '/users'

    #When method GET

    #Then status 200

    #And match response[*].address.zipcode == "#present"

    #And match response[*].address.zipcode == "#[] #string"    



    #And match each response[*].address.zipcode == "#present"

    #And match each response[*].address.zipcode == "#string"      

   



#Scenario: EXERCICE 8        

    #Given path '/albums'

    #When method GET

    #Then status 200

    #* def var1 = karate.filter(response, function(u){return u.userId == 2})

    #* def len1 = var1.length

    #And match len1 == 10





#Scenario: EXERCICE 9    

  #Given path '/albums'

  #When method GET

  #Then status 200

  #* def albumIds = []

  #* karate.forEach(response, function(album){albumIds.push(album.id)})

  #And match albumIds == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]



 #Scenario: EXERCICE 10 - POST

  #Given path '/albums/087e'

  #And param id = "6"

  #When method DELETE

  #Then status 200





  #Given path '/albums'

  #And request {id: "6", userId: 1, title: "New Album"}

  #When method POST

  #Then status 201

 

  #Given path '/albums'

  #When method GET

  #Then status 200

  #* def longueur = response.length

  #* print longueur

  #* def idNew = response[longueur - 1].id

  #* print idNew  



  #Given path '/albums'

  #When method GET

  #Then status 200

  #* def longueur = response.length

  #* print longueur

  #* def idNew = longueur + 1

  #* print idNew  



  #Given path '/albums'

  #And request {id: "#(idNew)", userId: 1, title: "New Album"}

  #When method POST

  #Then status 201  



  #Given path '/albums'

  #When method GET

  #Then status 200

  #* def longueur = response.length

  #* print longueur

  #* def idNew = response[longueur - 1].id

  #* print idNew





  # Scenario: EXERCICE 11 - headers variables (objets)

  #Given path '/albums'

  #When method GET

  #Then status 200

  #* def longueur = response.length

  #* print longueur

  #* def idNew = longueur + 1

  #* print idNew  



  #* def tableau =

  #"""

  #[

  #  {id: "#(idNew)", userId: 1, title: "New Album"}

  #  {id: "#(idNew + 1)", userId: 1, title: "New Album"}

  #]

  #"""





  #Given path '/albums'

  #And request tableau[0]

  #When method POST

  #Then status 201  



  #Given path '/albums'

  #And request tableau[1]

  #When method POST

  #Then status 201  



  #Given path '/albums'

  #When method GET

  #Then status 200

  #* def longueur = response.length

  #* print longueur

  #* def idNew = response[longueur - 1].id

  #* print idNew







  # Scenario: EXERCICE 13 - Authentification

# * def credentials = 'teamdlab:44mUTmCP8REI93QbpogYvVAu'

# * print credentials



# * def encoded = karate.encode('base64', credentials)

# * def encoded = java.util.Base64.getEncoder().encodeToString(credentials.getBytes())



# * print encoded

# * header Authorization = 'Basic ' + encoded



# Given path '/api/Messages/3c8c8601-9a05-479c-9a9a-357667ec02be'

# And param id = '3c8c8601-9a05-479c-9a9a-357667ec02be'

# When method GET

# Then status 200

# * print response



#Obtenir le token

#  Given path '/auth/login'

#  And request { username: 'admin', password: 'secret' }

#  When method POST

#  Then status 200

#  * def token = response.token



# Utiliser le token

# * header Authorization = 'Bearer ' +  token



# 3c8c8601-9a05-479c-9a9a-357667ec02be

# Given path '/api/Messages/{id}/markRead'



# Given path '/api/Messages/markAllRead'

# When method POST

# Then status 200

# * print response









# * def idMail = '3c8c8601-9a05-479c-9a9a-357667ec02be'

# Given path '/api/Messages/' + idMail

# And param headers[4]Name = 'Subject'

# When method GET

# Then status 200

# * print response

# And match response.id == '3c8c8601-9a05-479c-9a9a-357667ec02be'

# And match response.headers[4].name == 'Subject'



# * def idMail = '3c8c8601-9a05-479c-9a9a-357667ec02be'

# Given path '/api/Messages/' + idMail

# When method DELETE

# Then status 200

# * print response