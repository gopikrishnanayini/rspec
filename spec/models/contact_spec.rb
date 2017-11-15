require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe Contact, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:contact).should be_valid
  end
  it "is invalid without a firstname"
  it "is invalid without a lastname"
  it "returns a contact's full name as a string"

  it "has a valid factory" do
    FactoryGirl(:contact).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:contact, firstname: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    FactoryGirl.build(:contact, lastname: nil).should_not be_valid
  end

  it "returns a contact's full name as a string" do
    FactoryGirl(:contact, firstname: "John", lastname: "Doe").name.should == "John Doe"
  end

  describe "filter last name by letter" do      
    before :each do
      @smith = FactoryGirl(:contact, lastname: "Smith")
      @jones = FactoryGirl(:contact, lastname: "Jones")
      @johnson = FactoryGirl(:contact, lastname: "Johnson")
    end

    context "matching letters" do
      it "returns a sorted array of results that match" do
        Contact.by_letter("J").should == [@johnson, @jones]
      end
    end

    context "non-matching letters" do
      it "does not return contacts that don't start with the provided letter" do
        Contact.by_letter("J").should_not include @smith
      end
    end
  end
end