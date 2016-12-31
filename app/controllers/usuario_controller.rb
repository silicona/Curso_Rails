class UsuarioController < ApplicationController

	# Filtros
  # before_action :nombre_metodo [:only, :except]
  # after_action :nombre_metodo [:only, :except]
  # around_action :nombre_metodo [, :only, :except]

  before_action :autorizar, :only =>[:servicios]
  after_action :autorizar, :except =>[:servicios]
  # around_action :autorizar, :except =>[:servicios]

  #skip_around_action :autorizar # Anula el filtro heredado de 
  # application_controller.rb

  def index
  	@titulo = "Pagina principal de " + controller_name
    @url = request.url
    @dominio = request.domain
    @ip = request.remote_ip

    logger.info ("Me encuentro dentro de #{action_name}")

    #if request.get? # para recoger peticiones de metodos HTTP
      # @usuario = Usuario.new  # No funciona sin BD
    #else
      # @usuario.save # No funciona sin BD
    #end

    # request.post? y demas
    # Para recoger una peticion ajax
    # if request.xml_http_request? # abreviado .xhr

    # render Siempre es ellamado
    respond_to do |format|
      format.html
      format.xml # No responde a xml
      format.js # Javascript
    end

    # redirect_to # Redirecciona a otra url
    # redirect to :controller => "contr", :action => "acti", :id => "parametro"
    # redirect_to "http://www.prueba.com"
    # redirect_to "/home/prueba"
    # redirect_to :back
  end
    def quienes_somos
    @titulo = "Quienes somos"
    flash[:noticia] = "Se ha realizado correctamente."
    redirect_to :action => 'servicios'

    # redirect_to :action => "contacto", :nombre => "Santiago"
    # redirect_to root_path
    # redirect_back(fallback_location: "/home/index")
    # redirect_to "http://www.prueba.com"
    # redirect_to :controller => "home", :action => "index"
    # redirect_to "/home/index"

  end

  def localizacion
    @titulo = 'Localizacion'
    
  end

  def servicios
    @informacion = request.request_method
    @titulo = "Servicios"
    logger.info ("Me encuentro dentro de #{action_name}")

  end

  def contacto
    @titulo = "Contacto"
    @accion = action_name
    @controlador = controller_name
    logger.info ("Me encuentro dentro de #{action_name}")

    # render :template => "home/contacto"
    # render :text => params[:nombre]
    # render :nothing => true
    # render :action => :index
  end

  # def method_missing(method, *args) No funciona bien
  #   render :text => "Error al llamar a #{method}."
  # end

  private

  def autorizar
    logger.info ("Me encuentro dentro de autorizar")
  end


end
