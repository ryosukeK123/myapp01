class CreateContinuousTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :continuous_tasks do |t|
      t.references :task, null: false, foreign_key:  true, index: false
      t.integer :current_streak, null: false, default: 0
      t.date :last_checked_date, null: false

      t.timestamps
    end

    add_index :continuous_tasks, :task_id, unique: true
  end
end
