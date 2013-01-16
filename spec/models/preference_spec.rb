require 'spec_helper'

describe 'Model::Preference' do
  it {true.should be_true}

  describe 'Validation' do 

    it 'should validate properly' do
      pref = Preference.new
      pref.save.should be_false

      user = User.create!
      pref.shitateable = user
      pref.key = 'mypref'
      pref.value = 'hey'

      pref.save.should be_true
    end
  end
end
