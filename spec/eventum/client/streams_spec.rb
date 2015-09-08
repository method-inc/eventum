require "spec_helper"

RSpec.describe Eventum::Client::Streams do
  describe "#find" do
    subject do
      VCR.use_cassette(cassette, match_requests_on: %i(method path)) do
        described_class.new(client).find(stream)
      end
    end

    let(:body) { JSON.parse(subject.body, symbolize_names: true) }
    let(:client) { Eventum::Client.new }
    let(:cassette) { "streams/find_success" }
    let(:stream) { "awesomeness" }

    it { is_expected.to_not be_nil }
    it { expect(subject.status).to eq 200 }
    it { expect(body).to_not be_nil }
    it { expect(body.key? :streamId).to be_truthy }
    it { expect(body.fetch :streamId).to eq stream }
    it { expect(body.key? :entries).to be_truthy }
  end

  describe "::API_PATH" do
    subject { described_class::API_PATH }

    it { is_expected.to_not be_nil }
    it { is_expected.to be_a String }
    it { is_expected.to be_frozen }
  end
end
