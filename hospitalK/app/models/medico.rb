class Medico < ActiveRecord::Base
  belongs_to :tipo_medico

  validates :nombres,        presence: true
  validates :apellidos,      presence: true
  validates :documento,      presence: true
  validates :documento,      presence: true
  validates :celular,        presence: true
  validates :tipo_medico_id, presence: true
end
