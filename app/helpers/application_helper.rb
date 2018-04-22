module ApplicationHelper
  $global_counter = 0;

  def global_counter_assign(counter)
    $global_counter = counter >= 0 ? counter : 0;
  end

  def global_counter_add
    $global_counter += 1
  end

  def full_title(page_title = '')
    base_title = "Husaria Race Team"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
