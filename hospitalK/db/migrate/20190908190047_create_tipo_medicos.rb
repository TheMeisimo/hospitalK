class CreateTipoMedicos < ActiveRecord::Migration
  def change
    create_table :tipo_medicos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
