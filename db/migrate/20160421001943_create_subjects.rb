class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.references :user

      t.timestamps
    end
  end
end
