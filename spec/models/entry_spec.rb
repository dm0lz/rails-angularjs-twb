require 'spec_helper'

describe Entry do

  before(:each) do
    @entry = FactoryGirl.create(:entry)
  end 
  
  it "should not be valid without a name" do
    @entry.name = nil
    expect(@entry).to_not be_valid
  end

  it "should be valid with a name" do
    expect(@entry).to be_valid
  end

  it "should not be a winner" do
    expect(@entry.winner).to eq(false)
  end

end
