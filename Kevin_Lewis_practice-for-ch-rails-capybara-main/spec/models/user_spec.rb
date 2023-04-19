require 'rails_helper'

RSpec.describe User, type: :model do
    subject(:user) do
      User.create!(
        email: "asfsafs@awffs.asfas"
        password: "asdfasdf"
      )
    end
  # pending "add some examples to (or delete) #{__FILE__}"
end


it { should validate_presence_of(:email)}
it {should validate_presence_of(:password_digest)}
it { should validate_length_of(:password).is_at_least(6)}

describe '#is_password?' do
    it 'validates correct password' do
      expect(user.is_password?('lasdfasdf')).to be true
    end

    it 'catches a wrong password' do
      expect(user.is_password?(';lkj;')).to be false
    end
end

describe '#reset_session_token!' do
    it 'creates a new session token for the user' do
      user.valid?
        old_session_token = user.old_session_token
        user.reset_session_token!

        expect(user.session_token).to_not eq(old_session_token)
    end

    it 'returns new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
end

  describe '::find_by_credentials' do
    before {user.save}
      it 'returns user given good credentials' do
        expect(User.find_by_credentials('asfsafs@awffs.asfas', 'asdfasdf')).to eq(user)
      end

      it 'returns nil with bad credentials' do
      expect(User.find_by_credentials(';jlk@awffs.asfas', 'ljk;')).to eq(nil)
      end
  end
