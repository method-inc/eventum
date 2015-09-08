require "spec_helper"

RSpec.describe Eventum do
  attributes = described_class.config_props
  after(:example) { described_class.reset! }

  describe ".new" do
    it { expect(subject.new).to be_a Eventum::Client }
    it { expect { |b| subject.new(&b) }.to yield_control.once }
    it { expect { |b| subject.new(&b) }.to yield_with_args(Eventum::Client) }

    context "when a configuration block is given" do
      attributes.each do |attr|
        it "modifies the default value for #{attr}" do
          client = subject.new { |config| config.send("#{attr}=", attr) }
          expect(client.send("#{attr}")).to eq attr
        end
      end
    end

    context "when no configuration block is given" do
      attributes.each do |attr|
        it "uses the Eventum module #{attr} as default" do
          subject.send("#{attr}=", attr)
          client = subject.new
          expect(client.send("#{attr}")).to eq subject.send("#{attr}")
        end
      end
    end
  end

  describe ".configure" do
    it { expect { |b| subject.configure(&b) }.to yield_control.once }
    it { expect { |b| subject.configure(&b) }.to yield_with_args(subject) }
  end

  describe "#streams" do
    it { expect(subject.streams).to be_a Eventum::Client::Streams }
  end

  describe "#events" do
    it { expect(subject.events).to be_a Eventum::Client::Events }
  end

  describe "::VERSION" do
    subject { described_class::VERSION }

    it { is_expected.to_not be_nil }
    it { is_expected.to be_frozen }
    it { is_expected.to be_a String }
    it { is_expected.to match(/^\d+\.\d+\.\d+$/) }
  end
end
