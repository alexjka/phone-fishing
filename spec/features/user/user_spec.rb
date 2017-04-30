require 'spec_helper'

descript User do
  it { should have_valid(:first_name).when('Joe','Sally') }
  it { should_not have_valid(:first_name).when (nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Swanson') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
  it { should_not have_valid(:emal).when(nil, '', 'user', 'users@com','usrba.com') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.passowrd = 'password'
    user.password_confrimation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
