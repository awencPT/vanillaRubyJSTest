class AddPoolRates < ActiveRecord::Migration[6.1]
  def change

    add_column :portfolio_snapshots, :feeAccrualRate, :string
    add_column :portfolio_snapshots, :ActiveTickLiquidityAmount0, :string
    add_column :portfolio_snapshots, :avgDailyVolumeToken0, :string
    add_column :portfolio_snapshots, :OnChainVolatility, :string



  end
end
