require "rspec"

RSpec.describe String do
  describe ".strip" do
    context "when invoked on a string with leading spaces" do
      it "returns the string with the leading spaces removed" do
        expect("  hello".strip).to eq("hello")
      end
    end

    context "when invoked on a string with trailing spaces" do
      it "returns the string with the trailing spaces removed" do
        expect("hello   ".strip).to eq("hello")
      end
    end

    context "when invoked on a string with no leading or trailing spaces" do
      it "returns the same string" do
        expect("hello".strip).to eq("hello")
      end
    end
  end
end
