class Todo < ActiveRecord::Base

  def users_name
    x = user_id
    y = User.find_by_id(x)
    y.name
  end

  def category_name
    x = self.id
    y = Category.find_by_id(x)
    y.name
  end
end
