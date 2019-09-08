class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :nombres
      t.string :apellidos
      t.integer :documento
      t.string :celular
      t.references :tipo_medico, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
