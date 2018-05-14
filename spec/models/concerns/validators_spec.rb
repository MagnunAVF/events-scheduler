require 'rails_helper'

RSpec.describe Validators do
  context "When validating" do
    it "should validate that :email is in the right format" do
      expect(FactoryBot.build :user).to be_valid
      expect(FactoryBot.build :user, email: Faker::Hobbit.quote).to be_invalid
      expect(FactoryBot.build :user, email: 'foo').to be_invalid
      expect(FactoryBot.build :user, email: 'foo.').to be_invalid
      expect(FactoryBot.build :user, email: 'foo@').to be_invalid
      expect(FactoryBot.build :user, email: 'foo@bar').to be_invalid
      expect(FactoryBot.build :user, email: 'foo@bar.').to be_invalid
      expect(FactoryBot.build :user, email: '@bar').to be_invalid
      expect(FactoryBot.build :user, email: '@bar.').to be_invalid
    end
  end
end
