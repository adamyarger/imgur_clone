require 'rails_helper'

describe Comment do
	it 'has a valid factory' do
		expect(build(:comment)).to be_valid
	end

	it { should belong_to(:user) }
	it { should belong_to(:post) }
	it { should validate_presence_of(:body) }

end
