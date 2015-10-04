require "spec_helper"

RSpec.describe Eventum::Client::Events do
  describe "#find" do
    subject do
      VCR.use_cassette(cassette, match_requests_on: %i(method path)) do
        described_class.new(client).find(stream, event)
      end
    end

    let(:body) { JSON.parse(subject.body, symbolize_names: true) }
    let(:client) { Eventum::Client.new }
    let(:cassette) { "events/find_success" }
    let(:stream) { "awesomeness" }
    let(:event) { "0" }

    it { is_expected.to_not be_nil }
    it { expect(subject.status).to eq 200 }
    it { expect(body).to_not be_nil }

    context "when the event doesn't exist" do
      let(:cassette) { "events/find_not_found" }
      let(:event) { "1000" }

      it { is_expected.to_not be_nil }
      it { expect(subject.status).to eq 404 }
      it { expect(subject.body).to_not be_nil }
    end

    context "when the event number is invalid" do
      let(:cassette) { "events/find_invalid_number" }
      let(:event) { "X" }

      it { is_expected.to_not be_nil }
      it { expect(subject.status).to eq 400 }
      it { expect(subject.body).to_not be_nil }
    end
  end

  describe "#create" do
    subject do
      VCR.use_cassette(cassette, match_requests_on: %i(method path)) do
        described_class.new(client).create(
          stream, type: event_type, body: event_data
        )
      end
    end

    let(:body) { JSON.parse(subject.body, symbolize_names: true) }
    let(:client) { Eventum::Client.new }
    let(:cassette) { "events/create_success" }
    let(:stream) { "awesomeness" }
    let(:event_type) { "testType" }
    let(:event_data) { { msg: "I'm an event" } }

    it { is_expected.to_not be_nil }
    it { expect(subject.status).to eq 201 }

    context "when the event includes nested objects" do
      let(:cassette) { "events/create_nested" }
      let(:event_data) { { title: "Hi World", nested: { msg: "I'm inside" } } }

      it { is_expected.to_not be_nil }
      it { expect(subject.status).to eq 201 }
    end

    context "when no event type is provided" do
      let(:cassette) { "events/create_invalid_type" }
      let(:event_type) { "" }

      it { is_expected.to_not be_nil }
      it { expect(subject.status).to eq 400 }
      it { expect(subject.body).to_not be_nil }
    end
  end

  describe "::API_PATH" do
    subject { described_class::API_PATH }

    it { is_expected.to_not be_nil }
    it { is_expected.to be_a String }
    it { is_expected.to be_frozen }
  end
end
