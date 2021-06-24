require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:karol)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              surname: "surname",
                                              email: "foo@invalid",
                                              sex: "K",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    assert_equal session[:forwarding_url], edit_user_url(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    surname = "Foooo"
    email = "foo@bar.com"
    sex = "M"
    patch user_path(@user), params: { user: { name:  name,
                                              surname: surname,
                                              email: email,
                                              sex: sex,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal name,  @user.name
    assert_equal surname,  @user.surname
    assert_equal email, @user.email
    assert_equal sex,  @user.sex
  end
end