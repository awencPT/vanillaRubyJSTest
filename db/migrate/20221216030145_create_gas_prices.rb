class CreateGasPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :gas_prices do |t|
      t.string :gasUsed
      t.string :gasPrice
      t.string :gasCost

      t.timestamps
    end
  end
end
