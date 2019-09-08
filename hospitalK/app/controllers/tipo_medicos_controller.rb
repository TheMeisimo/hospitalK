class TipoMedicosController < ApplicationController
  before_action :set_tipo_medico, only: [:show, :edit, :update, :destroy]

  # GET /tipo_medicos
  # GET /tipo_medicos.json
  def index
    @tipo_medicos = TipoMedico.all
  end

  # GET /tipo_medicos/1
  # GET /tipo_medicos/1.json
  def show
  end

  # GET /tipo_medicos/new
  def new
    @tipo_medico = TipoMedico.new
  end

  # GET /tipo_medicos/1/edit
  def edit
  end

  # POST /tipo_medicos
  # POST /tipo_medicos.json
  def create
    @tipo_medico = TipoMedico.new(tipo_medico_params)

    respond_to do |format|
      if @tipo_medico.save
        format.html { redirect_to @tipo_medico, notice: 'Tipo medico was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_medico }
      else
        format.html { render :new }
        format.json { render json: @tipo_medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_medicos/1
  # PATCH/PUT /tipo_medicos/1.json
  def update
    respond_to do |format|
      if @tipo_medico.update(tipo_medico_params)
        format.html { redirect_to @tipo_medico, notice: 'Tipo medico was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_medico }
      else
        format.html { render :edit }
        format.json { render json: @tipo_medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_medicos/1
  # DELETE /tipo_medicos/1.json
  def destroy
    @tipo_medico.destroy
    respond_to do |format|
      format.html { redirect_to tipo_medicos_url, notice: 'Tipo medico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_medico
      @tipo_medico = TipoMedico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_medico_params
      params.require(:tipo_medico).permit(:nombre)
    end
end
