require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  it "is_complete? when completed_date is not nil" do
    todo_item = TodoItem.new(completed_date: Time.now)
    expect(todo_item.is_complete?).to eq(true)
  end

  it "is not complete when completed_date is nil" do
    todo_item = TodoItem.new(completed_date: nil)
    expect(todo_item.is_complete?).to eq(false)
  end

  it "validates title" do
    todo_item = TodoItem.new(title: "Test")
    expect(todo_item.valid?).to eq(true)
  end
end
