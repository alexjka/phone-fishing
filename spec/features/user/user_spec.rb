require 'spec_helper'

describe User do
  it { should have_valid(:first_name).when('Joe', 'Sally') }
  it { should_not have_valid(:first_name).when(nil,'') }

  it { should have_valid(:last_name).when('Smith', 'Swanson') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'user', 'usrba.com') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
