# frozen_string_literal: true

RSpec.describe Duration do
  it "is constructible from various numbers" do
    expect(5.seconds).to be_a(described_class)
    expect(5.minutes).to be_a(described_class)
    expect(5.hours).to be_a(described_class)
    expect(5.5.seconds).to be_a(described_class)
    expect(5.5.minutes).to be_a(described_class)
    expect(5.5.hours).to be_a(described_class)
  end

  it "is comparable to numeric" do
    expect(5.seconds).to eq 5
    expect(5.seconds).to eq 5
  end

  describe "math operations" do
    describe "additions and subtractions" do
      it "works with other Durations" do
        expect(1.hour + 5.minutes).to eql 65.minutes
        expect(1.hour - 5.minutes).to eql 55.minutes
      end

      it "works with Period" do
        expect(5.hours + Period.of_days(1)).to eql 29.hours
        expect(25.hours - Period.of_days(1)).to eql 1.hours
        expect(Period.of_days(1) + 5.hours).to eql 29.hours
        expect(Period.of_days(1) - 5.hours).to eql 19.hours
      end

      it "works with Numeric" do
        expect(60.seconds + 5).to eql 65.seconds
        expect(5 + 60.seconds).to eql 65.seconds
        expect(60.seconds - 5).to eql 55.seconds
        expect(60 - 5.seconds).to eql 55.seconds
      end

      it "works with Time QuantityType" do
        expect(1.second + QuantityType.new("5 s")).to eql 6.seconds
        expect(5.seconds - QuantityType.new("1 s")).to eql 4.seconds
        expect(QuantityType.new("5 s") + 1.second).to eql QuantityType.new("6 s")
        expect(QuantityType.new("5 s") - 1.second).to eql QuantityType.new("4 s")
      end
    end
  end

  describe "#to_i" do
    it "returns seconds" do
      expect(5.seconds.to_i).to be 5
      expect(1.minute.to_i).to be 60
    end
  end

  describe "#ago" do
    it "works" do
      Timecop.freeze
      now = ZonedDateTime.now
      expect(5.minutes.ago).to eql now - 5.minutes
    end
  end

  describe "#from_now" do
    it "works" do
      Timecop.freeze
      now = ZonedDateTime.now
      expect(5.minutes.from_now).to eql now + 5.minutes
    end
  end

  describe "#between?" do
    it "works with min, max" do
      expect(10.seconds.between?(1.second, 1.hour)).to be true
      expect(10.seconds.between?(10.seconds, 1.hour)).to be true
      expect(10.seconds.between?(1.second, 10.seconds)).to be true
      expect(10.seconds.between?(1.second, 5.seconds)).to be false
      expect(10.seconds.between?(1.hour, 2.hours)).to be false
    end

    it "works with range" do
      expect(10.seconds.between?((1.second)..(1.hour))).to be true
      expect(10.seconds.between?((1.second)..(10.seconds))).to be true
      expect(10.seconds.between?((1.second)...(10.seconds))).to be false
      expect(10.seconds.between?((1.second)..)).to be true
    end
  end
end
