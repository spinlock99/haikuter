require 'spec_helper'

describe Haiku do
  subject(:haiku) { FactoryGirl.create(:haiku) }

  specify { expect { haiku }.to_not raise_error }

  context "validations" do
    it "fails validation without a poem" do
      Haiku.new.should have(1).error_on(:poem)
    end
    it "fails validation without an associated user" do
      Haiku.new.should have(1).error_on(:user_id)
    end
  end
end
