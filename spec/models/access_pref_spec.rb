require 'spec_helper'

describe 'Shitate::ClassMethods' do

  it 'allows to set/get preference ' do
    user = User.create!
    user.address = '123 ABC St.'

    user2 = User.find(user.id)
    user2.address.should eql '123 ABC St.'
    user2.name.should eql 'undefined'
    user2.popular.should be_false
  end


  context 'NoMethodErrors' do
    before {@user = User.create!}
    it {expect {@user.addresses = '1'}.to raise_error}
    it {expect {@user.address = '1'}.to_not raise_error}
    it {expect {@user.addresses }.to raise_error}
    it {expect {@user.address }.to_not raise_error}
  end
end
