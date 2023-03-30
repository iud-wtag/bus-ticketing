require 'rails_helper'

RSpec.describe User, type: :model do

  subject { 
    described_class.new( 
      name: "Anything",
      email: "abc@example.com",
      password: "password1234",
      phone: "12345678901",
      user_name: "anything"
    )
  } 
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end 

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end  

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end  
  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end 
  it "is not valid without a phone" do 
    subject.phone = nil
    expect(subject).to_not be_valid
  end 
  it "is not valid without a user_name" do
    subject.user_name = nil
    expect(subject).to_not be_valid
  end  
end
