
$:.unshift File.expand_path('./../lib', __FILE__)
require 'boardcase'
require 'game'
require 'applications'
require 'player'
require 'show'


class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  attr_accessor :array_of_rows

  def initialize
    #TO DO :
    #9 instances BoardCases
    #Ces instances rangées dans un array qui est l'attr_accessor de la classe
    @a1 = BoardCase.new("A1")
    @a2 = BoardCase.new("A2")
    @a3 = BoardCase.new("A3")
    @b1 = BoardCase.new("B1")
    @b2 = BoardCase.new("B2")
    @b3 = BoardCase.new("B3")
    @c1 = BoardCase.new("C1")
    @c2 = BoardCase.new("C2")
    @c3 = BoardCase.new("C3")
    @array_of_rows =[
      [@a1, @a2, @a3],
      [@b1, @b2, @b3],
      [@c1, @c2, @c3]
    ]
    @free_array = ["A1", "A2", "A3", "B1","B2","B3","C1","C2","C3"]
  end

  def play_turn(current_player)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    puts "#{current_player.name}, que veux-tu jouer ?"
    print "> "
    player_case = gets.chomp.upcase
    while !@free_array.include?(player_case)   # on teste si la case est dispo
      puts "Il faut rentrer une case disponible."
      player_case = gets.chomp.upcase
      print "> "
    end

    #2) change la BoardCase jouée en fonction de la valeur du joueur
    case player_case
    when "A1"
      @a1.state = current_player.sign
      @free_array.delete("A1")
    when "A2"
      @a2.state = current_player.sign
      @free_array.delete("A2")
    when "A3"
      @a3.state = current_player.sign
      @free_array.delete("A3")
    when "B1"
      @b1.state = current_player.sign
      @free_array.delete("B1")
    when "B2"
      @b2.state = current_player.sign
      @free_array.delete("B2")
    when "B3"
      @b3.state = current_player.sign
      @free_array.delete("B3")
    when "C1"
      @c1.state = current_player.sign
      @free_array.delete("C1")
    when "C2"
      @c2.state = current_player.sign
      @free_array.delete("C2")
    when "C3"
      @c3.state = current_player.sign
      @free_array.delete("C3")
    end

  end

  def victory?(current_player, status)
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    if (@a1.state == @a2.state) && (@a2.state == @a3.state) && (@a1.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@b1.state == @b2.state) && (@b2.state == @b3.state) && (@b1.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@c1.state == @c2.state) && (@c2.state == @c3.state) && (@c1.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@a1.state == @b1.state) && (@b1.state == @c1.state) && (@a1.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@a2.state == @b2.state) && (@b2.state == @c2.state) && (@a2.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@a3.state == @b3.state) && (@b3.state == @c3.state) && (@a3.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@a1.state == @b2.state) && (@b2.state == @c3.state) && (@a1.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    elsif (@a3.state == @b2.state) && (@b2.state == @c1.state) && (@a3.state != "_" )
      puts "#{current_player.name} a gagné !\n"
      return true
    else
    end
  end

end