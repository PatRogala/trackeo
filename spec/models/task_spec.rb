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

    describe "default scope" do
      it "orders tasks by deadline" do
        task2 = described_class.create!(title: "Task 1", description: "Description 1", deadline: Time.zone.today)
        task1 = described_class.create!(title: "Task 2", description: "Description 2",
                                        deadline: Time.zone.today + 1.day)
        expect(described_class.all).to eq([task2, task1])
      end
    end
  end

  describe "Public instance methods" do
    describe "#toggle!" do
      it "toggles completed attribute" do
        task = described_class.create!(title: "Task 1", description: "Description 1", deadline: Time.zone.today)
        task.toggle!
        expect(task.completed).to be(true)
      end
    end
  end
end
