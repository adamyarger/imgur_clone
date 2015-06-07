FactoryGirl.define do
  factory :comment do
    post
		user
		body "MyText"
		body_html "MyText"
  end
end
