class CreateCita < ActiveRecord::Migration
  def change
    create_table :cita do |t|
      t.references :consultorio, index: true, foreign_key: true
      t.references :paciente, index: true, foreign_key: true
      t.references :medico, index: true, foreign_key: true
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_fin
      t.string :motivo

      t.timestamps null: false
    end
  end
end
