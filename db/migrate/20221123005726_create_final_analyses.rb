class CreateFinalAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :final_analyses do |t|
      t.string :final_dataset

      t.timestamps
    end
  end
end
