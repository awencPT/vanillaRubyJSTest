# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_16_184823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "final_analyses", force: :cascade do |t|
    t.string "final_dataset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gas_prices", force: :cascade do |t|
    t.string "gasUsed"
    t.string "gasPrice"
    t.string "gasCost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pools", force: :cascade do |t|
    t.string "final_analysis_id"
    t.string "pool_dataset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "portfolio_snapshots", force: :cascade do |t|
    t.string "tokenId"
    t.string "totalFeesValue_0"
    t.string "ethPrice"
    t.string "upperTick_token0"
    t.string "lowerTick_token0"
    t.string "closeOutValue"
    t.string "adjustedInLiquidity"
    t.string "currentLoanAmount_adj"
    t.string "aaveCollateralValue"
    t.string "LTV"
    t.string "healthFactor"
    t.string "adjustGrandTotal"
    t.string "adjustGrandTotalwCollectFees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "desiredRangeSpacing"
    t.string "maxLossDecimalPerc"
    t.string "maxLossValue"
  end

  create_table "positions", force: :cascade do |t|
    t.string "pool_id"
    t.string "T"
    t.string "token0"
    t.string "token1"
    t.string "poolAddress"
    t.string "feeTier"
    t.string "feeAccrualRate"
    t.string "ActiveTickLiquidityAmount0"
    t.string "yourLiqDeployed"
    t.string "yourLiqDeployed_Token0"
    t.string "DecimalAdjust"
    t.string "avgDailyVolumeToken0"
    t.string "avgPeriodTVolumeToken0"
    t.string "GaussianVolAnnualized"
    t.string "averageCombinedVolatility"
    t.string "R_gaussS"
    t.string "S_gaussS"
    t.string "percentOfTick_gaussS"
    t.string "basicEstReturn_gaussS"
    t.string "percentWide_gaussS"
    t.string "startTick_gaussS"
    t.string "endTick_gaussS"
    t.string "guessMaxLoss_gaussS"
    t.string "guessMaxGain_gaussS"
    t.string "minimumLiquidToBreakEven_NO_Hedged_gaussS"
    t.string "minimumLiquidToBreakEven_YES_Hedged_gaussS"
    t.string "percentEstReturn_gaussS"
    t.string "numberOfTicks"
    t.string "N"
    t.string "percentOfActiveLiqToBreakEven_YES_HEDGE_gaussS"
    t.string "percentOfActiveLiqToBreakEven_NO_HEDGE_gaussS"
    t.string "stableCoin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
