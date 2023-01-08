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


  def display_calcs

    startTime = params.fetch("startTime")
    endTime = params.fetch("endTime")
    # first = "2022-12-15"
    # second = "2022-12-18"
    initialCloseOutValue = PortfolioSnapshot.where({:created_at => (startTime..endTime)}).group_by_minute(:created_at).maximum(:closeOutValue).values.first.to_f
    finalCloseOutValue = PortfolioSnapshot.where({:created_at => (startTime..endTime)}).group_by_minute(:created_at).maximum(:closeOutValue).values.last.to_f
    @closeOutPercDiff = ((finalCloseOutValue - initialCloseOutValue)/initialCloseOutValue )*100

    initialPriceValue = PortfolioSnapshot.where({:created_at => (startTime..endTime)}).group_by_minute(:created_at).maximum(:ethPrice).values.first.to_f
    finalPriceValue = PortfolioSnapshot.where({:created_at => (startTime..endTime)}).group_by_minute(:created_at).maximum(:ethPrice).values.last.to_f
    @finalPricePercDiff = ((finalPriceValue - initialPriceValue)/initialPriceValue )*100
    # PortfolioSnapshot.where({ :created_at => (first..second) }).group_by_minute(:created_at).maximum(:closeOutValue).fetch("Fri, 16 Dec 2022 01:34:00")
    #..@end_date
    #.group_by_minute(:created_at).maximum(:closeOutValue)
    # (finalValue - initialValue)/initialValue
    render({ :template => "main_interface/homepage.html.erb" })
  end



  def home 
    #call the database and plot
    num = PortfolioSnapshot.all.last.closeOutValue * 0.9
    @minCloseOut = num
    @minEthPrice = PortfolioSnapshot.all.last.ethPrice * 0.9
    
    @shortStart_date = 1.hour.ago
    @start_date= 25.days.ago
    @end_date = DateTime.now

    @feesEarned = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:totalFeesValue_0)
    @minimumFeesNeeded = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:maxLossValue)
    @feeChart = [{label: "series1" , data:@feesEarned} , {label:"series2" , data:@minimumFeesNeeded, fill: true}]

    @priceChart = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:ethPrice)
    @shortPriceChart = PortfolioSnapshot.where({ :created_at => (@shortStart_date..@end_date) }).group_by_minute(:created_at).maximum(:ethPrice)
    @lowerTickChart = PortfolioSnapshot.where({ :created_at => (@shortStart_date..@end_date) }).group_by_minute(:created_at).maximum(:lowerTick_token0)
    @upperTickChart = PortfolioSnapshot.where({ :created_at => (@shortStart_date..@end_date) }).group_by_minute(:created_at).maximum(:upperTick_token0)
    @comboPriceChart = [{label:"underlying", data:@shortPriceChart } , {label:"lowerTick", data:@lowerTickChart,borderDash: [5, 5] }, {label:"upperTick", data:@upperTickChart , borderDash: [5, 5]}]

    @feeAccrualRate_chart = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:feeAccrualRate)
    @onChainVolatility_chart = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:OnChainVolatility)
    @avgDailyVolume_token0_chart = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:avgDailyVolumeToken0)
    @activeTickLiq_chart = PortfolioSnapshot.where({ :created_at => (@start_date..@end_date) }).group_by_minute(:created_at).maximum(:ActiveTickLiquidityAmount0)

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

  instance.desiredRangeSpacing = firstVar.fetch("desiredRangeSpacing")
  instance.maxLossDecimalPerc = firstVar.fetch("maxLossDecimalPerc")
  instance.maxLossValue = -1*firstVar.fetch("maxLossValue").to_f

  instance.feeAccrualRate = firstVar.fetch("feeAccrualRate")
  instance.ActiveTickLiquidityAmount0 = firstVar.fetch("ActiveTickLiq")
  instance.avgDailyVolumeToken0 = firstVar.fetch("avgDailyVolume")
  instance.OnChainVolatility = firstVar.fetch("OnChainVolatility")
  

  instance.save
  end

  def gasPriceWrite
    var = params.fetch("gas_variable")

    gasInstance = GasPrice.new
    gasInstance.gasUsed = var.fetch("gasUsed")
    gasInstance.gasPrice = var.fetch("gasPrice")
    gasInstance.gasCost = var.fetch("gasCost")

    gasInstance.save
  end
  

  

  



end
