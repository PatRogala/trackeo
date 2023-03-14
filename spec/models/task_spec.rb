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
end
