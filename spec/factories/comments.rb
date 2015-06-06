FactoryGirl.define do
  factory :comment do
    post_id 1
		user_id 1
		body "MyText"
		body_html "MyText"
  end
end
