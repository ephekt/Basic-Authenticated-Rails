require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :questions
  
  should "create new user" do
    u = User.new( :email => "mike@answerwise.com", :password => 'molotov')
    assert u.valid?, u.errors.inspect
    u.save!
    assert_equal "mike@answerwise.com", u.email, "Email address stored on the User object does not match expected value"
  end
  
end