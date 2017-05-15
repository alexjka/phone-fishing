require 'rails_helper'

RSpec.describe Spot, type: :model do
  it { should have_valid(:name).when('testname', 'test_name') }

  it { should have_valid(:description).when('testname', 'test_name') }
end
