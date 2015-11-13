class Task < ActiveRecord::Base
  validates :name, presence: true, format: {with: /\A\w/}, length: {maximum: 140, minimum: 0}
  validates :complete, inclusion: {in: [true, false]}

  # The comments table must have a column called `task_id`
  has_many :comments, foreign_key: :task_id

  # A task has many comments
  # def comments
  #   Comment.where(task_id: self.id)
  # end
end
