require "spec_helper"

RSpec.describe Eventum::Client do
  attributes = described_class.new.config_props

  describe ".new" do
    subject { described_class }

    it { expect(subject.new).to be_a subject }
    it { expect { |b| subject.new(&b) }.to yield_control.once }
    it { expect { |b| subject.new(&b) }.to yield_with_args(subject) }

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
        it "uses #{attr} default value" do
          client = subject.new
          expect(client.send("#{attr}")).to_not be_nil
        end
      end
    end
  end

  describe "#configure" do
    it { expect { |b| subject.configure(&b) }.to yield_control.once }
    it { expect { |b| subject.configure(&b) }.to yield_with_args(subject) }
  end

  describe "#streams" do
    it { expect(subject.streams).to be_a Eventum::Client::Streams }
  end

  describe "#events" do
    it { expect(subject.events).to be_a Eventum::Client::Events }
  end
end
