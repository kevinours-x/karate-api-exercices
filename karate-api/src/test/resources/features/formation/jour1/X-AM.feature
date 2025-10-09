Feature:

Background:
    * url 'https://rabbit.xelians-dev.fr/'


* header Accept = 'application/json, text/plain, */*'
* header Accept-Encoding = 'gzip, deflate, br, zstd'
* header Content-Type = 'application/json'
* header Connection = 'keep-alive'
* header X-Application-Id = 'USERS_APP'
* header X-Tenant-Id = '301'
Scenario: X-AM

# /!\ fonction à implémenter /!\
# Utiliser le token
* def token = 'TOK-6-znh4C-tQ0XS0taJ8R-G3qQonXcaHj1Fi'
* header Authorization = 'Bearer ' +  token
* print token 

# Given path '/identity/identity-api/users/68d2a52e12974072f669020ab70edd176d524031840e7134bc144739188a4f12'
# # 676285a6abdb9ddd56a2768f676285a6abdb9ddd56a27690'
# # And param identifier = '1537'
# When method GET
# Then status 200
# #* print response
# * print response.email

# Erreur: "The DTO identifier must match the path identifier for update."
* def id = '68d2a52e12974072f669020ab70edd176d524031840e7134bc144739188a4f12'
  # modifier email du user (PATCH)
Given path '/identity/identity-api/users/' + id
And request { "id":'68d2a52e12974072f669020ab70edd176d524031840e7134bc144739188a4f12', "email": 'kgi.api.up@xtech.com' }
  When method PATCH
  Then status 200  
* print response.email
