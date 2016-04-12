Rails.application.routes.draw do

  
  get 'api/school_users/getClassList', to: 'api/school_users#getClassList'


  get 'api/activities/getActivities', to: 'api/activities#getActivities'
  post 'api/activities/create', to:  'api/activities#create'

  get 'api/events/getEvent', to: 'api/events#getEvent'
  get 'api/events/getEventForClass', to: 'api/events#getEventForClass'
  get 'api/events/getEventDetail', to: 'api/events#getEventDetail'
  get 'api/events/eventUserDetailList', to: 'api/events#eventUserDetailList'
  get 'api/events/getEventForParent', to: 'api/events#getEventForParent'
  post 'api/events/updateEventStatus', to: 'api/events#updateEventStatus'

  post 'api/parents/check_login', to: 'api/parents#check_login'
  get 'api/parents/getChildList', to: 'api/parents#getChildList'

  namespace :api do
    resources :events
  end

  namespace :api do
    resources :school_users
  end

  namespace :api do
    resources :activities
  end
  
  get 'api/home/attempt_login', to: 'api/home#attempt_login'



  get 'school_users/schoolUserHomeView', to: 'school_users#schoolUserHomeView'
  
  get 'home/terms', to: 'home#terms'
  get 'home/login', to: 'home#login'
  get 'home/logout', to: 'home#logout'
  get 'home/check_login_id', to: 'home#check_login_id'

  post 'check_login' => 'home#check_login'
  post '/check_parentlogin' => 'parents#check_parentlogin'

  get 'parents', to: 'parents#parentlogin'
  get 'parents/parentHomeView', to: 'parents#parentHomeView'


  get 'events/eventUserDetailList', to: 'events#eventUserDetailList'

  get 'classrooms/getClassesForTeacher', to: 'classrooms#getClassesForTeacher'
  get 'classrooms/getStudentsList', to: 'classrooms#getStudentsList'

  #devise_for :users
  resources :parents
  resources :activities
  resources :classrooms
  resources :students
  resources :school_users
  resources :schools
  resources :events
  #resources :home

  get 'teachers_summary', to: 'home#teachers'
  get 'daycares_summary', to: 'home#daycares'
  get 'parents_summary', to: 'home#parents'


  


  match ':controller(/:action(/:id))', :via => :post


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
