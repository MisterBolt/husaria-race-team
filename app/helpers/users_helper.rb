module UsersHelper
  $global_counter = 0;

  def global_counter_reset
    $global_counter = 0;
  end

  def global_counter_add
    $global_counter += 1
  end
end
