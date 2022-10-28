class ApplicationController < ActionController::Base

  def java
    output = `node javascriptTest.js`
    # jsonOutput = JSON.parse(output)
    # jsonOutput = JSON.parse output.gsub("'", '"').
    
    @moneyToken = output.gsub("\n","").split
    p output.gsub("\n","").split

    render({ :template => "main_interface/java.html.erb" })
  end

  def home 
    render({ :template => "main_interface/homepage.html.erb" })
  end

  def getFee
    tokenId = params.fetch("tokenId")
    # Do Static Call for Fee Amount: How pass tokenId to javascirtp 
    data = `node staticCollect #{tokenId}`
    @staticCollect = data.gsub("\n","").split
    
    render({ :template => "main_interface/getFee.html.erb" })
  end


end
