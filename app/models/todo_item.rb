class TodoItem < ApplicationRecord
  validates_presence_of :title

  def mark_complete!
    self.completed_date = Time.now
  end

  def mark_incomplete!
    self.completed_date = nil
  end

  def is_complete?
    self.completed_date.present?
  end
end
