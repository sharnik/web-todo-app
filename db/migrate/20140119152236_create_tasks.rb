class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :completed_at

      t.timestamps
    end
  end
end
