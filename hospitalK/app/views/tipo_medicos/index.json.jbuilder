json.array!(@tipo_medicos) do |tipo_medico|
  json.extract! tipo_medico, :id, :nombre
  json.url tipo_medico_url(tipo_medico, format: :json)
end
