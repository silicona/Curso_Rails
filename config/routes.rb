Rails.application.routes.draw do

  root :to => 'prueba#index'

  # Gets anulados por match:
  get 'usuario/index'
  get 'prueba/edit'
  get 'prueba/index'
  get 'prueba/alemania'
  get 'prueba/japon'
  get 'prueba/linkto'
  get 'prueba/sinvista'
  get 'prueba/sinvista/:id' => 'prueba#sinvista'

  get 'prueba/imagen'
  get 'prueba/html'
  # match ":controller(/:action(/:id(.:format)))", via:[:get]

  post 'prueba/japon/:id' => 'prueba#japon'
  put 'prueba/japon/:id' => 'prueba#japon'
  delete 'prueba/japon/:id' => 'prueba#japon'


  get 'formularios/index'
  get 'formularios/mails'
  get 'formularios/contacto'
  get 'formularios/servicios'
  get 'formularios/localizacion'
    
  post 'formularios/contacto'
  post 'formularios/servicios'
  post 'formularios/mails'
  post 'formularios/localizacion'


  match 'editar' => 'prueba#edit', via:[:get]

  # link con alias
  match 'alemania' => 'prueba#alemania', via: [:get], :as => :alemania

  # Se puede modificar la url para pasar un parametro
  match 'user/:usuario' => 'prueba#index', via: [:get]
  
  match '/html' => redirect('prueba/html'), via: [:post]

  match "/usuario" => redirect("/prueba"), via:[:get]

	# The priority is based upom order of creation:
	# first created -> highest priority.
  
  # No funciona este match
  # match '/articulo/:year/:month/:day' => 'prueba#index',
  # :constraints => {
  #   :year => "r%\d(4)/",
  #   :month  => "r%\d(1,2)/",
  #   :day  => "r%\d(1,2)/"
  # }, via:[:get]

  # Ejemplo de ruta regular:
  # match 'products/:id/edit' => 'productos#edit', via:[:get]
  # Recuerda que puedes asignar otros valores apdemas de :controller y :action

  # Sample of named route:
  # match 'products/:id/purchase' => 'products#purchase', :as => 'purchase'
  # This route will be invoked with purchase_url(:id => product.id)

  # Sample resources route (mpas HTTP verbs to controller actions autmat.)
  #   resources :products

  # Sample resources route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toogle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  
  # Sample resource route with sub-resources
  #
  #   resources :products do
  #     resources :comments, :sales
  #     resources :seller
  #   end
  
  # Sample resource route with more complex sub-resources
  #
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductosController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that is not 
  # recommended for RESTful application.
  # Note: This route will make all actions in every controller accesible
  # via GET requests.
  # Todos los controladores usaran el metodo GET.

  # match ":controller(/:action(/:id(.:format)))", via:[:get]



	# Sample of regular route:
	# modifica el nombre de la ruta (conflicto con :root)
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
