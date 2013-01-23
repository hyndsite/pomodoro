require 'spec_helper'

describe User do
  it "can be instantiated" do
    User.new({:password => "abc123"}).should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    User.create({:email => "test123@pomodoro.com", :password => "abc123", :password_confirmation => "abc123" }).should be_persisted
  end
end
