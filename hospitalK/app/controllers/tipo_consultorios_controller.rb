class TipoConsultoriosController < ApplicationController
  before_action :set_tipo_consultorio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_consultorios
  # GET /tipo_consultorios.json
  def index
    @tipo_consultorios = TipoConsultorio.all
  end

  # GET /tipo_consultorios/1
  # GET /tipo_consultorios/1.json
  def show
  end

  # GET /tipo_consultorios/new
  def new
    @tipo_consultorio = TipoConsultorio.new
  end

  # GET /tipo_consultorios/1/edit
  def edit
  end

  # POST /tipo_consultorios
  # POST /tipo_consultorios.json
  def create
    @tipo_consultorio = TipoConsultorio.new(tipo_consultorio_params)

    respond_to do |format|
      if @tipo_consultorio.save
        format.html { redirect_to @tipo_consultorio, notice: 'Tipo consultorio was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_consultorio }
      else
        format.html { render :new }
        format.json { render json: @tipo_consultorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_consultorios/1
  # PATCH/PUT /tipo_consultorios/1.json
  def update
    respond_to do |format|
      if @tipo_consultorio.update(tipo_consultorio_params)
        format.html { redirect_to @tipo_consultorio, notice: 'Tipo consultorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_consultorio }
      else
        format.html { render :edit }
        format.json { render json: @tipo_consultorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_consultorios/1
  # DELETE /tipo_consultorios/1.json
  def destroy
    @tipo_consultorio.destroy
    respond_to do |format|
      format.html { redirect_to tipo_consultorios_url, notice: 'Tipo consultorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_consultorio
      @tipo_consultorio = TipoConsultorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_consultorio_params
      params.require(:tipo_consultorio).permit(:nombre)
    end
end
