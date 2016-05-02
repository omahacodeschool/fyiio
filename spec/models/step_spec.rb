require 'rails_helper'

RSpec.describe Step, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#video_time_conversion_for_steps" do
    it "returns string with start_time and end_time" do
      step = Step.new(title: "Test", draft: 1, start_time: 30, 
                      end_time: 60)
      # took a total guess at how time might be formatted. have no clues from the rest of the application. Pretty sure this is the way to go, based on some debugging in pry.
      assert_equal("00:00:30 - 00:01:00", step.video_time_conversion_for_steps)
    end
  end

  describe "#get_draft_title_for_step" do
    context "the step is a draft" do
      it "returns a string with DRAFT" do
        step = Step.new(title: "Test draft", draft: 1, start_time: 30, 
                      end_time: 60)
        assert_equal("DRAFT: TEST DRAFT", step.get_draft_title_for_step)
      end
    end
    context "the step is not a draft" do
      it "returns a string with EDIT" do 
        step = Step.new(title: "Test", draft: 0, start_time: 120, 
                      end_time: 160)
        assert_equal("EDIT: TEST", step.get_draft_title_for_step)
      end
    end
  end
end
