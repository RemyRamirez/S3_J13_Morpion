
# c'est le jeu. Elle initialise tout, lance une partie (qui se termine avec une victoire ou un nul), permet de jouer un tour, de chercher si la partie est finie, etc.

$:.unshift File.expand_path('./../lib', __FILE__)
require 'player'
require 'platform'

class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board, :array_players

  def initialize
     #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    @player1 = Player.new("Joueur 1")
    @player2 = Player.new("Joueur 2")
    @board = Board.new
    @current_player = @player1
    @array_players = [@player1, @player2]
    @status = "on going"
    @count_turns = 0
    # @show = Show.new
  end

  def turn
      #TO DO : méthode faisant appel aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
      while @status == "on going"

        Show.new.show_board(@board) # affiche le jeu
        @board.play_turn(@current_player)

        # vérif si victoire
        if @board.victory?(@current_player, @status) == true
          @status = @current_player
          puts ""
          Show.new.show_board(@board)
        end

        # passe au joueur suivant
        if @current_player == @player1
          @current_player = @player2
        else
          @current_player = @player1
        end

        # compte les tours + définit match nul
        @count_turns += 1
        if @count_turns == 9 && @status == "on going" # pour le match nul il faut que le status soit à en cours
          @status = "nul" # si match nul
          puts "Match nul\n"
          Show.new.show_board(@board)
        end
      end

      new_round # relance ou non une autre partie (choix utilisateur)

  end

  def new_round

    puts "Veux-tu rejouer ? Y or N"
    print "> "
    answer = gets.chomp.upcase
    if answer == "Y"
      @board = Board.new
      @status = "on going"
      @count_turns = 0
      turn
    else
      game_end
    end
  end

  def game_end
    puts "À bientôt :)\n"
  end

end

