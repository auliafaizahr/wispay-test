require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  subject { User.new(name: Faker::Name.name, email: Faker::Internet.email) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = " "
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = " "
    expect(subject).to_not be_valid
  end

  it 'email not valid' do
    subject.email = "abcd.com"
    expect(subject).to_not be_valid
  end
end
