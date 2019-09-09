class Consultorio < ActiveRecord::Base
  belongs_to :tipo_consultorio
  
  validates :nombre, presence: true
  validates :codigo, presence: true
  validates :ubicacion, presence: true
  validates :tipo_consultorio_id, presence: true

  public def validSave
    @tipo_consultorio_id = self.tipo_consultorio_id
    begin 
      @tipo_consultorio = TipoConsultorio.find(@tipo_consultorio_id)
    rescue  ActiveRecord::RecordNotFound => e
      return false
    end
    return self.save
  end


end
