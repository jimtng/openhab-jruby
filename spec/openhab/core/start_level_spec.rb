# frozen_string_literal: true

require "spec_helper"

RSpec.describe OpenHAB::Core::StartLevel do
  subject(:start_level) { described_class.new(level) }

  let(:level) { :things }

  describe ".new" do
    context "when initialized with a valid symbol" do
      let(:level) { :things }

      it "resolves to the correct integer value" do
        expect(start_level.to_i).to eq(80)
      end
    end

    context "when initialized with an integer" do
      let(:level) { 80 }

      it "stores the integer directly" do
        expect(start_level.to_i).to eq(80)
      end
    end

    context "when initialized with another StartLevel instance" do
      let(:level) { described_class.new(:things) }

      it "extracts the integer value" do
        expect(start_level.to_i).to eq(80)
      end
    end

    context "when initialized with an invalid symbol" do
      let(:level) { :unknown_level }

      it "raises an ArgumentError" do
        expect { start_level }.to raise_error(ArgumentError, /Invalid start level or symbol/)
      end
    end

    context "when initialized with an unsupported type" do
      let(:level) { "80" }

      it "raises an ArgumentError" do
        expect { start_level }.to raise_error(ArgumentError, /Invalid start level or symbol/)
      end
    end
  end

  describe "#to_sym" do
    it "returns the corresponding symbol for mapped integers" do
      expect(described_class.new(80).to_sym).to eq(:things)
    end

    it "returns nil for unmapped integers" do
      expect(described_class.new(45).to_sym).to be_nil
    end
  end

  describe "#to_int and #to_i" do
    it "returns the integer representation" do
      sl = described_class.new(:things)
      expect(sl.to_i).to eq(80)
      expect(sl.to_int).to eq(80)
    end
  end

  describe "comparisons (<, <=, ==, >=, >)" do
    let(:start_level) { described_class.new(:things) } # 80

    it "compares against Symbols" do
      expect(start_level).to eq(:things)
      expect(start_level).to be > :ui
      expect(start_level).to be < :complete
    end

    it "compares against Integers" do
      expect(start_level).to eq(80)
      expect(start_level).to be > 70
      expect(start_level).to be < 100
    end

    it "compares against another StartLevel instance" do
      ui_level = described_class.new(:ui)
      expect(start_level).to be > ui_level
    end
  end

  describe "math operations & coercion" do
    let(:start_level) { described_class.new(:things) } # 80

    it "supports right-hand arithmetic operations with integers" do
      expect(100 - start_level).to eq(20)
    end

    it "supports left-hand arithmetic operations with integers" do
      expect(start_level + 10).to eq(90)
    end
  end

  describe "formatting (#to_s, #inspect)" do
    it "formats mapped levels with symbol and integer" do
      sl = described_class.new(:things)
      expect(sl.to_s).to eq("things (80)")
      expect(sl.inspect).to eq(":things (80)")
    end

    it "formats unmapped levels with integer only" do
      sl = described_class.new(45)
      expect(sl.to_s).to eq("45")
      expect(sl.inspect).to eq("45")
    end
  end
end
