class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.string :name

      t.timestamps
    end
  end
end
