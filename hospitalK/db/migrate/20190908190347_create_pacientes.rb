class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :nombres
      t.string :apellidos
      t.date :fecha_nacimiento
      t.integer :documento

      t.timestamps null: false
    end
  end
end
