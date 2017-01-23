Rails.application.routes.draw do
  root :to => "project#list"
  get "project/list"
  get "project/detail"
  get "project/upload"
  post "project/upload"
  get "profile/modify"
  post "profile/modify"
 get ':controller(/:action(/:id))'
 post ':controller(/:action(/:id))'
end 

