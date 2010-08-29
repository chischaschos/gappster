ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  map.home 'home', :controller => 'home', :action => 'index'
  map.root :controller => 'home'
end
