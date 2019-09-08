json.array!(@consultorios) do |consultorio|
  json.extract! consultorio, :id, :nombre, :codigo, :ubicacion, :tipo_consultorio_id
  json.url consultorio_url(consultorio, format: :json)
end
