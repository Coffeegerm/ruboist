class TodoItem < ApplicationRecord
  validates_presence_of :title

  def is_complete?
    completed_date.present?
  end
end
