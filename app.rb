require "./lib/player.rb"

# Definition des joueurs
player1 = Player.new("Alice")
player2 = Player.new("Bob")

# Boucle de combat
def game(player1, player2)
  i = 1
  while player1.life_points > 0 && player2.life_points > 0 
    puts "----------------------Début du Round #{i}----------------------"
    puts "Voici l'état de nos joueurs :"
    player1.show_state
    player2.show_state
    puts "-------Round #{i} - Attaque du Joueur #{player1.name} -----"
    player1.attacks(player2)
    if player2.life_points > 0
      puts "-------Round #{i} - Attaque du Joueur #{player2.name} -----"
      player2.attacks(player1)
    end
    puts "-------------------------Fin du Round #{i}----------------------"
    i += 1
    puts " "
  end
end

game(player1, player2)
