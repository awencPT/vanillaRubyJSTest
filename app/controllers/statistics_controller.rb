class StatisticsController < ActionController::Base

  def home 
    render({ :template => "statistics_interface/statsPage.html.erb" })
  end

  def display_stats
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
    render({ :template => "statistics_interface/statsPage.html.erb" })
  end


end
