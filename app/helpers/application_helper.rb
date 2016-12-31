module ApplicationHelper

	# Def menu_navegacion en Formularios_helper.rb utiliza def enlace.
	def enlace(nombre,direccion)
		link_to_unless_current nombre, direccion
	end

  def enlazar(nombre, direccion)
    link_to_unless_current nombre, :action => direccion
  end

  def mostrar_imagen(nombre, tamano, suplente)
  	image_tag nombre, :size => tamano, :alt => suplente
  end

  def abotonar(nombre, direccion, metodo)
  	button_to nombre, direccion, :method => metodo
  end
end
