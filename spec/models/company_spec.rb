require 'rails_helper'

RSpec.describe Company, type: :model do
    
    before :each do
      @new_company = Company.new(username: "testcompany", profile_image: "", name: "New Company", bio: "blahblahblah", address_1: "12345 Some Street", address_2: "Suite #5", city: "Cool Town", state: "STATE", zip: "77786")
      @other_company = Company.new(username: "othercompany", profile_image: "blerg", name: "Other Company", bio: "blahblahblah", address_1: "12345 Some Street", address_2: "Suite #5", city: "Cool Town", state: "STATE", zip: "77786")
    end

    context "choosing what image to display for a company" do

      it "does not have an image uploaded by a user" do
        assert_equal("https://aeseda.psu.edu/wp-content/themes/theme-mingle/assets/images/placeholder.jpg", @new_company.image_check)
      end

      it "does have an image uploaded by a user" do
        @other_company.profile_image.should be_an_instance_of(String)
    end
  end
end
