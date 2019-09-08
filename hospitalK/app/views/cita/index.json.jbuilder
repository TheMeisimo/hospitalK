json.array!(@cita) do |citum|
  json.extract! citum, :id, :consultorio_id, :paciente_id, :medico_id, :fecha, :hora_inicio, :hora_fin, :motivo
  json.url citum_url(citum, format: :json)
end
