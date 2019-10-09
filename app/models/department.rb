class Department < ApplicationRecord
  def course
    Course.where({ :department_id => self.id}).first 
  end
end
