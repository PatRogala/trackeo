require "rails_helper"

RSpec.describe DateHelper do
  describe "#parse_date_or_get_today" do
    context "when date is not provided" do
      it "returns today" do
        expect(helper.parse_date_or_get_today(nil)).to eq(Time.zone.today)
      end
    end

    context "when date is provided" do
      it "returns date" do
        expect(helper.parse_date_or_get_today("2021-01-01")).to eq(Date.parse("2021-01-01"))
      end
    end
  end
end
