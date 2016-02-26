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
    x = todo_creator
    y = User.find_by_id(x)
    y.name
  end

  def assign_todo(user_id)
    user_id.each do |assign|
      assign = Todo.new
     
  end

end
