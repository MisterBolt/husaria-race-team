class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start
      t.datetime :end
      t.string :link

      t.timestamps
    end
  end
end
