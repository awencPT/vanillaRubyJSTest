class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :pool_id
      t.string :T
      t.string :token0
      t.string :token1
      t.string :poolAddress
      t.string :feeTier
      t.string :feeAccrualRate
      t.string :ActiveTickLiquidityAmount0
      t.string :yourLiqDeployed
      t.string :yourLiqDeployed_Token0
      t.string :DecimalAdjust
      t.string :avgDailyVolumeToken0
      t.string :avgPeriodTVolumeToken0
      t.string :GaussianVolAnnualized
      t.string :averageCombinedVolatility
      t.string :R_gaussS
      t.string :S_gaussS
      t.string :percentOfTick_gaussS
      t.string :basicEstReturn_gaussS
      t.string :percentWide_gaussS
      t.string :startTick_gaussS
      t.string :endTick_gaussS
      t.string :guessMaxLoss_gaussS
      t.string :guessMaxGain_gaussS
      t.string :minimumLiquidToBreakEven_NO_Hedged_gaussS
      t.string :minimumLiquidToBreakEven_YES_Hedged_gaussS
      t.string :percentEstReturn_gaussS
      t.string :numberOfTicks
      t.string :N
      t.string :percentOfActiveLiqToBreakEven_YES_HEDGE_gaussS
      t.string :percentOfActiveLiqToBreakEven_NO_HEDGE_gaussS
      t.string :stableCoin

      t.timestamps
    end
  end
end
