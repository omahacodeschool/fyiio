FactoryGirl.define do
  factory :progress do
    
  end
  factory :company_invite do
    company_id 1
    auth_code "MyString"
    verified false
  end
  factory :step do
    title "MyText"
    description "MyText"
    chapter_id 1
    draft false
    warning false
    start_time 1
    end_time 1
  end
  factory :chapter do
    title "MyText"
    description "MyText"
    tutorial_id 1
    draft false
    start_time 1
    end_time 1
  end
  factory :tutorial do
    title "MyText"
    description "MyText"
    video "MyString"
    public false
    user_id 1
  end
  factory :company do
    name "MyString"
    username "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    profile_image "MyString"
    bio "MyText"
  end
  factory :user do
    
  end
end
