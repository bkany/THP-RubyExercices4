class Game
  attr_accessor :human_player, :enemies

	# Initialisation de la partie avec le jouer humain et 3 joueurs robot
  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    for i in 1..3
      robot_name = "player#{i}"
      enemies << Player.new(robot_name)
    end
  end

	# Supprime un joueur robot de la liste de joueur si il est mort au combat
	def kill_player(player)
		@enemies.delete(player)
	end

	# affiche tous les joueurs à l'écran
	def show_players
		@human_player.show_state
		puts "Il reste #{@enemies.length} ennemis"
		@enemies.each do |bot|
			if bot.life_points > 0
				bot.show_state
			end
		end
  end

	# retourne true si le jeu est toujours en cours
	def is_still_ongoing?
		if @enemies.length > 0 && @human_player.life_points > 0
			return true
		else
			return false
		end
	end

	# Demande au joueur quelle action doit être effectuée lors du tour de jeu	
	def menu
		puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    
    @enemies.each do |bot|
      print "#{@enemies.index(bot)} - "
      bot.show_state
    end
	end
	
	# réalisation d'une action en fonction de l'entrée terminal du joueur
	def menu_choice(action)
    if action == "a"
      @human_player.search_weapon
    end
    if action == "s"
      @human_player.search_health_pack
   	end
   	if action == "0" || action == "1" || action == "2"
   		@enemies.each do |bot|
   			if action.to_i == @enemies.index(bot)
   				@human_player.attacks(bot)
   				if bot.life_points <= 0
   					kill_player(bot)
   				end
   			end
   		end
   	end
  end

	def enemies_attack
		@enemies.each do |bot|
			bot.attacks(@human_player)
		end
	end
	
	def end_game
	  puts "La partie est finie"
  	if (@human_player.life_points > 0)
    	puts "Bravo ! Tu as gagné !"
  	else
    	puts "Loser ! Tu as perdu !"
  	end
	end

end
