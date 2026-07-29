# frozen_string_literal: true

require "spec_helper"

RSpec.describe OpenHAB::Core do
  describe ".startlevel" do
    let(:service) { instance_double(org.openhab.core.service.StartLevelService, start_level: 80) }

    before do
      allow(OSGi).to receive(:get_service)
        .with("org.openhab.core.service.StartLevelService")
        .and_return(service)
    end

    it "returns a StartLevel instance" do
      expect(described_class.startlevel).to be_a(OpenHAB::Core::StartLevel)
    end

    it "wraps the service's start level correctly" do
      expect(described_class.startlevel).to eq(:things)
      expect(described_class.startlevel.to_i).to eq(80)
    end
  end
end
