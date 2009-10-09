ActionController::Routing::Routes.draw do |map|

  map.namespace :cms do |cms|
    cms.namespace :admin, :path_prefix => '' do |admin|
      admin.root :controller => 'pages', :action => 'index'
      admin.resources :pages, :collection => [:update_page_tree]
      admin.resources :page_content_blocks, :collection => [:sort]
    end  
  end
    
  map.content '*path', :controller => 'cms/content', :action => 'show' 
end
