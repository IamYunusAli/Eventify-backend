require 'rails_helper'

RSpec.describe 'Reservation Test', type: :model do
  subject do
    @user = User.new(username: 'YunusAli')
    @event = Event.new(
      user: @user,
      name: 'ye genena Bather',
      image: 'https',
      category: 'Music and Entertainment',
      date: '2022-01-02',
      time: '11:31:00',
      description: 'incredible',
      organizer: 'chocho',
      location: 'bole',
      price: 250
    )

    Reserve.new(
      user: @user,
      event: @event,
      name: 'Gala',
      date: '2023-01-01',
      city: 'Nairobi'
    )
  end

  it 'the given subject should be valid' do
    expect(subject).to be_valid
  end

  it 'Reservation is present' do
    expect(subject).to be_present
  end

  it 'Reservation Name is ' do
    expect(subject.name).to eq('Gala')
  end
end
