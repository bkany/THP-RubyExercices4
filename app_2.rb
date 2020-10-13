require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def beginning_of_game
	puts "------------------------------------------------------------"
	puts "|       Bienvenue sur 'ILS VEULENT TOUS MA POO !            "
	puts "|     Le but du jeu est d'être le dernier survivant !       "
	puts "------------------------------------------------------------"
end

def get_user_name
	puts "Quel sera ton nom pour cette partie ?"
	print "> "
	name = gets.chomp
	return name
end

def game
# Création des joueurs humains et robots
  user = HumanPlayer.new(get_user_name)
  player1 = Player.new("Alice")
  player2 = Player.new("Bob")
  enemies = [player1, player2]

  # Boucle de jeu
  while (user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0))
    # Actions du joueur humain 
    user.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    
    enemies.each do |x|
      print "#{enemies.find_index(x)} - "
      x.show_state
    end

    action = gets.chomp
    case action
    when "a"
      user.search_weapon
    when "s"
      user.search_health_pack
    when "0"
      user.attacks(player1)
    when "1"
      user.attacks(player2)
    end

    # Action des joueurs robots
    if player1.life_points > 0 || player2.life_points > 0
      puts "Les autres joueurs attaquent !"
      gets.chomp 
        enemies.each do |player|
          if player.life_points > 0 
            player.attacks(user)
          end
        end
      gets.chomp
    end
  end

  return user
end

# Fin de la partie
def end_of_game(user)
  puts "La partie est finie"

  if (user.life_points > 0)
    puts "Bravo ! Tu as gagné !"
  else
    puts "Loser ! Tu as perdu !"
  end
end

#---------- LANCEMENT DU JEU ---------------
beginning_of_game
user = game
end_of_game(user)
