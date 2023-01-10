require 'rails_helper'

RSpec.describe 'Event Test', type: :model do
    subject do
        @user = User.new(username: 'Yunus')
        Event.new(
            user: @user,
            name: "ye genena Bather",
            image: "https",
            category: "Music and Entertainment",
            date: "2022-01-02",
            time: "11:31:00",
            description: "incredible",
            organizer: "chocho",
            location: "bole",
            price: 250
            )
      end

    it 'the given subject should be valid' do
      expect(subject).to be_valid
    end

    it 'Event is present' do
      expect(subject).to be_present
    end

    it 'Event Name is ' do
        expect(subject.name).to eq("ye genena Bather")
    end

    it 'username is present' do
        expect(subject.price).to be_an(Integer)
      end

end