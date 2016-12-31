module FormulariosHelper

	# Def enlace en Application_helper.rb
	def menu_navegacion(opciones)
		html = '<ul class= "navegador">'
		opciones.each do |nombre, accion|
			html += '<li class= "active">' + enlace(nombre, accion) + '</li>'
		end
		html += '</ul>'

		return html.html_safe
	end

end



