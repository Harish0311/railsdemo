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
end
