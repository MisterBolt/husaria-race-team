require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:karol)
    @non_admin = users(:bartek)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.pagination'
    first_page_of_users = User.order(:surname).paginate(page: 1, per_page: 20)
    first_page_of_users.each do |user|
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), count: 3
      else
        assert_select 'a[href=?]', user_path(user), count: 2
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end