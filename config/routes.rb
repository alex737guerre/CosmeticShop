Rails.application.routes.draw do

	root to: 'about#index'
	
	get 'about' => 'about#index'
	get 'about/index'
  get 'admin/supplier' => 'admin/supplier#index'

  get 'admin/supplier/new'
  post 'admin/supplier/create'
  get 'admin/supplier/edit'
  post 'admin/supplier/update'
  post 'admin/supplier/destroy'
  get 'admin/supplier/show'
  get 'admin/supplier/show/:id' => 'admin/supplier#show'
  get 'admin/supplier/index'

end
