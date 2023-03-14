require "rails_helper"

RSpec.describe TasksHelper do
  describe "#get_task_time" do
    it "returns the time of the task" do
      task = Task.new(deadline: Time.zone.parse("2019-01-01 10:00:00"))

      expect(helper.get_task_time(task)).to eq("10:00 AM")
    end
  end

  describe "#task_class" do
    it "returns the class for a completed task" do
      task = Task.new(completed: true)

      expect(helper.task_class(task)).to eq("task-completed")
    end

    it "returns the class for a pending task" do
      task = Task.new(completed: false)

      expect(helper.task_class(task)).to eq("task-pending")
    end
  end
end
