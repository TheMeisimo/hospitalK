class Citum < ActiveRecord::Base
  belongs_to :consultorio
  belongs_to :paciente
  belongs_to :medico
  
  validates :consultorio_id, presence: true
  validates :paciente_id,    presence: true
  validates :medico_id,      presence: true
  validates :fecha,          presence: true
  validates :hora_inicio,    presence: true
  validates :hora_fin,       presence: true
  validates :motivo,         presence: true

  public def validSave
    @valido = true

    @fecha          = self.fecha.to_s
    @hora_inicio    = self.hora_inicio.to_s
    @hora_fin       = self.hora_fin.to_s
    @consultorio_id = self.consultorio_id.to_s
    @paciente_id    = self.paciente_id.to_s
    @medico_id      = self.medico_id.to_s

    @flag_consultorio_ocupado = Citum.exists?(['fecha = ? 
                                          AND ( 
                                                ( hora_inicio <= ? AND ? <= hora_fin ) 
                                            OR  ( hora_inicio <= ? AND ? <= hora_fin ) 
                                            )
                                          AND consultorio_id = ?', @fecha, @hora_inicio, @hora_inicio, @hora_fin, @hora_fin, @consultorio_id
                                        ])
    @flag_paciente_ocupado    = Citum.exists?(['fecha = ? 
                                          AND ( 
                                                ( hora_inicio <= ? AND ? <= hora_fin ) 
                                            OR  ( hora_inicio <= ? AND ? <= hora_fin ) 
                                            )
                                          AND paciente_id = ?', @fecha, @hora_inicio, @hora_inicio, @hora_fin, @hora_fin, @paciente_id
                                        ])
    @flag_medico_ocupado      = Citum.exists?(['fecha = ? 
                                          AND ( 
                                                ( hora_inicio <= ? AND ? <= hora_fin ) 
                                            OR  ( hora_inicio <= ? AND ? <= hora_fin ) 
                                            )
                                          AND medico_id = ?', @fecha, @hora_inicio, @hora_inicio, @hora_fin, @hora_fin, @medico_id
                                        ])
    if @flag_consultorio_ocupado
      @valido = false
      print "flag_consultorio_ocupado\n"
    end
    if @flag_paciente_ocupado
      @valido = false
      print "flag_paciente_ocupado\n"
    end
    if @flag_medico_ocupado
      @valido = false
      print "flag_medico_ocupado\n"
    end
    if @valido
      @valido = self.save
    end
    return @valido
  end 
end