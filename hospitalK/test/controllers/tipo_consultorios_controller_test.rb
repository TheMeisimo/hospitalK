require 'test_helper'

class TipoConsultoriosControllerTest < ActionController::TestCase
  setup do
    @tipo_consultorio = tipo_consultorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_consultorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_consultorio" do
    assert_difference('TipoConsultorio.count') do
      post :create, tipo_consultorio: { nombre: @tipo_consultorio.nombre }
    end

    assert_redirected_to tipo_consultorio_path(assigns(:tipo_consultorio))
  end

  test "should show tipo_consultorio" do
    get :show, id: @tipo_consultorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_consultorio
    assert_response :success
  end

  test "should update tipo_consultorio" do
    patch :update, id: @tipo_consultorio, tipo_consultorio: { nombre: @tipo_consultorio.nombre }
    assert_redirected_to tipo_consultorio_path(assigns(:tipo_consultorio))
  end

  test "should destroy tipo_consultorio" do
    assert_difference('TipoConsultorio.count', -1) do
      delete :destroy, id: @tipo_consultorio
    end

    assert_redirected_to tipo_consultorios_path
  end
end
