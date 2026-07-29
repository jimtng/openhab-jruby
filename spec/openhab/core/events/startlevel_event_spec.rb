# frozen_string_literal: true

require "spec_helper"

RSpec.describe OpenHAB::Core::Events::StartlevelEvent do
  subject(:event) { described_class.new }

  before do
    allow(event).to receive(:get_startlevel).and_return(80)
  end

  describe "#startlevel" do
    it "returns a StartLevel instance" do
      expect(event.startlevel).to be_a(OpenHAB::Core::StartLevel)
    end

    it "coerces the integer into a StartLevel value object" do
      expect(event.startlevel).to eq(:things)
      expect(event.startlevel.to_i).to eq(80)
    end
  end
end
