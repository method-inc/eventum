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
  end

  describe "::API_PATH" do
    subject { described_class::API_PATH }

    it { is_expected.to_not be_nil }
    it { is_expected.to be_a String }
    it { is_expected.to be_frozen }
  end
end
