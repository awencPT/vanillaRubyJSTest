class RankerController < ActionController::Base
  skip_before_action :verify_authenticity_token
def poolView 
    #  string = Analysis.all.last.final_analysis
    #  stringSplit =string.gsub("=>",",").split
    #  @allAnalysis = stringSplit[1]

    mostRecentAnalysis_id = FinalAnalysis.all.last.id
    @mostRecentPools =  Pool.all.where({:final_analysis_id => mostRecentAnalysis_id})

    # @ = Position.all.where({:pool_id => mostRecentPools[0].id })

    

  render({ :template => "ranker_interface/view.html.erb" })
end




def write_Analyzer


  var = params.fetch("final_return")
  ## Save whole file to FinalAnalysis and set a new FinalAnalysis Row and ID
  final_analysis_instance = FinalAnalysis.new
  final_analysis_instance.final_dataset = var
  final_analysis_instance.save
  ## Split up the FinalAnalysis into the seperate Pools and save those into the Pools DB, keeping the FinalAnalysis ID tag
  
  var.each do |pool|
    pool_instance = Pool.new
    pool_instance.final_analysis_id = final_analysis_instance.id
    pool_instance.pool_dataset = pool
    pool_instance.save

    pool.each do |position|
      position_instance = Position.new
      position_instance.pool_id = pool_instance.id
      position_instance.T = position.fetch("T")
      position_instance.token0  = position.fetch("token0")
      position_instance.token1= position.fetch("token1")
      position_instance.poolAddress= position.fetch("poolAddress")
      position_instance.feeTier= position.fetch("feeTier")
      position_instance.feeAccrualRate= position.fetch("feeAccrualRate")
      position_instance.ActiveTickLiquidityAmount0= position.fetch("ActiveTickLiquidityAmount0")
      position_instance.yourLiqDeployed= position.fetch("yourLiqDeployed$$")
      position_instance.yourLiqDeployed_Token0= position.fetch("yourLiqDeployed_Token0")
      position_instance.DecimalAdjust= position.fetch("DecimalAdjust")
      position_instance.avgDailyVolumeToken0 = position.fetch("avgDailyVolumeToken0")
      position_instance.avgPeriodTVolumeToken0= position.fetch("avgPeriodTVolumeToken0")
      position_instance.GaussianVolAnnualized= position.fetch("GaussianVolAnnualized")
      position_instance.averageCombinedVolatility= position.fetch("averageCombinedVolatility")
      position_instance.R_gaussS= position.fetch("R_gaussS")
      position_instance.S_gaussS= position.fetch("S_gaussS")
      position_instance.percentOfTick_gaussS= position.fetch("percentOfTick_gaussS")
      position_instance.basicEstReturn_gaussS= position.fetch("basicEstReturn_gaussS")
      position_instance.percentWide_gaussS= position.fetch("percentWide_gaussS")
      position_instance.startTick_gaussS= position.fetch("startTick_gaussS")
      position_instance.endTick_gaussS= position.fetch("endTick_gaussS")
      position_instance.guessMaxLoss_gaussS= position.fetch("guessMaxLoss_gaussS")
      position_instance.guessMaxGain_gaussS= position.fetch("guessMaxGain_gaussS")
      position_instance.minimumLiquidToBreakEven_NO_Hedged_gaussS= position.fetch("minimumLiquidToBreakEven_NO_Hedged_gaussS")
      position_instance.minimumLiquidToBreakEven_YES_Hedged_gaussS= position.fetch("minimumLiquidToBreakEven_YES_Hedged_gaussS")
      position_instance.percentEstReturn_gaussS= position.fetch("percentEstReturn_gaussS")
      position_instance.numberOfTicks= position.fetch("numberOfTicks")
      position_instance.N= position.fetch("N")
      position_instance.percentOfActiveLiqToBreakEven_YES_HEDGE_gaussS= position.fetch("percentOfActiveLiqToBreakEven_YES_HEDGE_gaussS")
      position_instance.percentOfActiveLiqToBreakEven_NO_HEDGE_gaussS= position.fetch("percentOfActiveLiqToBreakEven_NO_HEDGE_gaussS")
      position_instance.stableCoin= position.fetch("stableCoin")

      position_instance.save

    end

  end


  # analysis_instance = Analysis.new
  # analysis_instance.final_analysis = params.fetch("final_return").gsub("\n","").split
  # analysis_instance.save

# position_instance = Position.new
# position_instance.T = var.fetch("T")
# instance.token0  = var.fetch("token0")
# instance.token1= var.fetch("token1")
# instance.poolAddress= var.fetch("poolAddress")
# instance.feeTier= var.fetch("feeTier")
# instance.feeAccrualRate= var.fetch("feeAccrualRate")
# instance.ActiveTickLiquidityAmount0= var.fetch("ActiveTickLiquidityAmount0")
# instance.yourLiqDeployed= var.fetch("yourLiqDeployed$$")
# instance.yourLiqDeployed_Token0= var.fetch("yourLiqDeployed_Token0")
# instance.DecimalAdjust= var.fetch("DecimalAdjust")
# instance.avgDailyVolumeToken0 = var.fetch("avgDailyVolumeToken0")
# instance.avgPeriodTVolumeToken0= var.fetch("avgPeriodTVolumeToken0")
# instance.GaussianVolAnnualized= var.fetch("GaussianVolAnnualized")
# instance.averageCombinedVolatility= var.fetch("averageCombinedVolatility")
# instance.R_gaussS= var.fetch("R_gaussS")
# instance.S_gaussS= var.fetch("S_gaussS")
# instance.percentOfTick_gaussS= var.fetch("percentOfTick_gaussS")
# instance.basicEstReturn_gaussS= var.fetch("basicEstReturn_gaussS")
# instance.percentWide_gaussS= var.fetch("percentWide_gaussS")
# instance.startTick_gaussS= var.fetch("startTick_gaussS")
# instance.endTick_gaussS= var.fetch("endTick_gaussS")
# instance.guessMaxLoss_gaussS= var.fetch("guessMaxLoss_gaussS")
# instance.guessMaxGain_gaussS= var.fetch("guessMaxGain_gaussS")
# instance.minimumLiquidToBreakEven_NO_Hedged_gaussS= var.fetch("minimumLiquidToBreakEven_NO_Hedged_gaussS")
# instance.minimumLiquidToBreakEven_YES_Hedged_gaussS= var.fetch("minimumLiquidToBreakEven_YES_Hedged_gaussS")
# instance.percentEstReturn_gaussS= var.fetch("percentEstReturn_gaussS")
# instance.numberOfTicks= var.fetch("numberOfTicks")
# instance.N= var.fetch("N")
# instance.percentOfActiveLiqToBreakEven_YES_HEDGE_gaussS= var.fetch("percentOfActiveLiqToBreakEven_YES_HEDGE_gaussS")
# instance.percentOfActiveLiqToBreakEven_NO_HEDGE_gaussS= var.fetch("percentOfActiveLiqToBreakEven_NO_HEDGE_gaussS")
# instance.stableCoin= var.fetch("stableCoin")

# instance.save
end
end
