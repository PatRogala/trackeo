require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:deadline) }
  end

  describe 'callbacks' do
    it 'sets default value of completed to false' do
      task = Task.new
      task.valid?
      expect(task.completed).to eq(false)
    end
  end

  describe 'scopes' do
    describe '::for_date' do
      it 'returns tasks for given date' do
        task = Task.create!(title: 'Task 1', description: 'Description 1', deadline: Date.today)
        expect(Task.for_date(Date.today)).to eq([task])
      end
    end
  end
end
