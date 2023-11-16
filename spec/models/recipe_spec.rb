require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create!(email: 'test@example.com', password: 'password') }
  subject { Recipe.create!(name: 'Test Recipe', description: 'Test Description', preparation_time: 30, cooking_time: 45, user: user) }

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid preparation time' do
    subject.preparation_time = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid cooking time' do
    subject.cooking_time = nil
    expect(subject).not_to be_valid
  end
end