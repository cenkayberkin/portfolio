require "test_helper"

class ContactsControllerTest < ActionController::TestCase

  def contact
    @contact ||= contacts :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Contact.count') do
      post :create, contact: { email: @contact.email, message: @contact.message, name: @contact.name }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  def test_show
    get :show, id: contact
    assert_response :success
  end

  def test_edit
    get :edit, id: contact
    assert_response :success
  end

  def test_update
    put :update, id: contact, contact: { email: @contact.email, message: @contact.message, name: @contact.name }
    assert_redirected_to contact_path(assigns(:contact))
  end

  def test_destroy
    assert_difference('Contact.count', -1) do
      delete :destroy, id: contact
    end

    assert_redirected_to contacts_path
  end
end
