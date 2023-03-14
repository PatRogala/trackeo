require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'GET /index' do
    context 'when date is not provided' do
      it 'returns today\'s tasks' do
        task = Task.create!(title: 'Task 1', description: 'Description 1', deadline: Date.today)
        get tasks_path
        expect(response.body).to include(task.title)
      end
    end

    context 'when date is provided' do
      it 'returns tasks for given date' do
        task = Task.create!(title: 'Task 1', description: 'Description 1', deadline: Date.today - 1.day)
        get tasks_path(date: Date.today - 1.day)
        expect(response.body).to include(task.title)
      end
    end
  end
end
