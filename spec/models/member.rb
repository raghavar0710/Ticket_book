require 'rails_helper'

RSpec.describe Member, type: :model do

  describe "validations" do
    it 'validate with valid attributes' do
      user = User.create(name: "Raghav Sharma")
      member = Member.create(name: "Shanvi Sharma", contact_number: "1234567890", gender: "female", role: "Passenger", user: user)
      expect(member).to be_valid
    end

    it 'not be valid without a name' do
      user = User.create(name: "Raghav Sharma")
      member = Member.new(contact_number: "1234567890", gender: "female", role: "Passenger", user: user)
      expect(member).not_to be_valid
      expect(member.errors[:name]).to include("can't be blank")
    end

    it 'not be valid with a name of length less than 2' do
      user = User.create(name: "Raghav Sharma")
      member = Member.new(name: "A", contact_number: "1234567890", gender: "female", role: "Passenger", user: user)
      expect(member).not_to be_valid
      expect(member.errors[:name]).to include("is too short (minimum is 2 characters)")
    end

    it 'not be valid with a duplicate name' do
      user = User.create(name: "Raghav Sharma")
      Member.create(name: "Shanvi Sharma", contact_number: "1234567890", gender: "female", role: "Passenger", user: user)
      member = Member.new(name: "Shanvi Sharma", contact_number: "9876543210", gender: "male", role: "Employee", user: user)
      expect(member).not_to be_valid
      expect(member.errors[:name]).to include("has already been taken")
    end

    it 'not be valid with a non-numeric contact_number' do
      user = User.create(name: "Raghav Sharma")
      member = Member.new(name: "Shanvi Sharma", contact_number: "invalid_number", gender: "female", role: "Passenger", user: user)
      expect(member).not_to be_valid
      expect(member.errors[:contact_number]).to include("is not a number")
    end

    it 'not be valid with a contact_number of length other than 10' do
      user = User.create(name: "Raghav Sharma")
      member = Member.new(name: "Shanvi Sharma", contact_number: "123456789", gender: "female", role: "Passenger", user: user)
      expect(member).not_to be_valid
      expect(member.errors[:contact_number]).to include("is the wrong length (should be 10 characters)")
    end
  end

  describe "associations" do
    it "belongs to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end



   

    

    

    
    

    


