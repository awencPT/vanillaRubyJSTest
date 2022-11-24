class CreatePools < ActiveRecord::Migration[6.1]
  def change
    create_table :pools do |t|
      t.string :final_analysis_id
      t.string :pool_dataset

      t.timestamps
    end
  end
end
