class Paciente < ActiveRecord::Base
    validates :nombres,          presence: true
    validates :apellidos,        presence: true
    validates :documento,        presence: true
    validates :fecha_nacimiento, presence: true
end
