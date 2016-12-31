require 'test_helper'

class FormulariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get formularios_index_url
    assert_response :success
  end

  test "should get quienes_somos" do
    get formularios_quienes_somos_url
    assert_response :success
  end

  test "should get contacto" do
    get formularios_contacto_url
    assert_response :success
  end

  test "should get servicios" do
    get formularios_servicios_url
    assert_response :success
  end

  test "should get localizacion" do
    get formularios_localizacion_url
    assert_response :success
  end

end
