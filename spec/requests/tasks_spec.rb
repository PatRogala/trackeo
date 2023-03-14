require "rails_helper"

RSpec.describe "Tasks" do
  describe "GET /index" do
    context "when date is not provided" do
      it "returns today's tasks" do
        task = Task.create!(title: "Task 1", description: "Description 1", deadline: Time.zone.today)
        get tasks_path
        expect(response.body).to include(task.title)
      end
    end

    context "when date is provided" do
      it "returns tasks for given date" do
        task = Task.create!(title: "Task 1", description: "Description 1", deadline: Time.zone.today - 1.day)
        get tasks_path(date: Time.zone.today - 1.day)
        expect(response.body).to include(task.title)
      end
    end
  end

  describe "PUT /toggle" do
    it "toggles completed attribute" do
      task = Task.create!(title: "Task 1", description: "Description 1", deadline: Time.zone.today)
      put toggle_task_path(task)
      expect(task.reload.completed).to be(true)
    end
  end

  describe "POST /create" do
    it "creates a new task" do
      post tasks_path, params: { task: { title: "Task 1", description: "Description 1", deadline: Time.zone.today } }
      expect(Task.count).to eq(1)
    end

    it "renders new template when task is invalid" do
      post tasks_path, params: { task: { title: "", description: "Description 1", deadline: Time.zone.today } }
      expect(response).to render_template(:new)
    end
  end

  describe "GET /new" do
    it "renders new template" do
      get new_task_path
      expect(response).to render_template(:new)
    end
  end
end
