require 'user'

describe User do
  it "should be in any roles assignet to it" do
    user = User.new
    user.assign_role("assigned role")
    user.should be_in_role("assigned role")
  end
  it "should NOT be in any role not assignet to it" do
    user = User.new
    user.should_not be_in_role("unassigned role")
  end
end
