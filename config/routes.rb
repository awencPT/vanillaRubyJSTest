Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/getValidRanges", { :controller => "application", :action => "java" })
  get("/", { :controller => "application", :action => "home" })
  
  get("/getFee/:tokenId", { :controller => "application", :action => "getFee" })
end
