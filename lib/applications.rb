
#  cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer).

$:.unshift File.expand_path('./../lib', __FILE__)
require 'game'
require 'platform'

class Application

  def perform
    puts "Bienvenue dans le jeu du morpion."
    @game = Game.new # créé instance de Game
    @game.turn # commence un nouveau tour

  end

end


