class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  def java
    output = `node javascriptTest.js`
    # jsonOutput = JSON.parse(output)
    # jsonOutput = JSON.parse output.gsub("'", '"').
    
    @moneyToken = output.gsub("\n","").split
    p output.gsub("\n","").split

    render({ :template => "main_interface/java.html.erb" })
  end

  def home 
    #call the database and plot
    num = PortfolioSnapshot.all.last.closeOutValue * 0.9
    @minCloseOut = num
    @minEthPrice = PortfolioSnapshot.all.last.ethPrice * 0.9

    
    render({ :template => "main_interface/homepage.html.erb" })
  end

  def getFee
    tokenId = params.fetch("tokenId")
    # Do Static Call for Fee Amount: How pass tokenId to javascirtp 
    data = `node staticCollect #{tokenId}`
    @staticCollect = data.gsub("\n","").split
    
    render({ :template => "main_interface/getFee.html.erb" })
  end

  def plot 
    require 'csv'
    @result =  params

    # csv_text = File.read(Rails.root.join("lib", "csvs", "real_estate_transactions.csv"))
    # csv = CSV.parse(params.fetch("csv"), :headers => true, :encoding => "ISO-8859-1")
    # puts csv  
    render({ :template => "main_interface/plots.html.erb" })
  end

  def rank


    
  end

  def write 

  firstVar = params.fetch("first_variable")
  

  instance = PortfolioSnapshot.new
  instance.tokenId = firstVar.fetch("tokenId")
  instance.totalFeesValue_0 = firstVar.fetch("totalFeesValue_0")
  instance.ethPrice = firstVar.fetch("ethPrice")
  instance.upperTick_token0 = firstVar.fetch("upperTick_token0")
  instance.lowerTick_token0 = firstVar.fetch("lowerTick_token0")
  instance.closeOutValue = firstVar.fetch("closeOutValue")
  instance.adjustedInLiquidity = firstVar.fetch("adjustedInLiquidity")
  instance.currentLoanAmount_adj = firstVar.fetch("currentLoanAmount_adj")
  instance.aaveCollateralValue = firstVar.fetch("aaveCollateralValue")
  instance.LTV = firstVar.fetch("LTV")
  instance.healthFactor = firstVar.fetch("healthFactor")
  instance.adjustGrandTotal = firstVar.fetch("adjustGrandTotal")
  instance.adjustGrandTotalwCollectFees = firstVar.fetch("adjustGrandTotalwCollectFees")

  

  instance.save
  end

  

  

  



end
