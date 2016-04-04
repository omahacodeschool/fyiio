require 'rails_helper'

RSpec.describe Tutorial, type: :model do
    before :each do
      @new_tutorial = Tutorial.new(username: "testcompany", profile_image: "", name: "New Company", bio: "blahblahblah", address_1: "12345 Some Street", address_2: "Suite #5", city: "Cool Town", state: "STATE", zip: "77786")
      @other_tutorial = Tutorial.new(username: "othercompany", profile_image: "blerg", name: "Other Company", bio: "blahblahblah", address_1: "12345 Some Street", address_2: "Suite #5", city: "Cool Town", state: "STATE", zip: "77786")
    end
    describe "#privacy_check" do
    context "choosing what image to display for a company" do

      it "does not have an image uploaded by a user" do
        assert_equal("https://aeseda.psu.edu/wp-content/themes/theme-mingle/assets/images/placeholder.jpg", @new_company.image_check)
      end

      it "does have an image uploaded by a user" do
        assert_equal("blerg", @other_company.image_check)
      end
    end
  end
end
