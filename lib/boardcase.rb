# c'est une case. Il devrait y avoir 9 instances de cette classe lors d'une partie.

class BoardCase
    #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
    attr_accessor :state, :id
  
    def initialize(id)
      #TO DO : doit régler sa valeur, ainsi que son numéro de case
      @state = "_"
      @id = id
    end
  
  end