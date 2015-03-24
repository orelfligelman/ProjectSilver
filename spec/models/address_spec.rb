require 'rails_helper'


RSpec.describe Address, :type => :model do

   describe "model validations" do
     context "initial setup with and without factories" do

     it "has a valid factory" do
       expect(build(:address)).to be_valid
     end
     it "is valid with a street name and number, building/house address, city, state, county, and zip code" do
    address = Address.new(streetname:'5th Avenue', streetnumber:'West 23rd Street', building:'184',city:'Manhattan',state:'NY', zipcode:'10010')
    expect(address).to be_valid
      end
     end
   end

   #These test whether the model has been created with the correct fields
   describe "model invalidations (with and without) factories" do
    it "is invalid without a street name" do
      address = build(:address, streetname: nil)
      address.valid?
      expect(address.errors[:streetname]).to include("can't be blank")
    end
    it "is invalid without a street number" do
      address = build(:address, streetnumber: nil)
      address.valid?
      expect(address.errors[:streetnumber]).to include("can't be blank")
    end
    it "is invalid without a building/house address" do
      address = build(:address, building: nil)
      address.valid?
      expect(address.errors[:building]).to include("can't be blank")
    end
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
    it "is invalid without a state" do
      address = build(:address, state: nil)
      address.valid?
      expect(address.errors[:state]).to include("can't be blank")
    end
    it "is invalid without a county" do
      address = build(:address, county: nil)
      address.valid?
      expect(address.errors[:county]).to include("can't be blank")
    end
    it "is invalid without a zip code" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end
    it "is invalid with a duplicate address (without a factory)" do
      address1 = Address.new(streetname:'5th Avenue', streetnumber:'West 23rd Street', building:'184',city:'Manhattan',state:'NY', zipcode:'10010')
      address2 = Address.new(streetname:'5th Avenue', streetnumber:'West 23rd Street', building:'184',city:'Manhattan',state:'NY', zipcode:'10010')
      expect(address2.create).not_to be_valid
    end
    it "is invalid with a duplicate address(with a factory)" do
      create(:address)
      address2 = build(:address)
      address2.valid?
      expect(address2.errors[:hmmmmm]).to include ('Address has already been put in')
    end
   end

   #These test whether the fields of the model are valid

   describe "model data that has proper fields but the data is wrong (wrong type, too long, too short, etc.)" do
     it "is invalid with a street name that doesn't contain avenue, road, boulevard" do
       @address = build(:address)
       if @address.streetname.include?['Boulevard', 'Road', 'Avenue', 'Street'] #etc. there's a better way to test this...
         expect(@address.create).to_not be_valid
       end
     end
     it "is invalid if you enter more or less then 5 digits for the zip code" do
       @address = build(:address)
       if @address.zipcode.length > 5 || @address.zipcode.length < 5
         expect(@address.create).not_to be_valid
       end
     end
     it 'is invalid if you enter a state that doesnt exist' do
       @address = build(:address)
       if @address.state.include? [:states]
         expect(@address.create).to be_valid
       end
     end
     it 'is invalid if you enter a zipcode that is not located inside the state' do
       @address = build(:address)
       if @address.state == "NY" && @address.zipcode.!include?[:valid_zip_codes_in_Ny]
         expect(@address.create).not_to be_valid
       end
     end
     it 'is invalid if you enter an address that does not exist' do
       @address = build(:address)
       if @address.NOTCONTAINEDINGOOGLEAPI
         expect(@address).not_to be_valid
       end
     end
     it "is invalid if the street name is two letters or less" do
       @address = build(:address)
       if @address.two_letters?
         flash[:error] "Invalid input. Please put in more letters"
       end
     end
   end

   #these tests check to make sure the model is behaving the way we want them to

    describe "class method behavior" do
    #context
    before :each do
      @address = create(:address)
    end


    it "returns a sorted array of all cities based on the first two letters matching" do
    @address = Address.new(streetname:'5th Avenue', streetnumber:'West 23rd Street', building:'184',city:'Manhattan',state:'NY', zipcode:'10010')
    expect(Address.method_to_be_implemented("N")).to eq[NY,NJ,NH]
    end

     it "returns nothing if a letter does not match" do
    address = Address.new(streetname:'5th Avenue', streetnumber:'West 23rd Street', building:'184',city:'Manhattan',state:'NY', zipcode:'10010')
    expect(Address.method_to_be_implemented("Z")).not_to include NY
    end
    it "returns associated zipcode,city, and county for given state" do
     expect(Addres.method_that_does_lookup).to include zipcode, city, state,
    end
  end
end
