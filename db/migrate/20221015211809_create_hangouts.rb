class CreateHangouts < ActiveRecord::Migration[7.0]
  def change
    create_table :hangouts do |t|
      t.string :host
      t.string :participants, array:true, default:[]
      t.string :title
      t.string :what
      t.string :why
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
