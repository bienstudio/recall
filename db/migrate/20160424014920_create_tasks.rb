class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string   :text
      t.datetime :due
      t.boolean  :completed, default: false

      t.references :user
      t.references :project
      t.references :course

      t.timestamps
    end
  end
end
