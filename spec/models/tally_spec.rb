require 'spec_helper'

describe Tally do
  it 'validates user' do
    should validate_presence_of :user_id
  end

  it 'validates axis' do
    should validate_presence_of :axis_id
    should validate_presence_of :axis_type
  end

  it 'belongs to user' do
    should belong_to :user
  end

  it 'belongs to axis' do
    should belong_to :axis
  end
end
