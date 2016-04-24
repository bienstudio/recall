class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string   :name
      t.string   :notes
      t.datetime :due

      t.references :user
      t.references :course

      t.timestamps
    end
  end
end
