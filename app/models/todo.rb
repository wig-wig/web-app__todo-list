class Todo < ActiveRecord::Base

  def users_name
    x = user_id
    y = User.find_by_id(x)
    y.name
  end

  def category_name
    x = category_id
    y = Category.find_by_id(x)
    y.name
  end

  def creator
    binding.pry
    x = todo_creator
    y = User.find_by_id(x)
    binding.pry
    y.name
  end
end
