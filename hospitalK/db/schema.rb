# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190908191729) do

  create_table "cita", force: :cascade do |t|
    t.integer  "consultorio_id"
    t.integer  "paciente_id"
    t.integer  "medico_id"
    t.date     "fecha"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.string   "motivo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "cita", ["consultorio_id"], name: "index_cita_on_consultorio_id"
  add_index "cita", ["medico_id"], name: "index_cita_on_medico_id"
  add_index "cita", ["paciente_id"], name: "index_cita_on_paciente_id"

  create_table "consultorios", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "codigo"
    t.string   "ubicacion"
    t.integer  "tipo_consultorio_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "consultorios", ["tipo_consultorio_id"], name: "index_consultorios_on_tipo_consultorio_id"

  create_table "medicos", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "documento"
    t.string   "celular"
    t.integer  "tipo_medico_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "medicos", ["tipo_medico_id"], name: "index_medicos_on_tipo_medico_id"

  create_table "pacientes", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.date     "fecha_nacimiento"
    t.integer  "documento"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tipo_consultorios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_medicos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
