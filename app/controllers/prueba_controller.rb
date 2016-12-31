class PruebaController < ApplicationController
  
  def index
  	@titulo = 'Estoy en Index, @titulo.'

    # Datos del usuario obtenidos en la BD.
  	@usuario = Usuario.find(1)

    # Desde routes.rb a traves de la url
    @nombre_usuario = params[:usuario]

    t = Time.now
    @mes = t.mon
    @dia = t.day

  end

  def edit
    @titulo = 'En Edit con @titulo.'
  end

  def sinvista

  	render html: "Editando desde Edicion.
  	El parametro del final de la ruta es #{params[:id].capitalize}."
  end
 
  def variable_instancia
  	@titulo = 'Contenido de @titulo'
  	@instancia = 'Contenido de variable de instancia: @instancia'

  end

  def linkto
  	@titulo = 'En casa.'

  end

  def alemania
  	@titulo = 'En Alemania.'
  end

  def japon
  	@titulo = 'En Japon.'
    if request.post?
      flash[:aviso] = "Tengo un #{params[:id]} en el bolsillo."
    end
  end
end
