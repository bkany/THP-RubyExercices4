class Player
  #Variable de classe attribuée à un joueur
  attr_accessor :name, :life_points

  # Initialisation d'un joueur
  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  # Affichage du statut d'un joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  # Diminution des points de vie si le joueur reçoit une attaque
  def gets_damage(damage_received)
    @life_points -= damage_received
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué."
    end
  end

  # Jet d'un dé et obtention d'un nombre aléatoire entre 1 et 6
  def compute_damage
    return rand(1..6)
  end

  # Attaque sur un joueur donné Player2
  def attacks(player2)
    dice = compute_damage()
    puts "#{self.name} attaque #{player2.name}"
    puts "Il lui inflige #{dice} points de dommages"
    player2.gets_damage(dice)
  end

end


###################################################################

# Creation d'une classe fille dédiée à la création d'un joueur humain
class HumanPlayer < Player
  attr_accessor :weapon_level

  # Initialisation d'un joueur humain (avec 100 points de vie et une arme)
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  # Affichage du statut d'un joueur humain 
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  # Jet de dé et obtention d'un nombre aléatoire entre 1 et 6 multiplié par le niveau de l'arme du joueur humain
  def compute_damage
    rand(1..6) * @weapon_level
  end

  # A la recherche d'une nouvelle arme
  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}."
    if @weapon_level > dice
      puts "M@*#$ ... elle n'est pas mieux que ton arme actuelle."
    else
      @weapon_level = dice
      puts "Youhou ! Elle est meilleure que ton arme actuelle ! Tu la prends."
    end
  end

  # A la recherche d'un pack de points de vie
  def search_health_pack
    dice = rand(1..6)
    case dice
    when 1
      puts "Tu n'as rien trouvé ..."
    when 2..5
      puts "Bravo ! Tu as trouvé un pack de +50 points de vie !"
      @life_points += 50
      @life_points = @life_points >= 100 ? 100 : @life_points # Les points de vie ne doivent pas dépasser 100
    when 6
      puts "Waow ! Tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
      @life_points = @life_points >= 100 ? 100 : @life_points # Les points de vie ne doivent pas dépasser 100
    end
  end
end
