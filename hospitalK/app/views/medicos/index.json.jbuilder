json.array!(@medicos) do |medico|
  json.extract! medico, :id, :nombres, :apellidos, :documento, :celular, :tipo_medico_id
  json.url medico_url(medico, format: :json)
end
