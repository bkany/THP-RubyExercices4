###Programmation d'un combat entre deux joueurs

####Classe Player
La classe _Player_ est constituée des variables de classes suivantes :
- @name : nom du joueur 
- @life_points : points de vie du joueur
Elle est constituée des méthodes suivantes 
- initialize(name) : initialisation d'un joueur
- show_state : affichage de l'état du joueur
- gets_damage(damage_received) : réévaluation du nombre @life_points en fonction du dommage infligé
- compute_damage : retourne un nombre entre 1 et 6 correspond à un dommage aléatoire infligé 
- attacks(player) : action d'attaque d'un joueur sur un autre

La classe _HumanPlayer_ est héritée de la classe _Player_. Elle est constituée des variables supplémentaires suivantes : 
- @weapon_level
Les méthodes supplémentaires sont les suivantes : 
- search_weapon : un chiffre au hasard entre 1 et 6 détermine si le joueur peut acquérir une arme de niveau supérieur
- search_health_pack : un chiffre au hasard entre 1 et 6 détermine si le joueur peut acquérie des points de vie supplémentaires.

La partie de jeu se déroule : 
- Dans app.rb : deux joueurs robots s'affrontent
- Dans app_2.rb : un joueur humain et deux joueurs robots s'affrontent. 
