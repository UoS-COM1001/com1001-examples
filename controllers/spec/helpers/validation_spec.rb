RSpec.describe Validation do
  include Validation

  describe "#str_email_address?" do
    context "when str is an email address" do
      it "returns true" do
        expect(str_email_address?("p.mcminn@sheffield.ac.uk")).to be(true)
      end
    end

    context "when str is not an email address" do
      it "returns false" do
        expect(str_digits?("not an email address")).to be(false)
      end
    end
  end

  describe "#str_digits?" do
    context "when str is an integer" do
      it "returns true" do
        expect(str_digits?("10")).to be(true)
      end
    end

    context "when str is a str" do
      it "returns false" do
        expect(str_digits?("not a number")).to be(false)
      end
    end
  end

  describe "#str_length?" do
    context "when str is the given length" do
      it "returns true" do
        expect(str_length?("10", 2)).to be(true)
      end
    end

    context "when str is not the given length" do
      it "returns false" do
        expect(str_length?("1", 2)).to be(false)
      end
    end
  end

  describe "#str_min_length?" do
    context "when str is the min length" do
      it "returns true" do
        expect(str_min_length?("10", 1)).to be(true)
      end
    end

    context "when str is not the min length" do
      it "returns false" do
        expect(str_min_length?("10", 3)).to be(false)
      end
    end
  end

  describe "#str_max_length?" do
    context "when str is the max length" do
      it "returns true" do
        expect(str_max_length?("10", 3)).to be(true)
      end
    end

    context "when str is not the max length" do
      it "returns false" do
        expect(str_max_length?("10", 1)).to be(false)
      end
    end
  end

  describe "#str_uk_telephone?" do
    context "when str is a telephone number" do
      it "returns true" do
        expect(str_uk_telephone?("0114 222 1826")).to be(true)
      end
    end

    context "when str is not an telephone number" do
      it "returns false" do
        expect(str_uk_telephone?("8798789")).to be(false)
      end
    end
  end

  describe "#str_yyyy_mm_dd_date?" do
    context "when str is a valid date" do
      it "returns true" do
        expect(str_yyyy_mm_dd_date?("1978-04-25")).to be(true)
        expect(str_yyyy_mm_dd_date?("1978-4-25")).to be(true)
      end
    end

    context "when str is not a valid date" do
      it "returns false" do
        expect(str_yyyy_mm_dd_date?("not a date")).to be(false)
        expect(str_yyyy_mm_dd_date?("78-04-25")).to be(false)
        expect(str_yyyy_mm_dd_date?("2023/04/31")).to be(false)
        expect(str_yyyy_mm_dd_date?("2023 04 25")).to be(false)
        expect(str_yyyy_mm_dd_date?("2023-04-31")).to be(false)
        expect(str_yyyy_mm_dd_date?("2023-04-31-10")).to be(false)
      end
    end
  end
end
