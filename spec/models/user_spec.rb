require 'spec_helper'

describe User do
  it 'should validate a bunch of shit' do
    should validate_presence_of :email
    should validate_presence_of :first_name
  end
end
