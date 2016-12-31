# Imprescindible, iniciar un objeto de la clase para que la variable
# de instancia se establezca.

class Inicial
  
  def initialize
  	@@inicial ||= ["Leolo", "Claudia", "shilum"]
  end

  def self.mirar
  	@@inicial
  end

  def self.borrar(nombre)
  	@@inicial.delete(nombre)
  end

  def self.agregar(nombre)
  	@@inicial << nombre
  end

end
Inicial.new