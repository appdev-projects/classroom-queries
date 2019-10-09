class Department < ApplicationRecord
  def courses
    Course.where({ :department_id => self.id})
  end
end
