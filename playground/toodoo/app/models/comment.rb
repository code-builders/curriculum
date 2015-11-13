class Comment < ActiveRecord::Base

  belongs_to :task

  # A comment belongs to one task
  # def task
  #   Task.find(self.task_id)
  # end
end
