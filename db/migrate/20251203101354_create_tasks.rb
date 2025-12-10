class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :will_do
      t.boolean :is_continuous, default: false
      t.timestamps
    end
  end
end
