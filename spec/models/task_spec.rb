require "rails_helper"

RSpec.describe Task do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:deadline) }
  end

  describe "callbacks" do
    it "sets default value of completed to false" do
      task = described_class.new
      task.valid?
      expect(task.completed).to be(false)
    end
  end

  describe "scopes" do
    describe "::for_date" do
      it "returns tasks for given date" do
        task = described_class.create!(title: "Task 1", description: "Description 1", deadline: Time.zone.today)
        expect(described_class.for_date(Time.zone.today)).to eq([task])
      end
    end
  end
end
