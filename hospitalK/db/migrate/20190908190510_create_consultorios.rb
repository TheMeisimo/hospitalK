class CreateConsultorios < ActiveRecord::Migration
  def change
    create_table :consultorios do |t|
      t.string :nombre
      t.integer :codigo
      t.string :ubicacion
      t.references :tipo_consultorio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
