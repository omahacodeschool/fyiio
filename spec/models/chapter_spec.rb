require 'rails_helper'

RSpec.describe Chapter, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#video_time_conversion_for_chapters" do
    it "returns a string with the Chapter start_time and end_time" do
      chapter = Chapter.new(title: "test", start_time: 0, end_time: 120)
      assert_equal("00:00:00 - 00:02:00", chapter.video_time_conversion_for_chapters)
    end
    # may need to add additional contexts for chapters with no start_time and end_time if that is a possible edge case. not sure.
  end

  describe "#get_draft_title_for_chapter" do
    context "chapter is a draft" do
      it "returns a string with DRAFT" do
        chapter = Chapter.new(title: "test draft", draft: 1)
        assert_equal("DRAFT: TEST DRAFT", chapter.get_draft_title_for_chapter)
      end
    end

    context "chapter is not a draft" do
      it "returns a string with EDIT" do
        chapter = Chapter.new(title: "test", draft: 0)
        assert_equal("EDIT: TEST", chapter.get_draft_title_for_chapter)
      end
    end
  end

  # The first context of this test is passing, but it's a false-positive, since the method also returns 0 if the array of a Chapter's Steps' start_times is empty. So both contexts can be thought of as failing, currently.
  # This is happening because, at the time we call get_start_time_step_array_for_chapter on chapter, its id is nil. No idea why. Our guess is that the chapter is not actually being saved, because the model validates presence of a tutorial_id, meaning we need a Tutorial. Moving backward from there we need to also have a User and Company. Not sure how to create a test User here, since Devise requires that the Users have encrypted passwords etc. 

  describe "#get_start_time_step_array_for_chapter" do
    context "start time of first Step is 0" do
      it "returns the start time of the first Step of the Chapter" do
        # company = Company.create(name: "", username: "", address_1: "", city: "", state: "", zip: "")
        # user = User.create(first_name: "", last_name: "User", company_id: company.id)
        # tutorial = Tutorial.create()
        chapter = Chapter.create(title: "test", tutorial_id: 1)
        step1 = Step.create(title: "step1", start_time: 0, end_time: 60, 
                        chapter_id: chapter.id)
        step2 = Step.create(title: "step2", start_time: 60, end_time: 120, 
                        chapter_id: chapter.id)
        step3 = Step.create(title: "step3", start_time: 120, end_time: 180, 
                        chapter_id: chapter.id)
        assert_equal(0, chapter.get_start_time_step_array_for_chapter)
        # do we need to clear the test db here?
      end
    end

    context "start time of first Step is greater than 0" do
      it "returns the start time of the first Step of the Chapter when it is not zero" do
        chapter = Chapter.create(title: "test")
        step1 = Step.create(title: "step1", start_time: 60, end_time: 120, 
                        chapter_id: chapter.id)
        step2 = Step.create(title: "step2", start_time: 120, end_time: 180, 
                        chapter_id: chapter.id)
        assert_equal(60, chapter.get_start_time_step_array_for_chapter)
        # do we need to clear the test db here?
      end
    end
  end
end
