json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :nombres, :apellidos, :fecha_nacimiento, :documento
  json.url paciente_url(paciente, format: :json)
end
