require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:karol)
  end

  test "invalid signup information" do
    get log_in_as(@user)
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         surname: "surname",
                                         email: "user@invalid",
                                         sex: "K",
                                         password:              "short",
                                         password_confirmation: "long" } }
    end

    assert_template 'users/new'
  end

  test "valid signup information" do
    get log_in_as(@user)
    get signup_path

    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Karol",
                                         surname: "surname",
                                         email: "Karol@example.pl",
                                         sex: "M",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end

    follow_redirect!
    assert_template 'users/edit'
    assert is_logged_in?
  end
end
