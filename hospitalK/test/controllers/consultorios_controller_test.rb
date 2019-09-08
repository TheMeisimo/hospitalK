require 'test_helper'

class ConsultoriosControllerTest < ActionController::TestCase
  setup do
    @consultorio = consultorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultorio" do
    assert_difference('Consultorio.count') do
      post :create, consultorio: { codigo: @consultorio.codigo, nombre: @consultorio.nombre, tipo_consultorio_id: @consultorio.tipo_consultorio_id, ubicacion: @consultorio.ubicacion }
    end

    assert_redirected_to consultorio_path(assigns(:consultorio))
  end

  test "should show consultorio" do
    get :show, id: @consultorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consultorio
    assert_response :success
  end

  test "should update consultorio" do
    patch :update, id: @consultorio, consultorio: { codigo: @consultorio.codigo, nombre: @consultorio.nombre, tipo_consultorio_id: @consultorio.tipo_consultorio_id, ubicacion: @consultorio.ubicacion }
    assert_redirected_to consultorio_path(assigns(:consultorio))
  end

  test "should destroy consultorio" do
    assert_difference('Consultorio.count', -1) do
      delete :destroy, id: @consultorio
    end

    assert_redirected_to consultorios_path
  end
end
