require 'rails_helper'

RSpec.describe User, type: :model do
  context "When created" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

     it { should validate_uniqueness_of(:email) }

    it "should validate that :email is in the right format" do
      expect(FactoryBot.build :user, email: Faker::Hobbit.quote).to be_invalid
    end

    it "should be valid with valid attributes" do
      expect(FactoryBot.build :user).to be_valid
    end
  end
end
