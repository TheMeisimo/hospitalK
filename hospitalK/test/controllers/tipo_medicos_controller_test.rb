require 'test_helper'

class TipoMedicosControllerTest < ActionController::TestCase
  setup do
    @tipo_medico = tipo_medicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_medicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_medico" do
    assert_difference('TipoMedico.count') do
      post :create, tipo_medico: { nombre: @tipo_medico.nombre }
    end

    assert_redirected_to tipo_medico_path(assigns(:tipo_medico))
  end

  test "should show tipo_medico" do
    get :show, id: @tipo_medico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_medico
    assert_response :success
  end

  test "should update tipo_medico" do
    patch :update, id: @tipo_medico, tipo_medico: { nombre: @tipo_medico.nombre }
    assert_redirected_to tipo_medico_path(assigns(:tipo_medico))
  end

  test "should destroy tipo_medico" do
    assert_difference('TipoMedico.count', -1) do
      delete :destroy, id: @tipo_medico
    end

    assert_redirected_to tipo_medicos_path
  end
end
