json.array!(@tipo_consultorios) do |tipo_consultorio|
  json.extract! tipo_consultorio, :id, :nombre
  json.url tipo_consultorio_url(tipo_consultorio, format: :json)
end
