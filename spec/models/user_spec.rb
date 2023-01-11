require 'rails_helper'

RSpec.describe 'User test', type: :model do
  subject do
    User.new(username: 'Yunus')
  end

  it 'the given subject should be valid' do
    expect(subject).to be_valid
  end

  it 'username is present' do
    expect(subject.username).to be_present
  end

  it 'username to be Yunus' do
    expect(subject.username).to eq('Yunus')
  end
end
