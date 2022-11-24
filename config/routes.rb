Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/getValidRanges", { :controller => "application", :action => "java" })
  get("/", { :controller => "application", :action => "home" })
  
  get("/getFee/:tokenId", { :controller => "application", :action => "getFee" })
  get("/plotter/:file", { :controller => "application", :action => "plot" })

  get("/poolView", {:controller=> "ranker", :action => "poolView"})
  post("/database_write", {:controller=> "application", :action=>"write"})
  post("/analyzer_database_write", {:controller=> "ranker", :action=>"write_Analyzer"})
end
