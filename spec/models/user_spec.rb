require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'test@example.com', password: 'password') }

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'is invalid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is invalid without a password' do
    subject.password = nil
    expect(subject).not_to be_valid
  end

  it 'is invalid with a duplicate email' do
    existing_user = User.create(email: 'test@example.com', password: 'password')
    expect(subject).not_to be_valid
  end
end
