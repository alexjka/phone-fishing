require 'rails_helper'

RSpec.describe Report, type: :model do
  it { should have_valid(:body).when('testname', 'test_name') }
end
