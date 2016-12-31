class FormulariosController < ApplicationController
  
  # Layout establece la plantilla de vistas y domina sobre
  # las plantillas exclusivas de controladores, como Formularios.
  layout "application", :only => [:index, :localizacion]
  layout "tercera", :only => [:quienes_somos]
  #layout "home", :except => [:index, :localizacion]

  def index
    @titulo = "Estamos en la pagina de Inicio de Formularios"
  end

  def mails
    $arr ||= ['santiago', 'paco', 'luisa']
    @titulo = "Manejando Mails y Botones"
    flash.keep[:noticia] 
  end

  def servicios
    @titulo = "Servicios"
    @informacion = request.request_method

    if request.get?
      flash[:noticia] = "Entramos con GET: #{params[:id]}."
    elsif request.post?
      flash[:noticia] = "Entramos con POST: #{params[:id]}."
      $arr.delete(params[:id])
      
      Inicial.borrar(params[:id])
      
      redirect_to action: 'mails'
      
      #redirect_to root_path

    end

  end

  def localizacion
    @titulo = 'Localizacion'

    if request.post?
      flash[:noticia] = "Entramos desde Localizacion con POST: #{params[:nombre]}."
      Inicial.agregar(params[:nombre])
      
      flash[:edad] = "Eres #{params[:edad]}"
      redirect_to action: 'mails'
    elsif request.get?
      flash[:noticia] = "Entramos desde Localizacion con GET: #{params[:nombre]}."

      if Inicial.mirar.include?(params[:nombre])
        @nombre = "Existe #{params[:nombre]}"
        render :text => "Existe"
      else
        @nombre = "#{params[:nombre]} no existe"
        render :text => "No existe"
      end

    end


  end

  def contacto
    if request.get?
      @titulo = "Contacto por GET"
      


      @numeros = "El numero es #{params[:numeros]}."
      @rango = "El valor del rango es #{params[:rango]}."
      @busqueda = "Buscas #{params[:busqueda]}."
      @telefono = "El telefono es #{params[:telefono]}."
      @email = "El email es #{params[:email]}."
      @contra = "La password es #{params[:contraseña]}."
      @fumador = "#{params[:fumador]}."
      @casado = "#{params[:casado]}."
      @color = "El color escogido es #{params[:color]}."
      unless params[:colores].nil?
        @colores = "Los colores son #{params[:colores].join(', ')}"
        @colo = params[:colores].each do |col|
          col.capitalize
        end
      end

    else
      @id = params[:id]
      @titulo = "Contacto por POST"
      
      unless params[:nombre].nil?
        @titulo = "Contacto por post con #{params[:nombre]}"
        Array.agregar(params[:nombre])
        redirect_to root_path

        #Array.borrar(params[:nombre])
        #redirect_to :action => "localizacion"
      end

      unless params[:archivo].nil?
        # Recogemos el archivo como parametro
        # Variable local porque no va a ir a la vista
        archivo = params[:archivo]
        # Variable para leer el nombre del archivo
        nombre = archivo.original_filename
        # Ver el nombre del archivo en pantalla
        # render :text => nombre
        
        # Expresion regular para limitar los archivos:
        # ^ = Desde el inicio del nombre
        # \w+ = Uno o mas caracteres alfanumericos
        # \. = Punto (literal)
        # ( = Inicio de grupo de captura
        # \S = sin espacios en blanco
        # {3} = 3 caracteres exactos (despues del punto)
        # ) = fin del grupo de captura
        # $ = Hasta el final del nombre
        
        # En el caso, solo archivos con extension de 3 caracteres
        # nombre se compara con la expresion regular y la variable
        #ver_si_es_imagen guarda el grupo de captura
        
        ver_si_es_imagen = /^\w+\.(\S{3})$/.match(nombre)

        unless ver_si_es_imagen.nil?
          # el grupo esta en segundo lugar
          if ver_si_es_imagen[1] == "jpg"
            # Indicamos donde guardarlo, en este caso, home Linux
            directorio = "/home/silicona/" + nombre

            # Abrimos un fichero en modo binario, como se guardan las imagenes.
            File.open(directorio, "wb") { |f| f.write(archivo.read) }
            
            flash[:mensaje] = nombre + " guardado en carpeta Home de Silicona."
          else
          
            flash[:mensaje] = "No es un archivo JPG."
          end
        else
          flash[:mensaje] = "Ha petado la RegExp."
        end

        redirect_to action: 'index'

      end
    end
  end
end
