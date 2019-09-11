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
    if contraintsCitas
      return self.save
    else
      return false
    end
  end 

  public def validUpdate(citum_params)
    if contraintsCitas
      return self.update(citum_params)
    else
      return false
    end
  end

  private def colisionHoraria( arreglo )
    @flag_colision = false

    @sec_ini = self.hora_inicio.to_i%86400
    @sec_fin = self.hora_fin.to_i%86400

    arreglo.each do |elem|
      @elem_ini = elem.hora_inicio.to_i%86400
      @elem_fin = elem.hora_fin.to_i%86400
      if (((@elem_ini <= @sec_ini) and (@sec_ini <= @elem_fin)) or ((@elem_ini <= @sec_fin) and (@sec_fin <= @elem_fin)) or ((@sec_ini <= @elem_ini ) and ( @elem_ini <= @sec_fin)) or ((@sec_ini <= @elem_fin) and (@elem_fin <= @sec_fin)))
        @flag_colision = true
      end
    end
    return @flag_colision
  end

  private def contraintsCitas
    @valido = true

    @fecha          = self.fecha
    @hora_inicio    = self.hora_inicio
    @hora_fin       = self.hora_fin
    @consultorio_id = self.consultorio_id
    @paciente_id    = self.paciente_id
    @medico_id      = self.medico_id

    if @hora_fin <= @hora_inicio
      @valido = false
    else 
      @horarios_consultorio = Citum.where(['fecha = ? AND consultorio_id = ?', @fecha, @consultorio_id])
      @horarios_paciente    = Citum.where(['fecha = ? AND paciente_id = ?', @fecha, @paciente_id])
      @horarios_medico      = Citum.where(['fecha = ? AND medico_id = ?', @fecha, @medico_id])

      @flag_consultorio_ocupado = colisionHoraria(@horarios_consultorio)
      @flag_paciente_ocupado    = colisionHoraria(@horarios_paciente)
      @flag_medico_ocupado      = colisionHoraria(@horarios_medico)

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
    end

    return @valido
  end
end