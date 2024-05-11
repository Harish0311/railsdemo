require "test_helper"

class AdminControllerTest < ActionController::TestCase
  test 'should create rocket' do
    sign_in

    post :post_create, params: {
      rocket: {
        Name: 'Rocket Name',
        Price: 10,
        description: 'Rocket Description',
        Image: 'rocket.jpg'
      }
    }

    assert_redirected_to root_path
    assert_equal 'Rocket was successfully created.', flash[:notice]
  end


  test 'should create a rocket model' do
    sign_in

    get :create
    assert_response :success
  end

  test 'should not create a rocket ' do
    sign_in
    post :post_create, params: {
      rocket: {
      Name: 'Rocket Name',
      Price: -1,
      description: 'Rocket Description',
      Image: 'rocket.jpg'
      }
    }

    assert_equal "Rocket creation failed.", flash[:alert]
  end

  test 'should get edit' do
    sign_in
    rocket = rockets(:one)
    get :edit, params: {id: rocket.id}
    assert_response :success

  end
end
